package com.softshop.ecommerce.kafka;

import com.softshop.ecommerce.email.EmailService;
import com.softshop.ecommerce.kafka.order.OrderConfirmation;
import com.softshop.ecommerce.kafka.payment.PaymentConfirmation;
import com.softshop.ecommerce.notification.Notification;
import com.softshop.ecommerce.notification.NotificationRepository;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

import static com.softshop.ecommerce.notification.NotificationType.PAYMENT_CONFIRMATION;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationConsumer {

    private final NotificationRepository notificationRepository;
    private final EmailService emailService;

    @KafkaListener(topics = "payment-topic")
    public void consumePaymentSuccessNotification(PaymentConfirmation paymentConfirmation) throws MessagingException {
        log.info(String.format("Consuming the message from payment-topic Topic:: %s",paymentConfirmation));
        notificationRepository.save(
                Notification.builder()
                        .notificationType(PAYMENT_CONFIRMATION)
                        .notificationDate(LocalDateTime.now())
                        .paymentConfirmation(paymentConfirmation)
                        .build()
        );

        var customerName = paymentConfirmation.customerFirstname()+ " " + paymentConfirmation.customerLastname();
        emailService.sentPaymentSuccessEmail(
                paymentConfirmation.customerEmail(),
                customerName,
                paymentConfirmation.amount(),
                paymentConfirmation.orderReference()
        );
    }

    @KafkaListener(topics = "order-topic")
    public void consumeOrderConfirmationNotification(OrderConfirmation orderConfirmation) throws MessagingException {
        log.info(String.format("Consuming the message from order-topic Topic:: %s",orderConfirmation));
        notificationRepository.save(
                Notification.builder()
                        .notificationType(PAYMENT_CONFIRMATION)
                        .notificationDate(LocalDateTime.now())
                        .orderConfirmation(orderConfirmation)
                        .build()
        );

        var customerName = orderConfirmation.customer().firstname()+ " " + orderConfirmation.customer().lastname();
        emailService.sentOrderConfirmationEmail(
                orderConfirmation.customer().email(),
                customerName,
                orderConfirmation.totalAmount(),
                orderConfirmation.orderReference(),
                orderConfirmation.productList()
        );
    }
}
