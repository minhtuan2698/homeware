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


@WebServlet("/ThongKeServlet")
public class ThongKeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDetailDAOImpl inv = new InvoiceDetailDAOImpl();
	JsonObject jsonObject = new JsonObject();

	
    public ThongKeServlet() {
        super();
        
    }
	
		
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String url = "";
		String action = request.getParameter("action");
		String error = null;
	
		ArrayList<Statistic> statistics = null;
	
          switch(action) {
          case "ThongKe":
        	  String data = null;
        	  String dateFrom= request.getParameter("dateFrom");
      		  String dateTo = request.getParameter("dateTo");
      		System.out.println("1111"+ dateFrom);
      		System.out.println("1112"+ dateTo);
      		try {
    			statistics = inv.getListInvoiceDetail13(dateFrom, dateTo);
				System.out.println(statistics);
    		
      		} catch (Exception e) {
				System.out.println("Lỗi thống kê1: "+e.getMessage());
				error = "Lỗi thống kê2: " + e.getMessage();
				e.printStackTrace();
			}
           Double sum =0.00;
      		
      		for(Statistic stt: statistics) sum+= stt.getTotal();
      		if(error==null) {
				data = createRevenueStatistic(statistics);
          }
      		jsonObject = new JsonObject();
			jsonObject.addProperty("error", error);
			jsonObject.addProperty("data", data);
			jsonObject.addProperty("total1", sum);
			response.getWriter().print(jsonObject.toString());
			break;
          default:
  			break;
          }
	}
	private String createRevenueStatistic(ArrayList<Statistic> statistics) {
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
	    
		if(statistics==null || statistics.isEmpty()) return "<tr><td colspan='6' style='color: red;text-align: center;'>Không có số liệu</td></tr>";
		
		String data = "";
		for(Statistic statistic: statistics) {
			data += "<tr class=\"contentPage\">\r\n" + 
					"							<td style=\"text-align: center;\">"+statistic.getProductId()+"</td>\r\n" + 
					"							<td style=\"text-align: center;\">"+statistic.getProductName()+"</td>\r\n" + 
					"							<td style=\"text-align: center;\">"+statistic.getQuantity()+"</td>\r\n" + 
					"							<td style=\"text-align: center;\">"+nf.format(statistic.getTotal())+"</td>\r\n" + 
					"							\r\n" + 
					"						</tr>";
		}
		return data;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
