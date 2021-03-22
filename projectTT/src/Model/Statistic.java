package Model;

import java.util.Date;

public class Statistic {
	public int quantity;
	public String productId;
	public String productName;
	public Double price;
	public Double total;
	public Date Purchase_Date;
	public Statistic(int quantity, String productId, String productName, Double price, Double total) {
		super();
		this.quantity = quantity;
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.total = total;
	}
	public Statistic(int quantity, String productId, String productName, Double price, Double total, Date Purchase_Date) {
		super();
		this.quantity = quantity;
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.total = total;
		this.Purchase_Date = Purchase_Date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Date getPurchase_Date() {
		return Purchase_Date;
	}
	public void setPurchase_Date(Date purchase_Date) {
		Purchase_Date = purchase_Date;
	}
	
}
