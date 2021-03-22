package Other;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static boolean sendMail(String to, String subject, String text) {
		final String email = "nlts20197@gmail.com";
		final String password = "thesinh20197";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});
		try {
			 Message message = new MimeMessage(session); 
			message.setHeader("Content-Type", "text/plain ; charset=UTF-8");
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(text);
			Transport.send(message);
			System.out.println("Gui Mail thanh cong");
		} catch (MessagingException e) {
			// throw new RuntimeException(e);
			e.printStackTrace();
			System.out.println("Gui Mail that bai");
			return false;
		}
		return true;

	}

	public static void main(String[] arg) {
		System.out.println(sendMail("nguyentuan2698@gmail.com", "TS Homeware", "Hello"));
	}
}
