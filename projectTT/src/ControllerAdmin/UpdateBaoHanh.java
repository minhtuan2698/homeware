package ControllerAdmin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BaoHanhDAO;


@WebServlet("/UpdateBaoHanh")
public class UpdateBaoHanh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateBaoHanh() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action  = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("Id_baohanh"));
		int trangthai = Integer.parseInt(request.getParameter("Status"));
		String ngaytra = request.getParameter("Ngaytra");
		String url = "";
		
		
		System.out.println(id +"---"+ trangthai +"--"+ ngaytra);
		
		BaoHanhDAO baoHanhDAO = new BaoHanhDAO();
		if(action.equals("Update")) {
			try {
				baoHanhDAO.UpdateBaoHanh(id, trangthai, ngaytra);
				url = "/Admin/ManageBaoHanh.jsp";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
