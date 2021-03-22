package Model;

public class CountSeri {

	public String idproduct;
	public int quantity;
	public CountSeri() {
		super();
	}
	public CountSeri (String idproduct,int quantity){
		super();
		this.idproduct = idproduct;
		this.quantity = quantity;
	}
	public String getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(String idproduct) {
		this.idproduct = idproduct;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}