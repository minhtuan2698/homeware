package Other;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class Mail {
	public static void main(String[] args) {

	}
	public static String messageForgot(String email) {
		String urlString="http://localhost:8080/TheSinh_Homeware/ForgotPassword.jsp?email="+email;
		String string = "<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"<head>\r\n" + 
				"    <meta charset=\"UTF-8\">\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
				"    <title>Document</title>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"    <div style=\"width:500px; margin:auto\">\r\n" + 
				"    <div>\r\n" + 
				"        <p style=\"font-size: 36px; text-align: center; margin-bottom: 0px\">Thay đổi mật khẩu</p>\r\n" + 
				"        <hr>\r\n" + 
				"    </div>\r\n" + 
				"    \r\n" + 
				"    <div>\r\n" + 
				"        <p>TS-HOMEWAR XIN CHÀO! Vui lòng nhấn vào nút mật khẩu mới để thay đổi mật khẩu.</p>\r\n" + 
				"        <div style=\"text-align: center; margin: 50px 0px\">\r\n" + 
				"        <a class=\"btn btn-success\" style=\"color: #fff; background-color: #28a745; border-color: #28a745;text-decoration: none;border-radius: 5px; padding: 10px\" href=\""
				+urlString+"\">Mật khẩu mới</a>\r\n" + 
				"        </div>\r\n" + 
				"        \r\n" + 
				"    </div>\r\n" + 
				"    <div>\r\n" + 
				"        <p>Sau khi nhấn nút, Bạn sẽ được chuyển đến trang thay đổi mật khẩu</p>\r\n" + 
				"    </div>\r\n" + 
				"</div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
		return string;
	}
	
	
	 public static boolean sendMail(String to, String subject, String message){
			
		 try{
	         String host ="smtp.gmail.com" ;
	         String user = "nlts20197@gmail.com";
	         String pass = "thesinh20197";
	         String from = "nlts20197@gmail.com";
	       //  String messageText = "Your Is Test Email :";
	         boolean sessionDebug = false;

	         Properties props = System.getProperties();

	         props.put("mail.smtp.starttls.enable", "true");
	         props.put("mail.smtp.host", host);
	         props.put("mail.smtp.port", "587");
	         props.put("mail.smtp.auth", "true");
	         props.put("mail.smtp.starttls.required", "true");

	         java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	         Session mailSession = Session.getDefaultInstance(props, null);
	         mailSession.setDebug(sessionDebug);
	         Message msg = new MimeMessage(mailSession);
	         msg.setFrom(new InternetAddress(from));
	         InternetAddress[] address = {new InternetAddress(to)};
	         msg.setRecipients(Message.RecipientType.TO, address);
	         msg.setSubject(subject); msg.setSentDate(new Date());
	         msg.setContent(message,"text/html; charset=utf-8");

	        Transport transport=mailSession.getTransport("smtp");
	        transport.connect(host, user, pass);
	        transport.sendMessage(msg, msg.getAllRecipients());
	        transport.close();
	        return true;
	     }catch(Exception ex)
	     {
	         System.out.println(ex);
	     }
		 return false;
		 }
}
