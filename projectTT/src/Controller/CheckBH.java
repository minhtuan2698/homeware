package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.BaoHanhDAO;
import Dao.SeriDAO;
import Model.BaoHanh;
import Model.KetQuaBH;


@WebServlet("/CheckBH")
public class CheckBH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckBH() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		BaoHanhDAO baoHanhDAO = new BaoHanhDAO();
		String seri = req.getParameter("seri");
 		int idSeri= Integer.parseInt(seri);
 		HttpSession session= req.getSession();
 		
		PrintWriter printWriter = resp.getWriter();
	
			try {
				BaoHanh bh = baoHanhDAO.checkbh(idSeri);
				if(seri.equals("") || seri == null) {
					session.removeAttribute("ketquabh");
					printWriter.print("noSearch");
					resp.getWriter();
				}
				else {
					session.setAttribute("ketquabh", bh);
					String kqString = bh.getNgaynhan()+"." +bh.getNgaytra()+"."+bh.getThoigiandukien()+"."+bh.getTrangthai();
					System.out.println("");
					System.out.println(kqString);
					printWriter.print(kqString);
					resp.getWriter();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
