package Controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TreeMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.AccountDAOImpl;
import Dao.BrandDAOImpl;
import Dao.CategoryDAOImpl;
import Dao.InvoiceDAOImpl;
import Dao.InvoiceDetailDAOImpl;
import Dao.ProductDAOImpl;
import Dao.ShipperDAO;
import Model.Account;
import Model.Brand;
import Model.Cart;
import Model.Category;
import Model.Invoice;
import Model.InvoiceDetail;
import Model.Product;
import Model.Shipper;
import Other.SendMail;

public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	private InvoiceDAOImpl hdDAO = new InvoiceDAOImpl();
	private InvoiceDetailDAOImpl hdctDAO = new InvoiceDetailDAOImpl();
	private AccountDAOImpl accDAO = new AccountDAOImpl();
	private ProductDAOImpl proDAO = new ProductDAOImpl();
	private CategoryDAOImpl cateDAO = new CategoryDAOImpl();
	private BrandDAOImpl brandDAO = new BrandDAOImpl();
	private ShipperDAO shipDAO = new ShipperDAO();

	public PayServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String Shipping_Address = request.getParameter("Shipping_Address");
		String Payment_Methods = request.getParameter("Payment_Methods");
		String Account = request.getParameter("Account");
		String Email = request.getParameter("Email");
		String Phone = request.getParameter("Phone");
		String Time_Limit = request.getParameter("Time_Limit");
		
		SimpleDateFormat formatDay = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date afterCreatedDate = new Date();
		try {
			afterCreatedDate = (Date)afterFormat.parse(Time_Limit);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String Time_Limit1 = formatDay.format(afterCreatedDate);
		
		
		
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		String error_address = "", error_methods = "", error_email = "", error_phone = "";

		if (Shipping_Address.equals("")) {
			error_address = "Vui l??ng nh???p ?????a ch??? c???a b???n !";
		}
		if (error_address.length() > 0) {
			request.setAttribute("error_address", error_address);
		}
		if (Payment_Methods.equals("")) {
			error_methods = "Vui l??ng ch???n ph????ng th???c thanh to??n";
		}
		if (error_methods.length() > 0) {
			request.setAttribute("error_methods", error_methods);
		}
		if (Email.equals("")) {
			error_email = "Vui l??ng nh???p ?????a ch??? Email c???a b???n !";
		}
		if (error_email.length() > 0) {
			request.setAttribute("error_email", error_email);
		}
		if (Phone.equals("")) {
			error_phone = "Vui l??ng nh???p s??? ??i???n tho???i c???a b???n !";
		}
		if (error_phone.length() > 0) {
			request.setAttribute("error_phone", error_phone);
		}

		request.setAttribute("Shipping_Address", Shipping_Address);
		request.setAttribute("Payment_Methods", Payment_Methods);
		request.setAttribute("Email", Email);
		request.setAttribute("Phone", Phone);
		request.setAttribute("Time_Limit1", Time_Limit1);
		

		try {
			if (error_address.length() == 0 && error_methods.length() == 0 && error_email.length() == 0 && error_phone.length() == 0 &&!cart.getList().isEmpty()) {
				Date date = new Date();
				System.out.println("aa" + cart + "ss");
				Random rd = new Random();
				int n = 234363123;
				
				String mhd = "MHD" + date.getTime();
				/*
				 * Account acc = new Account();
				 * 
				 * acc.setID_Account(accDAO.getAccount(Account).getID_Account());
				 */
				Account acc= new Account();
				acc = (Account) session.getAttribute("memberSession");
				int total = cart.totalCart();
				Shipper ship = new Shipper();
				int k = 1;
				String id_employee = "0";
				
				ship.setID_Shipper(shipDAO.getShipper(k).getID_Shipper());
				Invoice hd = new Invoice(mhd, acc, Shipping_Address, Payment_Methods,
						new Timestamp(new Date().getTime()), 2, total, ship, id_employee, Time_Limit1);
				hd.setID_Invoice(mhd);
				hdDAO.insertInvoice(hd);
				TreeMap<Product, Integer> list = cart.getList();
				for (Map.Entry<Product, Integer> ds : list.entrySet()) {
					Product pr = new Product();
					pr.setID_Product(ds.getKey().getID_Product());
					pr.setName_Product(ds.getKey().getName_Product());
					int mhdct = rd.nextInt(n);
					int st = (ds.getValue() * ds.getKey().getPrice()) - (ds.getValue() * ds.getKey().getSale()) ;
					hdctDAO.insertInvoiceDetail(
							new InvoiceDetail(mhdct, hd, pr, ds.getValue(), ds.getKey().getPrice(), ds.getKey().getSale(), st));
					
					Product pro = new Product(pr.getID_Product(),null,null,null,ds.getValue(),null,0,0,null);
					proDAO.updateQuantity(pro);
                    
					SendMail.sendMail(Email, "Xin Ch??o, Kh??ch h??ng: " + acc.getUsername(),
							"C???m ??n b???n ???? mua h??ng t???i TS HOMEWARE" + "\nM?? S???n Ph???m: " + pr.getID_Product() + "\nT??n S???n Ph???m: " + pr.getName_Product()
									+ "\nS??? L?????ng: " + ds.getValue() + "\nT???ng Ti???n: " + st + " VND"
									+ "\n?????a Ch??? Giao H??ng: " + Shipping_Address + "\nS??? ??i???n tho???i: " + Phone +"\nPh????ng Th???c Thanh To??n: "
									+ Payment_Methods +"\n????n h??ng c???a b???n s??? ???????c giao trong v??ng 3 ng??y, m???i th???c m???c xin li??n h??? ch??ng t??i TS HOMEWARE - 0386.300.021");
				}

				request.setAttribute("message", "Thanh to??n th??nh c??ng !");
				session.removeAttribute("cart");
				request.getRequestDispatcher("buysuccess.jsp").forward(request, response);
				 
				// response.sendRedirect("/TheSinh_Homeware/checkout.jsp");
			} else {
				request.setAttribute("message", "Mua h??ng th???t b???i !");
				request.getRequestDispatcher("checkout.jsp").forward(request, response);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
