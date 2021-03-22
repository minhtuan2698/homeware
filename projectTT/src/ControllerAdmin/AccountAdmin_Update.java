package ControllerAdmin;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AccountDAOImpl;
import Model.Account;


@WebServlet("/AccountAdmin_Update")
public class AccountAdmin_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AccountDAOImpl accDAO = new AccountDAOImpl();

	public AccountAdmin_Update() {
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
		/*
		 * Account member = new Account();
		 * 
		 * member = accDAO.getAccount(AccountSession.Username);
		 */
		/* System.out.print(MemberSession.password); */
		/* String currentpass = MemberSession.password; */
		HttpSession session = request.getSession();
		Account member= new Account();
		member = (Account) session.getAttribute("memberSession");
		
		String action = request.getParameter("action");
		String url = "";
		String ID_Account = request.getParameter("ID_Account");
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		String Email = request.getParameter("Email");
		String Fullname = request.getParameter("Fullname");
		String Address = request.getParameter("Address");
		String Phone = request.getParameter("Phone");
		
		 

		String password_error = "", email_error = "", fullname_error = "", address_error = "", phone_error = "",
				access_error = "", status_error = "";

		// định dạng email
		String emailPattern = "^[\\w!#$%&�*+/=?`{|}~^-]+(?:\\.[\\w!#$%&�*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
		  Pattern regex = Pattern.compile(emailPattern);
	        Matcher matcher = regex.matcher(Email);
	        //định dạng sđt
	        Pattern pattern = Pattern.compile("^(0)+[0-9]*$");
	        Matcher matcher1 = pattern.matcher(Phone);
	        // định dạng username
	          Pattern pattern1 = Pattern.compile("^[a-zA-Z0-9-]*$");
	          Matcher matcher2 = pattern1.matcher(Username);
		if (Password.equals("")) {
			password_error = "Vui lòng nhập mật khẩu của bạn !";
		}
		if (password_error.length() > 0) {
			request.setAttribute("password_error", password_error);
		}
		// Validate Email
		if (Email.equals("")) {
			email_error = "Vui lòng nhập Email của bạn !";
		}
		/*
		 * else { if (accDAO.checkEmail(Email) == true) { email_error =
		 * "Email này đã được đăng ký, vui lòng nhập Email khác !"; } }
		 */
		if (!Email.equals("") && !matcher.find() ) {
			email_error = "Vui lòng nhập đúng định dạng email !";
		}
		if (email_error.length() > 0) {
			request.setAttribute("email_error", email_error);
		}
		// Validate Fullname
		if (Fullname.equals("")) {
			fullname_error = "Vui lòng nhập họ và tên của bạn !";
		}
		if(!Fullname.equals("") &&  Fullname.length()<4){
			address_error = "Vui lòng nhập đúng họ và tên!";
			}
		if (fullname_error.length() > 0) {
			request.setAttribute("fullname_error", fullname_error);
		}
		// Validate địa Chỉ
		if (Address.equals("")) {
			address_error = "Vui lòng nhập địa chỉ của bạn !";
		}
		if(!Address.equals("") &&  Address.length()<6){
			address_error = "Vui lòng nhập đúng địa chỉ !";
			}
		if (address_error.length() > 0) {
			request.setAttribute("address_error", address_error);
		}
		// Validate SDT
		if (Phone.equals("")) {
			phone_error = "Vui lòng nhập số điện thoại của bạn !";
		}
		if(!Phone.equals("") && Phone.length()>12 || Phone.length()<8){
			phone_error = "Số điện thoại phải trên 8 số và dưới 12 số !";
			}
		if (!matcher1.matches()) {
			phone_error = "Vui lòng nhập đúng định dạng số điện thoại!";
        } 
		if (phone_error.length() > 0) {
			request.setAttribute("phone_error", phone_error);
		}
		
		
	
		request.setAttribute("Password", Password);
		request.setAttribute("Email", Email);
		request.setAttribute("Fullname", Fullname);
		request.setAttribute("Address", Address);
		request.setAttribute("Phone", Phone);
		
		 
		 
		try {
			switch (action) {
			case "Update":

				if (password_error.length() == 0 && email_error.length() == 0 && fullname_error.length() == 0
						&& address_error.length() == 0 && phone_error.length() == 0 ) {
					Account acc = new Account(ID_Account, Username, Password, Email, Fullname, Address, Phone, 1,
							1);
					accDAO.updateAccount(acc);
                   
					session.setAttribute("memberSession", acc);
					
					url = "/Admin/account_manager.jsp";
					break;
				} else {
					/* url = "/Admin/account_edit.jsp"; */
					url = "/Admin/editprofileadmin.jsp";
					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
