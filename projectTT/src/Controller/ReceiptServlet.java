package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.GoodReceiptDAO;

import Model.Account;
@WebServlet(urlPatterns = "/receiptServlet")
public class ReceiptServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String dataButton= req.getParameter("dataButton");
		HttpSession  session= req.getSession();
		Account employee= (Account) session.getAttribute("memberSession");
		String idEmployee= employee.getID_Account();
		System.out.println("ddd"+idEmployee);
		GoodReceiptDAO goodReceiptDAO= new GoodReceiptDAO();
		PrintWriter printWriter= resp.getWriter();
		switch (dataButton) {
		case "addReceipt":
			Date d=new Date();
			SimpleDateFormat formatDay = new SimpleDateFormat("yyyy-MM-dd");
			String date = formatDay.format(d);
			try {
				int i=goodReceiptDAO.insertGoodReceipt(idEmployee, date);
				if(i==0) {
					printWriter.print("success");
					resp.getWriter();
				}else if(i==2){
					printWriter.print("fail");
					resp.getWriter();
				}
				else if(i==1) {
					printWriter.print("exist");
					resp.getWriter();
				}	
			} catch (SQLException e) { 
				e.printStackTrace();
			}
			break;
		case "deleteGoodReceipt":
			String idGoodReceiptString= req.getParameter("idGoodReceipt");
			int idGoodReceipt= Integer.parseInt(idGoodReceiptString);
			try {
				if(goodReceiptDAO.deleteGoodReceipt(idGoodReceipt)) {
					printWriter.print("success");
					resp.getWriter();
				}
				else {
					printWriter.print("fail");
					resp.getWriter();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		default:
			break;
		}
	}

}
