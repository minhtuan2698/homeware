package ControllerAdmin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.GoodReceiptDAO;
import Dao.GoodReceiptDetailDAO;
import Model.GoodReceiptDetail;
import Model.InvoiceDetail;


@WebServlet("/ReceiptServlet_View")
public class ReceiptServlet_View extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodReceiptDAO grDAO = new GoodReceiptDAO();
	GoodReceiptDetailDAO grdDAO = new GoodReceiptDetailDAO();
       
    
    public ReceiptServlet_View() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		int ID_Receipt = Integer.parseInt(request.getParameter("ID_Receipt"));
		 ArrayList<GoodReceiptDetail> grd1=null;
		try {
			switch (action) {
			
			case "Views":
				grd1 = grdDAO.listGoodReceiptDetailbyID(ID_Receipt);
						
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		url = "/Admin/GoodReceiptDetail.jsp";
		request.setAttribute("receiptDetails", grd1);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
