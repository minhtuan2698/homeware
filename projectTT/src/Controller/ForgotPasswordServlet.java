package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ForgotPasswordDAO;
import Other.Mail;



@WebServlet(urlPatterns = {"/forgotPassword"})
public class ForgotPasswordServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ForgotPasswordDAO forgotPasswordDAO=new ForgotPasswordDAO();
		String email= req.getParameter("email");
		System.out.println("sss"+ email);
	
	PrintWriter printWriter=resp.getWriter();
	
	try {
		if (forgotPasswordDAO.checkEmailExits(email)) {
			
			
			Mail.sendMail(email, "Tim lai mat khau", Mail.messageForgot(email));
			printWriter.print("success");
			resp.getWriter();
		}
		else {
			printWriter.print("fail");
			resp.getWriter();
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	}
}