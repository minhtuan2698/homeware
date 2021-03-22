package Model;

public class GoodReceipt {
	private int ID_Receipt;
	private String ID_Account;
	private String Created_date;
	private int total;
	public GoodReceipt() {
		super();
	}
	public GoodReceipt(int iD_Receipt, String iD_Account, String created_date, int total) {
		super();
		this.ID_Receipt = iD_Receipt;
		this.ID_Account = iD_Account;
		this.Created_date = created_date;
		this.total = total;
	}
	public int getID_Receipt() {
		return ID_Receipt;
	}
	public void setID_Receipt(int iD_Receipt) {
		ID_Receipt = iD_Receipt;
	}
	public String getID_Account() {
		return ID_Account;
	}
	public void setID_Account(String iD_Account) {
		ID_Account = iD_Account;
	}
	public String getCreated_date() {
		return Created_date;
	}
	public void setCreated_date(String created_date) {
		Created_date = created_date;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
