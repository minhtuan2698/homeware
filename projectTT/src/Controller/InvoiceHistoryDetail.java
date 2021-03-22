package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.InvoiceDAOImpl;
import Dao.InvoiceDetailDAOImpl;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Shipper;
import Dao.ProductDAOImpl;
import Dao.ShipperDAO;


@WebServlet("/InvoiceHistoryDetail")
public class InvoiceHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDetailDAOImpl invoiceDetailDAO = new InvoiceDetailDAOImpl();
	private static InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private ShipperDAO shipDAO = new ShipperDAO();
  
    public InvoiceHistoryDetail() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		 String ID_Invoice = request.getParameter("ID_Invoice");
		 ArrayList<InvoiceDetail> invoiceDetails=null;
		 Date d = new Date();
			SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
			String date = formatDay.format(d);
			
		try {
			switch (action) {
			
			case "View":
				invoiceDetails = invoiceDetailDAO.getListInvoiceHistoryDetail(ID_Invoice);
						
				url = "/historyDetail.jsp";
				break;
			case "Cancel":
				Shipper ship = new Shipper();
				int k =1;
				ship.setID_Shipper(shipDAO.getShipper(k).getID_Shipper());
				
				invoiceDAO.updateInvoice1(new Invoice(ID_Invoice, null, null, null, null, 3,0,ship, null, date));
				ArrayList<InvoiceDetail> listInvoice = invoiceDetailDAO.getListUpdateProduct(ID_Invoice);
				for (InvoiceDetail invoiceDetail : listInvoice) {
					
					proDAO.updateQuantity1(invoiceDetail.getQuantity(), invoiceDetail.getSan_Pham().getID_Product());
				}
				url = "/invoiceDetail.jsp"; 
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("listDetail", invoiceDetails);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * request.setCharacterEncoding("UTF-8");
		 * response.setCharacterEncoding("UTF-8"); String action =
		 * request.getParameter("action"); String ID_Invoice =
		 * request.getParameter("ID_Invoice");
		 * 
		 * int Status_Order = Integer.parseInt(request.getParameter("Status_Order"));
		 * 
		 * String url = "";
		 * 
		 * request.setAttribute("Status_Order", Status_Order);
		 * 
		 * try {
		 * 
		 * switch (action) { case "Cancel": invoiceDAO.updateInvoice1( new
		 * Invoice(ID_Invoice, null, null, null, null, 3,0)); url =
		 * "/invoiceDetail.jsp"; break; }
		 * 
		 * } catch (Exception e) { e.printStackTrace(); } RequestDispatcher rd =
		 * getServletContext().getRequestDispatcher(url); rd.forward(request, response);
		 */

	}
}
