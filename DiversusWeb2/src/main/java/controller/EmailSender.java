package controller;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
    public static void sendEmail(List<String> emails, String htmlContent) throws MessagingException {
        String host = "smtp.gmail.com";
        String from = "plataforma.diversus@gmail.com";
        String pass = "nphp xjih nzeo uyau";
        
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");


        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(from, pass);
            }
        });

        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);

        System.out.println("Enviando para " + emails.size() + " emails!");

        for (String to : emails) {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Newsletter");
            message.setContent(htmlContent, "text/html");
            transport.sendMessage(message, message.getAllRecipients());
        }
        transport.close();
    }
}
