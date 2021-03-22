package ControllerAdmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BaoHanhDAO;

@WebServlet("/AddBaoHanh")
public class AddBaoHanh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddBaoHanh() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		BaoHanhDAO baoHanhDAO = new BaoHanhDAO();
		String action = request.getParameter("action");
		String seri = request.getParameter("Seri");
 		String tinhTrang = request.getParameter("id_tinhtrang");
 		int id_seri = Integer.parseInt(seri);
 		
 		System.out.println(seri + tinhTrang);
 		int idtinhTrang= Integer.parseInt(tinhTrang);
 		String url = "";
				try {
					if(action.equals("Insert")) {
						baoHanhDAO.insertBaoHanh(id_seri, idtinhTrang);
						url = "/Admin/ManageBaoHanh.jsp";
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
		
	}

}
