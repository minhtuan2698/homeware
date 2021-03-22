package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restfb.types.User;

import Dao.AccountDAO;
import Dao.AccountDAOImpl;
import Model.Account;
import Model.AccountSession;

@WebServlet("/LoginFacebook")
public class LoginFacebook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginFacebook() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = "KH" + request.getParameter("id");
		System.out.println(name + " " + id + " " + email);

		String pass = "";
		String fullname = "";
		String address = "";
		String phone = "";
		Account acc=null;
		
		AccountDAOImpl accountDAO = new AccountDAOImpl();
		acc = accountDAO.getUser(id);
		acc.setUsername(name);
		System.out.println(acc.getUsername());
		if (acc.getUsername()==null) {
			
			acc = new Account(id, name, pass, email, fullname, address, phone, 2, 1);
			accountDAO.insertAccount(acc);
		}
		session.setAttribute("memberSession", acc);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
