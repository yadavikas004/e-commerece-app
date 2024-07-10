package com.softshop.ecommerce.kafka;

import com.softshop.ecommerce.customer.CustomerResponse;
import com.softshop.ecommerce.order.PaymentMethod;
import com.softshop.ecommerce.product.PurchaseResponse;

import java.math.BigDecimal;
import java.util.List;

public record OrderConfirmation(
        String orderReference,
        BigDecimal totalAmount,
        PaymentMethod paymentMethod,
        CustomerResponse customerResponse,
        List<PurchaseResponse> products
) {
}
