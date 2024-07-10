package com.softshop.ecommerce.order;

import com.softshop.ecommerce.customer.CustomerClient;
import com.softshop.ecommerce.exception.BusinessException;
import com.softshop.ecommerce.kafka.OrderConfirmation;
import com.softshop.ecommerce.kafka.OrderProducer;
import com.softshop.ecommerce.orderline.OrderLineRequest;
import com.softshop.ecommerce.orderline.OrderLineService;
import com.softshop.ecommerce.product.ProductClient;
import com.softshop.ecommerce.product.PurchaseRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final CustomerClient customerClient;
    private final ProductClient productClient;
    private final OrderMapper orderMapper;
    private final OrderLineService orderLineService;
    private final OrderProducer orderProducer;
    public Integer createdOrder(OrderRequest orderRequest) {
        // check the customer --> OpenFeign
        var customer = this.customerClient.findCustomerById(orderRequest.customerId())
                .orElseThrow(() -> new BusinessException("Cannot create order:: No Customer exists with the provided ID"));

        //purchase the products --> product-ms (RestTemplate)
        var purchasedProducts = this.productClient.purchaseProducts(orderRequest.products());

        //persist order
        var order = this.orderRepository.save(orderMapper.toOrder(orderRequest));

        //persist order lines
        for (PurchaseRequest purchaseRequest : orderRequest.products()){
            orderLineService.saveOrderLine(
                    new OrderLineRequest(
                            null,
                            order.getId(),
                            purchaseRequest.productId(),
                            purchaseRequest.quantity()
                    )
            );
        }

        //start payment process
        orderProducer.sendOrderConfirmation(
                new OrderConfirmation(
                        orderRequest.reference(),
                        orderRequest.amount(),
                        orderRequest.paymentMethod(),
                        customer,
                        purchasedProducts
                )
        );

        //send the order confirmation --> notification-ms (kafka)
        return order.getId();
    }
}
