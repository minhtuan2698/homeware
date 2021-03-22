package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDAOImpl;
import Dao.ProductDAOImpl;


@WebServlet("/CategoryServlet_Delete")
public class CategoryServlet_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();   
       
  
    public CategoryServlet_Delete() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Category = request.getParameter("ID_Category");
		String url = "";
		try {
			switch (action) {
			case "Delete":
				cateDAO.deleteCategory(ID_Category);
				url = "/Admin/qlydanhmuc.jsp";
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
