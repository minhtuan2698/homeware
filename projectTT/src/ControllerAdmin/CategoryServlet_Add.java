package ControllerAdmin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.AccountDAOImpl;
import Dao.CategoryDAOImpl;
import Model.Account;
import Model.Category;
import Other.SendMail;


@WebServlet("/CategoryServlet_Add")
public class CategoryServlet_Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();
       
    public CategoryServlet_Add() {
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
		String ID_Category = request.getParameter("ID_Category");
		String Name_Category = request.getParameter("Name_Category");
		

		String madanhmuc_error = "", tendanhmuc_error = "";

		
		if (ID_Category.equals("")) {
			madanhmuc_error = "Vui lòng nhập mã danh mục !";
		} else {
			if (cateDAO.checkCategory(ID_Category) == true) {
				madanhmuc_error = "Mã danh mục đã tồn tại, không thêm được !";
			}
		}
		if (madanhmuc_error.length() > 0) {
			request.setAttribute("madanhmuc_error", madanhmuc_error);
		}
		
		if (Name_Category.equals("")) {
			tendanhmuc_error = "Vui lòng nhập tên danh mục!";
		}
		if (tendanhmuc_error.length() > 0) {
			request.setAttribute("tendanhmuc_error", tendanhmuc_error);
		}
		
		

		request.setAttribute("madanhmuc", ID_Category);
		request.setAttribute("tendanhmuc", Name_Category);
		
		try {
			switch (action) {
			case "Insert":
				if (madanhmuc_error.length() == 0 && tendanhmuc_error.length() == 0 ) {
					
					String parent_category = "GD" ;
					Category cate = new Category( ID_Category, Name_Category, parent_category );
					cateDAO.insertCategory(cate);
					url = "/Admin/qlydanhmuc.jsp";
					
					break;
				} else {
					url = "/Admin/category_insert.jsp";
				}
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
