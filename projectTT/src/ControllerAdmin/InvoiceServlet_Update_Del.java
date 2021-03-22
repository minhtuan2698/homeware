package ControllerAdmin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.InvoiceDAOImpl;
import Dao.InvoiceDetailDAOImpl;
import Dao.ProductDAOImpl;
import Dao.SeasonDAO;
import Dao.ShipperDAO;
import Model.Account;
import Model.Cart;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Season;
import Model.Shipper;

@WebServlet("/InvoiceServlet_Update_Del")
public class InvoiceServlet_Update_Del extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private static InvoiceDetailDAOImpl invoiceDetailDAO = new InvoiceDetailDAOImpl();
	private static ShipperDAO shipDAO = new ShipperDAO();
	public InvoiceServlet_Update_Del() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Invoice = request.getParameter("ID_Invoice");
		String url = "";
		try {
			switch (action) {
			case "Delete":
				invoiceDAO.deleteInvoice(ID_Invoice);
				url = "/Admin/invoice_manager.jsp";
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Invoice = request.getParameter("ID_Invoice");
		 String Status = request.getParameter("Status_Order");
		 String Shipper = request.getParameter("ID_Shipper");
		/*
		 * String Shipping_Address = request.getParameter("Shipping_Address"); String
		 * Payment_Methods = request.getParameter("Payment_Methods");
		 */
		int Status_Order = Integer.parseInt(request.getParameter("Status_Order"));
		int Giao_Hang = Integer.parseInt(request.getParameter("Giao_Hang"));

		String url = "";
		String error_address = "", error_methods = "", error_status = "";

		/*
		 * if (Shipping_Address.equals("")) { error_address =
		 * "Vui lòng nhập địa chỉ của bạn !"; } if (error_address.length() > 0) {
		 * request.setAttribute("error_address", error_address); }
		 * 
		 * if (Payment_Methods.equals("")) { error_methods =
		 * "Vui lòng chọn phương thức thanh toán !"; } if (error_methods.length() > 0) {
		 * request.setAttribute("error_methods", error_methods); }
		 */
		// Validate trang thai
		if (Status_Order == 0) {
			error_status = "Vui lòng chọn trạng thái đơn hàng !";
		}
		if (Status_Order == 1 || Status_Order == 2 || Status_Order == 3 ||  Status_Order == 4) {
			request.setAttribute("error_status", error_status);
		}

		/*
		 * request.setAttribute("Shipping_Address", Shipping_Address);
		 * request.setAttribute("Payment_Methods", Payment_Methods);
		 */
		request.setAttribute("Status_Order", Status_Order);
		request.setAttribute("Giao_Hang", Giao_Hang);

		try {
			
				switch (action) {
				case "Update":
					HttpSession session = request.getSession();
					Account acc = (Account) session.getAttribute("memberSession");
					String ID_Employee = acc.getID_Account();
					Shipper shipper = new Shipper();
					shipper.setID_Shipper(shipDAO.getShipper(Giao_Hang).getID_Shipper());
					invoiceDAO.updateInvoice(
							new Invoice(ID_Invoice, null, null, null, null, Status_Order,0, shipper, ID_Employee, null));
					if (Status.equals("3")) {
						ArrayList<InvoiceDetail> listInvoice = invoiceDetailDAO.getListUpdateProduct(ID_Invoice);
						for (InvoiceDetail invoiceDetail : listInvoice) {
							
							proDAO.updateQuantity1(invoiceDetail.getQuantity(), invoiceDetail.getSan_Pham().getID_Product());
						}
					}
					url = "/Admin/invoice_manager.jsp";
					break;
				}
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}
}
