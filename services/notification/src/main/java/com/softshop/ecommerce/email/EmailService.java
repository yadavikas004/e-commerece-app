package com.softshop.ecommerce.email;

import com.softshop.ecommerce.kafka.order.Product;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring6.SpringTemplateEngine;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.softshop.ecommerce.email.EmailTemplates.ORDER_CONFIRMATION;
import static com.softshop.ecommerce.email.EmailTemplates.PAYMENT_CONFIRMATION;
import static java.nio.charset.StandardCharsets.UTF_8;
import static org.springframework.mail.javamail.MimeMessageHelper.MULTIPART_MODE_RELATED;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {

    private final JavaMailSender javaMailSender;
    private final SpringTemplateEngine springTemplateEngine;

    @Async
    public void sentPaymentSuccessEmail(
            String destinationEmail,
            String customerName,
            BigDecimal amount,
            String orderReference
    ) throws MessagingException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, MULTIPART_MODE_RELATED, UTF_8.name());
        mimeMessageHelper.setFrom("yadavikas97019@gmail.com");
        final String templateName = PAYMENT_CONFIRMATION.getTemplate();
        Map<String,Object> variables = new HashMap<>();
        variables.put("customerName",customerName);
        variables.put("amount",amount);
        variables.put("orderReference",orderReference);

        Context context = new Context();
        context.setVariables(variables);
        mimeMessageHelper.setSubject(PAYMENT_CONFIRMATION.getSubject());

        try {
            String htmlTemplate = springTemplateEngine.process(templateName,context);
            mimeMessageHelper.setText(htmlTemplate,true);
            mimeMessageHelper.setTo(destinationEmail);
            javaMailSender.send(mimeMessage);
            log.info(String.format("INFO - Email successfully sent to %s with template %s, ",destinationEmail,templateName));
        }catch (MessagingException exception){
            log.warn("WARNING - Cannot send email to {} ",destinationEmail);
        }
    }

    @Async
    public void sentOrderConfirmationEmail(
            String destinationEmail,
            String customerName,
            BigDecimal amount,
            String orderReference,
            List<Product> products
    ) throws MessagingException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, MULTIPART_MODE_RELATED, UTF_8.name());
        mimeMessageHelper.setFrom("yadavikas97019@gmail.com");
        final String templateName = ORDER_CONFIRMATION.getTemplate();
        Map<String,Object> variables = new HashMap<>();
        variables.put("customerName",customerName);
        variables.put("totalAmount",amount);
        variables.put("orderReference",orderReference);
        variables.put("products",products);

        Context context = new Context();
        context.setVariables(variables);
        mimeMessageHelper.setSubject(ORDER_CONFIRMATION.getSubject());

        try {
            String htmlTemplate = springTemplateEngine.process(templateName,context);
            mimeMessageHelper.setText(htmlTemplate,true);
            mimeMessageHelper.setTo(destinationEmail);
            javaMailSender.send(mimeMessage);
            log.info(String.format("INFO - Email successfully sent to %s with template %s, ",destinationEmail,templateName));
        }catch (MessagingException exception){
            log.warn("WARNING - Cannot send email to {} ",destinationEmail);
        }
    }
}
