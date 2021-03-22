package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.SeasonDAO;
import Dao.ShipperDAO;


@WebServlet("/ShipperServlet_Delete")
public class ShipperServlet_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ShipperDAO shipDAO = new ShipperDAO();   
   
    public ShipperServlet_Delete() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		int ID_Shipper =  Integer.parseInt(request.getParameter("ID_Shipper"));
		String url = "";
		try {
			switch (action) {
			case "Delete":
				shipDAO.deleteShipper(ID_Shipper);
				url = "/Admin/shipper_manager.jsp";
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
