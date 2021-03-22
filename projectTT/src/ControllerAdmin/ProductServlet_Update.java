package ControllerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BrandDAOImpl;
import Dao.CategoryDAOImpl;
import Dao.ProductDAOImpl;
import Dao.SeasonDAO;
import Model.Brand;
import Model.Category;
import Model.Product;
import Model.Season;

@WebServlet("/ProductServlet_Update")
public class ProductServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl proDAO = new ProductDAOImpl();
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();
	private static BrandDAOImpl brandDAO = new BrandDAOImpl();
	private static SeasonDAO seasonDAO = new SeasonDAO();
    
       
   
    public ProductServlet_Update() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		/*
		 * Account member = new Account();
		 * 
		 * member = accDAO.getAccount(AccountSession.Username);
		 */
		/* System.out.print(MemberSession.password); */
		/* String currentpass = MemberSession.password; */
		
		String action = request.getParameter("action");
		String url = "";
		String ID_Product = request.getParameter("ID_Product");
		System.out.println("wwww1"+ID_Product);
	    String Danh_Muc = request.getParameter("Danh_Muc"); 
	
		String Name_Product = request.getParameter("Name_Product");
		System.out.println("wwww2"+Name_Product);
		String Image = request.getParameter("Image");
	
		int Quantity =   Integer.parseInt(request.getParameter("Quantity"));
		
		String Describe = request.getParameter("Describe");
		int Price = Integer.parseInt(request.getParameter("Price"));
		int Sale = Integer.parseInt(request.getParameter("Sale"));
		String Nhan_Hieu = request.getParameter("Nhan_Hieu"); 
		int Warranty_Period = Integer.parseInt(request.getParameter("Warranty_Period"));
		int Mua = Integer.parseInt(request.getParameter("Mua"));
		System.out.println("wwww3"+Mua);

		String masanpham_error = "",  tensanpham_error = "", hinhanh_error = "", soluong_error = "",
				mota_error = "", giaban_error = "", giamgia_error = "", baohanh_error ="";

	
		if (ID_Product.equals("")) {
			masanpham_error = "Vui lòng nhập mã sản phẩm !";
		}
		if (masanpham_error.length() > 0) {
			request.setAttribute("masanpham_error", masanpham_error);
		}
		/*
		 * if (Danh_Muc.equals("")) { madanhmuc_error = "Vui lòng nhập mã danh mục !"; }
		 * if (madanhmuc_error.length() > 0) { request.setAttribute("madanhmuc_error",
		 * madanhmuc_error); }
		 */
		if (Name_Product.equals("")) {
			tensanpham_error = "Vui lòng nhập tên sản phẩm !";
		}
		if (tensanpham_error.length() > 0) {
			request.setAttribute("tensanpham_error", tensanpham_error);
		}
		if (Image.equals("")) {
			hinhanh_error = "Vui lòng nhập hình ảnh sản phẩm !";
		}
		if (hinhanh_error.length() > 0) {
			request.setAttribute("hinhanh_error", hinhanh_error);
		}
	
		if (Describe.equals("")) {
			mota_error = "Vui lòng nhập mô tả sản phẩm !";
		}
		if (mota_error.length() > 0) {
			request.setAttribute("mota_error", mota_error);
		}
		
		request.setAttribute("ID_Product", ID_Product);
		/* request.setAttribute("Danh_Muc", Danh_Muc); */
		request.setAttribute("Name_Product", Name_Product);
		request.setAttribute("Image", Image);
		request.setAttribute("Quantity", Quantity);
		request.setAttribute("Describe", Describe);
		request.setAttribute("Price", Price);
		request.setAttribute("Sale", Sale);
		/* request.setAttribute("Nhan_Hieu", Nhan_Hieu); */
		request.setAttribute("Warranty_Period", Warranty_Period);
		request.setAttribute("Mua", Mua);
		try {
			switch (action) {
			case "Update":

				if (masanpham_error.length() == 0 && tensanpham_error.length() == 0
						&& hinhanh_error.length() == 0 && mota_error.length() == 0) {
					Category cate = new Category();
					cate.setID_Category(cateDAO.getCategory(Danh_Muc).getID_Category());
					Brand brand = new Brand();
					brand.setID_Brand(brandDAO.getBrand(Nhan_Hieu).getID_Brand());
					Season season = new Season();
					season.setID_Season(seasonDAO.getSeason(Mua).getID_Season());
					Product pro = new Product(ID_Product,cate, Name_Product, Image, Quantity, Describe, Price, Sale,
							brand, Warranty_Period,season);
					proDAO.updateProduct(pro);
					System.out.println("wwww"+pro);
					url ="/Admin/qlysanpham.jsp";
					break;
				} else {
					url ="/Admin/product_edit.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}