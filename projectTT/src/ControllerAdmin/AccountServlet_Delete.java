package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AccountDAOImpl;


@WebServlet("/AccountServlet_Delete")
public class AccountServlet_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AccountDAOImpl accDAO = new AccountDAOImpl();
       
   
    public AccountServlet_Delete() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  request.setCharacterEncoding("UTF-8");
		  response.setCharacterEncoding("UTF-8");
		  String action = request.getParameter("action");
		  String ID_Account = request.getParameter("ID_Account"); 
		  String url = ""; 
		  try {
			  switch (action) {
		  case "Delete": 
			  accDAO.deleteAccount(ID_Account);
		  url = "/Admin/account_manager.jsp";
		  break;
		  }
			  }
		  catch (Exception e) {
		  e.printStackTrace(); 
		  }
		  RequestDispatcher rd =getServletContext().getRequestDispatcher(url); 
		  rd.forward(request, response);
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
