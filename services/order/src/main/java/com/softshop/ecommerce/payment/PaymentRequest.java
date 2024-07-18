package com.softshop.ecommerce.payment;

import com.softshop.ecommerce.customer.CustomerResponse;
import com.softshop.ecommerce.order.PaymentMethod;

import java.math.BigDecimal;

public record PaymentRequest(
        BigDecimal amount,
        PaymentMethod paymentMethod,
        Integer orderId,
        String orderReference,
        CustomerResponse customer
) {
}
