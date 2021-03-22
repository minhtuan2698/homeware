package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AccountDAOImpl;
import Model.Account;
import Model.AccountSession;


@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AccountDAOImpl accDAO = new AccountDAOImpl();

	public EditProfile() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
	
		String action = request.getParameter("action");
		String url = "";
		String ID_Account = request.getParameter("ID_Account");
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		String Email = request.getParameter("Email");
		String Fullname = request.getParameter("Fullname");
		String Address = request.getParameter("Address");
		String Phone = request.getParameter("Phone");
		

		String password_error = "", fullname_error = "", address_error = "", phone_error = "";

		// Validate Password
		if (Password.equals("")) {
			password_error = "(*) Mật khẩu không được để trống !";
		}
		if (password_error.length() > 0) {
			request.setAttribute("password_error", password_error);
		}
		/*
		 * // Validate Email if (Email.equals("")) { email_error =
		 * "Vui lòng nhập Email của bạn !"; } else { if (accDAO.checkEmail(Email) ==
		 * true) { email_error =
		 * "Email này đã được đăng ký, vui lòng nhập Email khác !"; } } if
		 * (email_error.length() > 0) { request.setAttribute("email_error",
		 * email_error); }
		 */
		// Validate Fullname
		if (Fullname.equals("")) {
			fullname_error = "(*) Họ và tên không được bỏ trống !";
		}
		if (fullname_error.length() > 0) {
			request.setAttribute("fullname_error", fullname_error);
		}
		// Validate địa Chỉ
		if (Address.equals("")) {
			address_error = "(*) Địa chỉ không được bỏ trống !";
		}
		if (address_error.length() > 0) {
			request.setAttribute("address_error", address_error);
		}
		// Validate SDT
		if (Phone.equals("")) {
			phone_error = "(*) Số điện thoại không được bỏ trống !";
		}
		if (phone_error.length() > 0) {
			request.setAttribute("phone_error", phone_error);
		}
		request.setAttribute("Username", Username);
		request.setAttribute("Password", Password);
		request.setAttribute("Email", Email);
		request.setAttribute("Fullname", Fullname);
		request.setAttribute("Address", Address);
		request.setAttribute("Phone", Phone);
		
		try {
			switch (action) {
			case "Update1":

				if (password_error.length() == 0  && fullname_error.length() == 0
						&& address_error.length() == 0 && phone_error.length() == 0) {
					Account acc = new Account(ID_Account, Username, Password, Email, Fullname, Address, Phone);
					accDAO.updateAccount1(acc);
					HttpSession session = request.getSession();
					
					session.setAttribute("memberSession", acc);
					url = "/index.jsp";
					break;
				} else {
					url = "/profile.jsp";
			
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
