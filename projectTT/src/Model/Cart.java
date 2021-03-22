package Model;

import java.util.Map;
import java.util.TreeMap;

import javax.activation.MailcapCommandMap;

import com.restfb.types.Payment.Item;

import Model.Product;

public class Cart {
	
	private TreeMap<Product, Integer> list;
	private long cartID;

	public Cart() {
		list = new TreeMap<>();
		cartID = System.currentTimeMillis();
	}

	public Cart(TreeMap<Product, Integer> list, long cartID) {
		this.list = list;
		this.cartID = cartID;
	}

	public TreeMap<Product, Integer> getList() {
		return list;
	}

	public void setList(TreeMap<Product, Integer> list) {
		this.list = list;
	}

	public long getCartID() {
		return cartID;
	}

	public void setCartID(long cartID) {
		this.cartID = cartID;
	}

	public void insertToCart(Product pr, int quantity) {
		boolean bln = list.containsKey(pr);
		if (bln) {
			int sl = list.get(pr);
			quantity += sl;
			list.put(pr, quantity);
		} else {
			list.put(pr, quantity);
		}
	}
	public void insertToCart1(Product pr, int quantity) {
		boolean bln = list.containsKey(pr);
		if (bln) {
			int sl = list.get(pr);
			
			quantity += sl;
			if (sl== pr.getQuantity()) { 
				System.out.println("dung lai" + sl +"quantity ne" + quantity+ "dd" + pr.getQuantity());
				return;
			}
			
			list.put(pr, quantity);
			
			
		} else {
			list.put(pr, quantity);
		}
	}
	
	/*
	 * public void subToCart(Product pr, int quantity) { boolean bln =
	 * list.containsKey(pr); if (bln) { int sl = list.get(pr); quantity = sl -
	 * quantity; if (quantity <= 0) { list.remove(pr); } else { list.remove(pr);
	 * list.put(pr, quantity); } } }
	 */
	public void subToCart(Product pr, int quantity) {
		boolean bln = list.containsKey(pr);
		if (bln) {
			int sl = list.get(pr);
			quantity = sl - quantity;
			if (sl == 1) {
				return;
			} else {		
				list.put(pr, quantity);
			}
		}
	}

	public void removeToCart(Product pr) {
		boolean bln = list.containsKey(pr);
		if (bln) {
			list.remove(pr);
		}
	}
	 
	public int totalCart() {
		int count=0;
		for (Map.Entry<Product, Integer> ds : list.entrySet()) {
			count += ds.getValue() * ((ds.getKey().getPrice()) - (ds.getKey().getSale()));
			
		}
		return count;
	}
	
	  public int countItem() { 
		  return list.size(); 
		  }
	
	
}
