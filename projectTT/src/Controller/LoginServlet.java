package Controller;

import java.io.IOException;

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


public class LoginServlet extends HttpServlet {
	private AccountDAOImpl taiKhoanDAO = new AccountDAOImpl();
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String usernamex = request.getParameter("ten_dang_nhap");
		String passwordx = request.getParameter("mat_khau");
		int access1 = Integer.parseInt(request.getParameter("access"));
		int status1 = Integer.parseInt(request.getParameter("status"));
		String error = "";

		if (usernamex.equals("") || passwordx.equals("")) {
			error = "Vui lòng nhập đầy đủ thông tin !";
		} else if (taiKhoanDAO.checkLogin(usernamex, passwordx, access1, status1) == false) {
			error = "Quyền chưa được cấp hoặc Tài Khoản hoặc Mật Khẩu không chính xác !";
		} else if (taiKhoanDAO.checkLogin1(usernamex, passwordx, access1, status1) == false) {
			error = "Quyền chưa được cấp hoặc Tài Khoản hoặc Mật Khẩu không chính xác !";
		}
		if (error.length() > 0) {
			request.setAttribute("error", error);
		}

		String url = "/account.jsp";
		AccountDAOImpl accountDAO = new AccountDAOImpl();
		Account acc = accountDAO.getUser(usernamex, passwordx);
		if(acc.getUsername()!=null) {
			if(acc.getAccess()==2) {
				url = "/index.jsp";				
			}else if (acc.getAccess()==1 || acc.getAccess()==3 || acc.getAccess()==4) {
				url = "/Admin/index.jsp";
				
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("memberSession", acc);
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("enter").equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("account.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
