package Model;

public class GoodReceiptDetail {
 	private int ID_ReceiptDetail;
 	private Product San_Pham;
	private GoodReceipt Phieu_Nhap;
	private int Price;
	private int Quantity;
	public GoodReceiptDetail() {
		super();
	}
	
	public GoodReceiptDetail(int iD_ReceiptDetail, Product san_Pham, GoodReceipt phieu_Nhap, int price, int quantity) {
		super();
		this.ID_ReceiptDetail = iD_ReceiptDetail;
		this.San_Pham= san_Pham;
		this.Phieu_Nhap = phieu_Nhap;
		this.Price = price;
		this.Quantity = quantity;
	}

	public int getID_ReceiptDetail() {
		return ID_ReceiptDetail;
	}

	public void setID_ReceiptDetail(int iD_ReceiptDetail) {
		ID_ReceiptDetail = iD_ReceiptDetail;
	}

	public Product getSan_Pham() {
		return San_Pham;
	}

	public void setSan_Pham(Product san_Pham) {
		San_Pham = san_Pham;
	}

	public GoodReceipt getPhieu_Nhap() {
		return Phieu_Nhap;
	}

	public void setPhieu_Nhap(GoodReceipt phieu_Nhap) {
		Phieu_Nhap = phieu_Nhap;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	

	
}
