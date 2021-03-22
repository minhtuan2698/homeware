package ControllerAdmin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.InvoiceDetailDAOImpl;
import Model.InvoiceDetail;


@WebServlet("/InvoiceHistoryDetailAdmin")
public class InvoiceHistoryDetailAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDetailDAOImpl invoiceDetailDAO1 = new InvoiceDetailDAOImpl();
  
    public InvoiceHistoryDetailAdmin() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		 String ID_Invoice1 = request.getParameter("ID_Invoice");
		 ArrayList<InvoiceDetail> invoiceDetails1=null;
		try {
			switch (action) {
			
			case "Views":
				invoiceDetails1 = invoiceDetailDAO1.getListInvoiceHistoryDetail(ID_Invoice1);
						
				url = "/Admin/historyDetailAdmin.jsp";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("listDetails", invoiceDetails1);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}