package Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import Dao.InvoiceDetailDAOImpl;
import Model.Account;
import Model.InvoiceDetail;
import Model.Profit;
import Model.Statistic;
import Other.SendMail;


@WebServlet("/LoiNhuanServlet")
public class LoiNhuanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDetailDAOImpl inv = new InvoiceDetailDAOImpl();
	JsonObject jsonObject = new JsonObject();

	
    public LoiNhuanServlet() {
        super();
        
    }
	
		
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String url = "";
		String action = request.getParameter("action");
		String error = null;
	
		ArrayList<Profit> profits = null;
	
          switch(action) {
          case "LoiNhuan":
        	  String data = null;
        	  String dateFrom= request.getParameter("dateFrom");
      		  String dateTo = request.getParameter("dateTo");
      		request.setAttribute("dateFrom", dateFrom);
    		request.setAttribute("dateTo", dateTo);
      		System.out.println("1111"+ dateFrom);
      		System.out.println("1112"+ dateTo);
      		try {
      			profits = inv.getListProfit(dateFrom, dateTo);
				System.out.println(profits);
    		
      		} catch (Exception e) {
				System.out.println("Lỗi thống kê lợi nhuận1: "+e.getMessage());
				error = "Lỗi thống kê lợi nhuận2: " + e.getMessage();
				e.printStackTrace();
			}
      		Double sum =0.00;
      		
      		for(Profit profit: profits) sum+= (profit.getQuantity()*(profit.getPrice()-profit.getSale()))-(profit.getQuantity()*profit.getPriceImport());
			/* request.setAttribute("prs", profits); */
      		if(error==null) {
				data = createRevenueProfit(profits);
          }
      		jsonObject = new JsonObject();
			jsonObject.addProperty("error", error);
			jsonObject.addProperty("data", data);
			jsonObject.addProperty("total", sum);
			
			
			response.getWriter().print(jsonObject.toString());
			break;
          default:
  			break;
          }
	}
	private String createRevenueProfit(ArrayList<Profit> profits) {
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
	    
		if(profits==null || profits.isEmpty()) return "<tr><td colspan='7' style='color: red;text-align: center;'>Không có số liệu</td></tr>";
		
		String data = "";
		for(Profit profit: profits) {
			data += "<tr class=\"contentPage\">\r\n" + 
					"							<td style=\"text-align: center;\">"+profit.getProductId()+"</td>\r\n" + 
					"							<td style=\"text-align: center;\">"+profit.getProductName()+"</td>\r\n" + 
					"							<td style=\"text-align: center;\">"+profit.getQuantity()+"</td>\r\n" + 
					"							<td style=\"text-align: center;\">"+nf.format(profit.getPrice())+"</td>\r\n" + 
					"							<td style=\"text-align: center;\">"+nf.format(profit.getSale())+"</td>\r\n" + 
					"                           <td style=\"text-align: center;\">"+nf.format(profit.getPriceImport())+"</td>\r\n" +
					"                           <td style=\"text-align: center;\">"+nf.format((profit.getQuantity()*(profit.getPrice()-profit.getSale()))-(profit.getQuantity()*profit.getPriceImport()))+"</td>\r\n" +
					"							\r\n" + 
					"						</tr>";
			
		}
		return data;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
