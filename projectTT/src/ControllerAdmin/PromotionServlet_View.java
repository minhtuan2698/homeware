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
import Dao.PromotionDetailDAO;
import Model.GoodReceiptDetail;
import Model.InvoiceDetail;
import Model.PromotionDetail;


@WebServlet("/PromotionServlet_View")
public class PromotionServlet_View extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodReceiptDAO grDAO = new GoodReceiptDAO();
	PromotionDetailDAO pdDAO = new PromotionDetailDAO();
       
    
    public PromotionServlet_View() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		int ID_Promotion = Integer.parseInt(request.getParameter("ID_Promotion"));
		System.out.println("ddggg" + ID_Promotion);
		 ArrayList<PromotionDetail> pd1=null;
		try {
			switch (action) {
			
			case "Views":
				pd1 = pdDAO.listPromotion_detailbyID(ID_Promotion);
						
				System.out.println("ddgggsdsds" + pd1);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		url = "/Admin/promotionDetail.jsp";
		request.setAttribute("promotionDetails", pd1);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
