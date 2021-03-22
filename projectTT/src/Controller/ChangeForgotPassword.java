package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ForgotPasswordDAO;



@WebServlet(urlPatterns = "/changeForgotPassword")
public class ChangeForgotPassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String emailString= req.getParameter("email");
		String passString= req.getParameter("pass");
		System.out.print(passString);
		PrintWriter printWriter= resp.getWriter();
		ForgotPasswordDAO forgotPasswordDAO=new ForgotPasswordDAO();
		try {
			if(forgotPasswordDAO.changePassword(emailString, passString)) {
				System.out.print("a");
				//resp.sendRedirect("Views/Login.jsp");
				printWriter.print("success");
				resp.getWriter();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}