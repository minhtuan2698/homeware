package Controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ProductDAOImpl;
import Model.Cart;
import Model.Product;

public class CartServlet extends HttpServlet {

	private ProductDAOImpl sanPhamDAO = new ProductDAOImpl();

	private static final long serialVersionUID = 1L;

	public CartServlet() {
		super();

	}
@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String msp = request.getParameter("ID_Product");
		String enter = request.getParameter("enter");
		ArrayList<Long> listBuy = null;
		String url = "/cart.jsp";
		try {
			listBuy = (ArrayList<Long>) session.getAttribute("cartID");
			long idBuy = 0;
			if (request.getParameter("cartID") != null) {
				idBuy = Long.parseLong(request.getParameter("cartID"));
			}
			Product pr = sanPhamDAO.getDetailProduct(msp);
			switch (enter) {
			case "insert":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cartID", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.insertToCart(pr, 1);
					listBuy.add(idBuy);
				}
				url = "/index.jsp";
				break;
			case "tang":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cart", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.insertToCart1(pr, 1);
					listBuy.add(idBuy);
				}
				break;
			case "tang1":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cart", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.insertToCart1(pr, 1);
					listBuy.add(idBuy);
				}
				url = "/checkout.jsp";
				break;
			case "giam":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cart", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.subToCart(pr, 1);
					listBuy.add(idBuy);
				}
				url = "/cart.jsp";
				break;
			case "giam1":
				if (listBuy == null) {
					listBuy = new ArrayList<>();
					session.setAttribute("cart", listBuy);
				}
				if (listBuy.indexOf(idBuy) == -1) {
					cart.subToCart(pr, 1);
					listBuy.add(idBuy);
				}
				url = "/checkout.jsp";
				break;
			case "remove":
				cart.removeToCart(pr);
				url = "/cart.jsp";
				break;
			default:
				break;
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	
}
