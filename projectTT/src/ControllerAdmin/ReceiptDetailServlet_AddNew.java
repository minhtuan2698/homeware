package ControllerAdmin;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BrandDAOImpl;
import Dao.CategoryDAOImpl;
import Dao.GoodReceiptDAO;
import Dao.GoodReceiptDetailDAO;
import Dao.ProductDAOImpl;
import Dao.SeasonDAO;
import Model.Brand;
import Model.Category;
import Model.GoodReceipt;
import Model.GoodReceiptDetail;
import Model.Product;
import Model.Season;

@WebServlet("/ReceiptDetailServlet_AddNew")
public class ReceiptDetailServlet_AddNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();
	private static BrandDAOImpl brandDAO = new BrandDAOImpl();
	private static SeasonDAO seasonDAO = new SeasonDAO();
	private GoodReceiptDetailDAO grdDAO = new GoodReceiptDetailDAO();
	private GoodReceiptDAO grDAO = new GoodReceiptDAO();
	
    
    public ReceiptDetailServlet_AddNew() {
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
		String ID_Product = request.getParameter("ID_Product");
		String Danh_Muc = request.getParameter("Danh_Muc");
		String Name_Product = request.getParameter("Name_Product");
		String Image = request.getParameter("Image");
		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
		String Describe = request.getParameter("Describe");
		int PriceImport = Integer.parseInt(request.getParameter("PriceImport"));
		int Price = Integer.parseInt(request.getParameter("Price"));
		/* int Sale = Integer.parseInt(request.getParameter("Sale")); */
		String Nhan_Hieu = request.getParameter("Nhan_Hieu");
		int Warranty_Period = Integer.parseInt(request.getParameter("Warranty_Period"));
		int Mua = Integer.parseInt(request.getParameter("Mua"));
	    int Sale =0;
		int ID_Receipt = Integer.parseInt(request.getParameter("ID_Receipt"));

		String masanpham_error = "", madanhmuc_error = "", tensanpham_error = "", hinhanh_error = "", soluong_error = "",
				mota_error = "", gianhap_error= "", giaban_error = "", giamgia_error = "", nhanhieu_error = "", baohanh_error ="",mua_error="";

		if (ID_Product.equals("")) {
			masanpham_error = "Vui lòng nhập mã sản phẩm!";
		} 
		else {
			if (proDAO.checkIdProduct(ID_Product) == true) {
				masanpham_error = "Mã sản phẩm đã tồn tại, vui lòng nhập lại !";
			}
		}
		if (masanpham_error.length() > 0) {
			request.setAttribute("masanpham_error", masanpham_error);
		}
		if (madanhmuc_error.length() > 0) {
			request.setAttribute("tensanpham_error", tensanpham_error);
		}
		if (Name_Product.equals("")) {
			tensanpham_error = "Vui lòng nhập tên sản phẩm!";
		} 
		if (tensanpham_error.length() > 0) {
			request.setAttribute("tensanpham_error", tensanpham_error);
		}
	
	
		
		
		
		request.setAttribute("masanpham", ID_Product);
		request.setAttribute("madanhmuc", Danh_Muc);
		request.setAttribute("tensanpham", Name_Product);
		request.setAttribute("hinhanh", Image);
		request.setAttribute("soluong", Quantity);
		request.setAttribute("mota", Describe);
		request.setAttribute("gianhap", PriceImport);
		request.setAttribute("giaban", Price);
		/* request.setAttribute("giamgia", Sale); */
		request.setAttribute("nhanhieu", Nhan_Hieu);
		request.setAttribute("baohanh", Warranty_Period);
		request.setAttribute("Mua", Mua);
		try {
			switch (action) {
			case "Insert":
				if (masanpham_error.length() == 0 && tensanpham_error.length() == 0) {
					Category cate = new Category();
					cate.setID_Category(cateDAO.getCategory(Danh_Muc).getID_Category());
					Brand brand = new Brand();
					brand.setID_Brand(brandDAO.getBrand(Nhan_Hieu).getID_Brand());
					Season season = new Season();
					season.setID_Season(seasonDAO.getSeason(Mua).getID_Season());
				
					Product pro = new Product(ID_Product, cate, Name_Product, Image, Quantity, Describe, Price, Sale, brand, Warranty_Period, season);
					proDAO.insertProduct(pro);
					
					
					Date date = new Date();
					
					Random rd = new Random();
					int n = 23431;
					
					int id = rd.nextInt(n);
					System.out.println(id+"11");
					
					
					System.out.println(Price+"44");
					System.out.println(Quantity+"55");
					
					pro.setID_Product(proDAO.getDetailProduct(ID_Product).getID_Product());
				
					String proo = proDAO.getDetailProduct(ID_Product).getID_Product();
					
					System.out.println(proo+"22");
					GoodReceipt gr = new GoodReceipt();
					gr.setID_Receipt(grDAO.getReceipt(ID_Receipt).getID_Receipt());
					System.out.println(gr+"33");
					GoodReceiptDetail grd= new GoodReceiptDetail( id, pro,gr,PriceImport, Quantity );
					grdDAO.insertGRD(grd);
					
					int idd = grDAO.getReceipt(ID_Receipt).getID_Receipt();
					System.out.println(idd+"77");
					int total = PriceImport*Quantity;
					System.out.println(total+"88");
					GoodReceipt grr= new GoodReceipt(idd,null,null,total);
					grDAO.updateGoodReceipt(idd, total);
					
					url = "/Admin/GoodReceipt.jsp";
					break;
				} else {
					url = "/Admin/AddNewReceipt.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
