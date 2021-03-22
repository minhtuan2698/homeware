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

import Dao.CategoryDAOImpl;
import Dao.SeasonDAO;
import Model.Category;
import Model.Season;


@WebServlet("/SeasonServlet_Add")
public class SeasonServlet_Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SeasonDAO seasonDAO = new SeasonDAO();
    
    public SeasonServlet_Add() {
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
		String mamuasukien_error ="",tenmuasukien_error = "", ngaybatdau_error="", ngayketthuc_error="";
		String idSeason =request.getParameter("ID_Season");
		Pattern pattern = Pattern.compile("^[0-9]*$");
        Matcher matcher1 = pattern.matcher(idSeason);
		if(idSeason == "" ||!matcher1.matches() ) {
			mamuasukien_error = "Vui lòng nhập mã!";
			request.setAttribute("mamuasukien_error", mamuasukien_error);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin/muasukien_insert.jsp");
			rd.forward(request, response);
			return;
		}
		int ID_Season =  Integer.parseInt(idSeason);
		String Name_Season = request.getParameter("Name_Season");
		String DateStart = request.getParameter("DateStart");
		String DateEnd = request.getParameter("DateEnd");
		
		
		
			try {
				if (seasonDAO.checkSeason(ID_Season) == true) {
					mamuasukien_error = "Mã mùa đã tồn tại, không thêm được !";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		if (mamuasukien_error.length() > 0) {
			request.setAttribute("mamuasukien_error", mamuasukien_error);
		}
		
		if (Name_Season.equals("")) {
			tenmuasukien_error = "Vui lòng nhập tên danh mục!";
		}
		if (tenmuasukien_error.length() > 0) {
			request.setAttribute("tendanhmuc_error", tenmuasukien_error);
		}
		if (DateStart.equals("")) {
			ngaybatdau_error = "Vui lòng nhập tên danh mục!";
		}
		if (ngaybatdau_error.length() > 0) {
			request.setAttribute("ngaybatdau_error", ngaybatdau_error);
		}
		if (DateEnd.equals("")) {
			 ngayketthuc_error = "Vui lòng nhập tên danh mục!";
		}
		if ( ngayketthuc_error.length() > 0) {
			request.setAttribute(" ngayketthuc_error",  ngayketthuc_error);
		}
		
		
		
        
		request.setAttribute("mamuasukien", ID_Season);
		request.setAttribute("tenmuasukien", Name_Season);
		request.setAttribute("ngaybatdau", DateStart);
		request.setAttribute("ngayketthuc", DateEnd);
		
		try {
			switch (action) {
			case "Insert":
				if (mamuasukien_error.length() == 0 && tenmuasukien_error.length() == 0  && ngaybatdau_error.length() == 0  && ngayketthuc_error.length() == 0 ) {
					
				
					Season season = new Season( ID_Season, Name_Season, DateStart, DateEnd );
					seasonDAO.insertSeason(season);
					url = "/Admin/qlymuasukien.jsp";
					
					break;
				} else {
					url = "/Admin/muasukien_insert.jsp";
				}
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}
