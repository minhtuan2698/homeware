package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDAOImpl;
import Dao.ShipperDAO;
import Model.Category;
import Model.Season;
import Model.Shipper;


@WebServlet("/ShipperServlet_Add")
public class ShipperServlet_Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ShipperDAO shipDAO = new ShipperDAO();
       
  
    public ShipperServlet_Add() {
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
		String mashipper_error ="",tenshipper_error = "", sdt_error="", congty_error="";
		String idShipper= request.getParameter("ID_Shipper");
		Pattern pattern = Pattern.compile("^[0-9]*$");
        Matcher matcher1 = pattern.matcher(idShipper);
		if(idShipper == "" ||!matcher1.matches()) {
			mashipper_error = "Vui lòng nhập mã shipper!";
			request.setAttribute("mashipper_error", mashipper_error);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/shipper_insert.jsp");
			rd.forward(request, response);
			return;
		}
		int ID_Shipper =  Integer.parseInt(idShipper);
		
		String Name_Shipper = request.getParameter("Name_Shipper");
		String Phone_Shipper = request.getParameter("Phone_Shipper");
		String Company_Shipper = request.getParameter("Company_Shipper");
		
			
				try {
					if (shipDAO.checkShipper(ID_Shipper) == true) {
						mashipper_error = "Mã shipper đã tồn tại!";
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		
		if (mashipper_error.length() > 0) {
			request.setAttribute("mashipper_error", mashipper_error);
		}
		
		if (Name_Shipper.equals("")) {
			tenshipper_error = "Vui lòng nhập tên shipper!";
		}
		if (tenshipper_error.length() > 0) {
			request.setAttribute("tenshipper_error", tenshipper_error);
		}
		if (Phone_Shipper.equals("")) {
			sdt_error = "Vui lòng nhập số điện thoại!";
		}
		if (sdt_error.length() > 0) {
			request.setAttribute("sdt_error", sdt_error);
		}
		if (Company_Shipper.equals("")) {
			 congty_error = "Vui lòng nhập tên công ty!";
		}
		if (congty_error.length() > 0) {
			request.setAttribute("congty_error",  congty_error);
		}
		
		

		request.setAttribute("mashipper", ID_Shipper);
		request.setAttribute("tenshipper", Name_Shipper);
		request.setAttribute("sdt", Phone_Shipper);
		request.setAttribute("congty", Company_Shipper);
		
		try {
			switch (action) {
			case "Insert":
				if (mashipper_error.length() == 0 && tenshipper_error.length() == 0  && sdt_error.length() == 0  && congty_error.length() == 0 ) {
					
				
					Shipper shipper = new Shipper( ID_Shipper, Name_Shipper, Phone_Shipper, Company_Shipper );
					shipDAO.insertShipper(shipper);
					url = "/Admin/shipper_manager.jsp";
					
					break;
				} else {
					url = "/Admin/shipper_insert.jsp";
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
