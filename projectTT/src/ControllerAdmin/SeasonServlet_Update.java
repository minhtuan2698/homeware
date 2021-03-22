package ControllerAdmin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.CategoryDAOImpl;
import Dao.SeasonDAO;
import Model.Category;
import Model.Season;


@WebServlet("/SeasonServlet_Update")
public class SeasonServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SeasonDAO seasonDAO = new SeasonDAO();
    
    public SeasonServlet_Update() {
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
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("dd/MM/yyyy");
		String beforeCreatedDate= request.getParameter("DateStart");
		String beforeCreatedDate2= request.getParameter("DateEnd");
		Date afterCreatedDate = new Date();
		Date afterCreatedDate2 = new Date();
		try {
			afterCreatedDate = (Date)beforeFormat.parse(beforeCreatedDate);
			afterCreatedDate2 = (Date)beforeFormat.parse(beforeCreatedDate2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int ID_Season =  Integer.parseInt(request.getParameter("ID_Season"));
		String Name_Season = request.getParameter("Name_Season");
		
		  String DateStart = afterFormat.format(afterCreatedDate); 
		  String DateEnd = afterFormat.format(afterCreatedDate2);
		 
		System.out.println("ssqqq"+DateStart);
		System.out.println("ssqqqend"+DateEnd);
		String tenmuasukien_error = "", ngaybatdau_error="", ngayketthuc_error="";
		if (Name_Season.equals("")) {
			tenmuasukien_error = "Vui lòng nhập tên mùa sự kiện !";
		}
		if (tenmuasukien_error.length() > 0) {
			request.setAttribute("tenmuasukien_error", tenmuasukien_error);
		}
		if (DateStart.equals("")) {
			 ngaybatdau_error = "Vui lòng nhập tên mùa sự kiện !";
		}
		if (DateEnd.equals("")) {
			 ngayketthuc_error = "Vui lòng nhập tên mùa sự kiện !";
		}
		
		
		request.setAttribute("ID_Season", ID_Season);
		request.setAttribute("Name_Season", Name_Season);
		request.setAttribute("DateStart", DateStart);
		request.setAttribute("DateEnd ", DateEnd );
		
		try {
			switch (action) {
			case "Update":

				if (tenmuasukien_error.length() == 0 ) {
					Season season = new Season(ID_Season, Name_Season, DateStart, DateEnd);
					seasonDAO.updateSeason(season);
					url ="/Admin/qlymuasukien.jsp";
					break;
				} else {
					url ="/Admin/muasukien_edit.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}