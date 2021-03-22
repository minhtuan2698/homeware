package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDAOImpl;
import Dao.SeasonDAO;


@WebServlet("/SeasonServlet_Delete")
public class SeasonServlet_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SeasonDAO cateDAO = new SeasonDAO();   
    
    public SeasonServlet_Delete() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		int ID_Season =  Integer.parseInt(request.getParameter("ID_Season"));
		String url = "";
		try {
			switch (action) {
			case "Delete":
				cateDAO.deleteSeason(ID_Season);
				url = "/Admin/qlymuasukien.jsp";
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
