package model;

import model.EmailDAO;
import model.NewsletterDAO;
import controller.EmailSender;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;

public class Newsletter {
    private final List<String> emails;

    public Newsletter() {
        this.emails = new ArrayList<>();
    }

    public void addEmail(String email) {
        emails.add(email);
    }

    public void removeEmail(String email) {
        emails.remove(email);
    }

    
}
