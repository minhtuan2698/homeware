package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.GoodReceiptDAO;


@WebServlet("/ReceiptServlet_Delete")
public class ReceiptServlet_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodReceiptDAO grDAO = new GoodReceiptDAO();
       
    
    public ReceiptServlet_Delete() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		int ID_Receipt = Integer.parseInt(request.getParameter("ID_Receipt"));
		String url = "";
		request.setAttribute("ID_Receipt", ID_Receipt);
		try {
			switch (action) {
			case "Delete":
				grDAO.deleteGoodReceipt(ID_Receipt);
				url = "/Admin/GoodReceipt.jsp";
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
