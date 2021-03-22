package ControllerAdmin;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.GoodReceiptDAO;
import Dao.GoodReceiptDetailDAO;
import Dao.ProductDAOImpl;
import Dao.ShipperDAO;
import Model.Brand;
import Model.Category;
import Model.GoodReceipt;
import Model.GoodReceiptDetail;
import Model.Product;


@WebServlet("/ReceiptDetailServlet_Add")
public class ReceiptDetailServlet_Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GoodReceiptDetailDAO grdDAO = new GoodReceiptDetailDAO();
	private GoodReceiptDAO grDAO = new GoodReceiptDAO();
	private ProductDAOImpl proDAO = new ProductDAOImpl();
    
       
   
    public ReceiptDetailServlet_Add() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
	
		int ID_Receipt = Integer.parseInt(request.getParameter("ID_Receipt"));
		int Price = Integer.parseInt(request.getParameter("Price"));
		String ID_Product = request.getParameter("ID_Product");
		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
		

		
		

		request.setAttribute("gianhap", Price);
		request.setAttribute("soluong", Quantity);
	
		
		try {
			switch (action) {
			case "Insert":
				
					Date date = new Date();
				
					Random rd = new Random();
					int n = 23431;
					
					int id = rd.nextInt(n);
					System.out.println(id+"11");
					
					
					System.out.println(Price+"44");
					System.out.println(Quantity+"55");
					Product pro = new Product();
					pro.setID_Product(proDAO.getDetailProduct(ID_Product).getID_Product());
					String proo = proDAO.getDetailProduct(ID_Product).getID_Product();
					
					System.out.println(proo+"22");
					GoodReceipt gr = new GoodReceipt();
					gr.setID_Receipt(grDAO.getReceipt(ID_Receipt).getID_Receipt());
					System.out.println(gr+"33");
					GoodReceiptDetail grd= new GoodReceiptDetail( id, pro,gr,Price, Quantity );
					grdDAO.insertGRD(grd);
					Product pr = new Product();
							proDAO.updateQuantity2(Quantity,proo);
					int idd = grDAO.getReceipt(ID_Receipt).getID_Receipt();
					System.out.println(idd+"77");
					int total = Price*Quantity;
					System.out.println(total+"88");
					GoodReceipt grr= new GoodReceipt(idd,null,null,total);
					grDAO.updateGoodReceipt(idd, total);
					url = "/Admin/GoodReceipt.jsp";
					
					break;
				
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
