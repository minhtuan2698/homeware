package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.GoodReceiptDAO;
import Dao.ShipperDAO;
import Model.Account;
import Model.GoodReceipt;
import Model.Shipper;


@WebServlet("/GoodReceipt_Add")
public class GoodReceipt_Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static GoodReceiptDAO grDAO = new GoodReceiptDAO();
    public GoodReceipt_Add() {
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
		String maphieunhap_error ="";
		String abc=request.getParameter("ID_Receipt");
		Pattern pattern = Pattern.compile("^[0-9]*$");
        Matcher matcher1 = pattern.matcher(abc);
		if(abc == "" ||!matcher1.matches()) {
			maphieunhap_error = "Vui lòng nhập mã!";
			request.setAttribute("maphieunhap_error", maphieunhap_error);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/goodreceipt_insert.jsp");
			rd.forward(request, response);
			return;
		}
		int ID_Receipt =  Integer.parseInt(abc);
		/* String numberAsString = String.valueOf(number); */
		System.out.println("1111"+ ID_Receipt);
		HttpSession  session= request.getSession();
		/* String numberAsString = Integer.toString(ID_Receipt); */
		int total=0;
		System.out.println("1112"+ total);

		
		
		
			
				try {
					if (grDAO.checkGR(ID_Receipt) == true) {
						maphieunhap_error = "Mã phiếu nhập đã tồn tại!";
					}
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			
		
		if (maphieunhap_error.length() > 0) {
			request.setAttribute("maphieunhap_error", maphieunhap_error);
		}
		
		request.setAttribute("maphieunhap", ID_Receipt);
		Date d=new Date();
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy-MM-dd");
		String date = formatDay.format(d);
		System.out.println("1113"+ date);
		try {
			switch (action) {
			case "Insert":
				if (maphieunhap_error.length() == 0 ) {
					
					Account acc= (Account) session.getAttribute("memberSession");
					String ac = acc.getID_Account();
					System.out.println("1114"+ acc);
					GoodReceipt gr = new GoodReceipt(ID_Receipt,ac,date,total);
					grDAO.insertGR(gr);
					url = "/Admin/GoodReceipt.jsp";
					
					break;
				} else {
					url = "/Admin/goodreceipt_insert.jsp";
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}