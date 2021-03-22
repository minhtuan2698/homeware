package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDAOImpl;
import Dao.SeriDAO;

@WebServlet("/UpdateSeri")
public class UpdateSeri extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl proDAO = new ProductDAOImpl();   
	private static SeriDAO seriDAO = new SeriDAO();   
    
    public UpdateSeri() {
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
		int masp = Integer.parseInt(request.getParameter("ID_Product"));
		int id_seri = Integer.parseInt(request.getParameter("id_seri"));
		
		int ID_InvoiceDetail = Integer.parseInt(request.getParameter("ID_InvoiceDetail"));
		
		request.setAttribute("mhdct", ID_InvoiceDetail);
		try {
			switch (action) {
			case "Update":
					seriDAO.UpdateSeri(id_seri, masp, ID_InvoiceDetail);
					url = "/Admin/qlyseri.jsp";
					

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
		
		
	}

}
