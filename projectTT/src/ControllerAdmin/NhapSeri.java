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

import Dao.ProductDAOImpl;
import Dao.SeriDAO;

@WebServlet("/NhapSeri")
public class NhapSeri extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl proDAO = new ProductDAOImpl();   
	private static SeriDAO seriDAO = new SeriDAO();   
    
    public NhapSeri() {
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
		String maseri_error="";
		String msp =request.getParameter("Masp");
		String iseri=request.getParameter("Seri");
		Pattern pattern = Pattern.compile("^[0-9]*$");
        Matcher matcher1 = pattern.matcher(msp);
        Matcher matcher2 = pattern.matcher(iseri);
        if(msp == "" ||!matcher1.matches() ) {
        	maseri_error = "Vui lòng nhập mã seri!";
			request.setAttribute("maseri_error", maseri_error);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/seri_insert.jsp");
			rd.forward(request, response);
			return;
		}
        if(iseri == "" ||!matcher2.matches() ) {
        	maseri_error = "Vui lòng nhập mã seri!";
			request.setAttribute("maseri_error", maseri_error);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/seri_insert.jsp");
			rd.forward(request, response);
			return;
		}
		int masp = Integer.parseInt(msp);
		int id_seri = Integer.parseInt(iseri);
		
		
		
			
				try {
					if (seriDAO.checkIdSeri(id_seri) == true) {
						maseri_error = "Mã seri đã tồn tại!";
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		
		if (maseri_error.length() > 0) {
			request.setAttribute("maseri_error", maseri_error);
		}
		request.setAttribute("maseri", id_seri);
		try {
			switch (action) {
			case "Seriadd":
				if (maseri_error.length() == 0  ) {
					seriDAO.insertSeri(masp, id_seri);
					url = "/Admin/qlyseri.jsp";
				}
				else {
					url = "/Admin/seri_insert.jsp";
				}
					
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
