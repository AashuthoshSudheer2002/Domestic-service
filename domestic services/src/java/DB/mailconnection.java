package DB;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

/**
 *
 * @author Aashuthosh
 */
public class mailconnection {
    public synchronized static boolean sendMail(String[] to,String subject,String text){
            
            System.out.println("mail  "+to[0]+" "+subject+" "+text);
//String host="smtp.gmail.com";
String port="587";
String starttls="true";
String auth="true";
boolean debug=true;
String socketFactoryClass="javax.net.ssl.SSLSocketFactory";
String fallback="false";
String user="vservofficial@gmail.com";//Enter Your Email
String pass="wlkshontlvhzdvhm";//password
            System.out.println("\n\n\n, insideemailsender....");
   
             Properties props = System.getProperties();
  String host = "smtp.gmail.com";

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.smtp.ssl.trust", host);
    props.put("mail.smtp.user", user);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");


    Session session = Session.getDefaultInstance(props);
    MimeMessage message = new MimeMessage(session);

            
      try {


        message.setFrom(new InternetAddress(user));
        InternetAddress[] toAddress = new InternetAddress[to.length];

        // To get the array of addresses
        for( int i = 0; i < to.length; i++ ) {
            toAddress[i] = new InternetAddress(to[i]);
        }

        for( int i = 0; i < toAddress.length; i++) {
            message.addRecipient(Message.RecipientType.TO, toAddress[i]);
        }



        message.setSubject(subject);
        message.setText(text);


        Transport transport = session.getTransport("smtp");


        transport.connect(host, user, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        return true;
    }
    catch (AddressException ae) {
        ae.printStackTrace();
        return  false;
    }
    catch (MessagingException me) {
        me.printStackTrace();
        return  false;
    }
    }
}