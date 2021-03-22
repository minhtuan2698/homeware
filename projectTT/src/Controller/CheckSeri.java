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

import Dao.SeriDAO;
import Model.KetQuaBH;


@WebServlet("/CheckSeri")
public class CheckSeri extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckSeri() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		SeriDAO seriDAO = new SeriDAO();
		String seri = req.getParameter("seri");
 		int idSeri= Integer.parseInt(seri);
 		HttpSession session= req.getSession();
 		
		PrintWriter printWriter = resp.getWriter();
	
			try {
				KetQuaBH ketQuaBH = seriDAO.checkseri(idSeri);
				if(seri.equals("") || seri == null) {
					session.removeAttribute("ketquaseri");
					printWriter.print("noSearch");
					resp.getWriter();
				}
				else {
					session.setAttribute("ketquaseri", ketQuaBH);
					String kqString = ketQuaBH.getTensp()+"-" +ketQuaBH.getId()+"-"+ketQuaBH.getNgaymua()+"-"+ketQuaBH.getHanbaohanh()+"-"+ketQuaBH.getTrangthai();
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
