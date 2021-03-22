package ControllerAdmin;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDAOImpl;
import Dao.SeasonDAO;
import Dao.ShipperDAO;
import Model.Category;
import Model.Season;
import Model.Shipper;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ShipperServlet_Update")
public class ShipperServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ShipperDAO shipDAO = new ShipperDAO(); 
   
    public ShipperServlet_Update() {
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
		
	
		
		int ID_Shipper =  Integer.parseInt(request.getParameter("ID_Shipper"));
		String Name_Shipper = request.getParameter("Name_Shipper");
		String Phone_Shipper = request.getParameter("Phone_Shipper");
		String Company_Shipper = request.getParameter("Company_Shipper");
		 
		
		String tenshipper_error = "", sdt_error="", congty_error="";
		if (Name_Shipper.equals("")) {
			tenshipper_error = "Vui lòng nhập tên shipper !";
		}
		if (tenshipper_error.length() > 0) {
			request.setAttribute("tenshipper_error", tenshipper_error);
		}
		if (Phone_Shipper.equals("")) {
			 sdt_error = "Vui lòng nhập số điện thoại !";
		}
		if (sdt_error.length() > 0) {
			request.setAttribute("sdt_error", sdt_error);
		}
		if (Company_Shipper.equals("")) {
			 congty_error = "Vui lòng nhập tên công ty !";
		}
		if (congty_error.length() > 0) {
			request.setAttribute("congty_error", congty_error);
		}
		
		
		request.setAttribute("ID_Shipper", ID_Shipper);
		request.setAttribute("Name_Shipper", Name_Shipper);
		request.setAttribute("Phone_Shipper", Phone_Shipper);
		request.setAttribute("Company_Shipper", Company_Shipper);
		
		try {
			switch (action) {
			case "Update":

				if (tenshipper_error.length() == 0  && sdt_error.length() == 0  && congty_error.length() == 0) {
					Shipper shipper = new Shipper(ID_Shipper, Name_Shipper, Phone_Shipper, Company_Shipper);
					shipDAO.updateShipper(shipper);
					url ="/Admin/shipper_manager.jsp";
					break;
				} else {
					url ="/Admin/shipper_edit.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}