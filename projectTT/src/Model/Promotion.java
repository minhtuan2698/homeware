package Model;

public class Promotion {
	private int ID_Promotion;
	private String DateStart;
	private String DateEnd;
	private String ID_Account;
	private String Reason;
	public Promotion() {
		super();
	}

	public Promotion(int iD_Promotion, String dateStart, String dateEnd, String iD_Account, String reason) {
		super();
		this.ID_Promotion = iD_Promotion;
		this.DateStart = dateStart;
		this.DateEnd = dateEnd;
		this.ID_Account = iD_Account;
		this.Reason = reason;
	}

	public int getID_Promotion() {
		return ID_Promotion;
	}

	public void setID_Promotion(int iD_Promotion) {
		ID_Promotion = iD_Promotion;
	}

	public String getDateStart() {
		return DateStart;
	}

	public void setDateStart(String dateStart) {
		DateStart = dateStart;
	}

	public String getDateEnd() {
		return DateEnd;
	}

	public void setDateEnd(String dateEnd) {
		DateEnd = dateEnd;
	}

	public String getID_Account() {
		return ID_Account;
	}

	public void setID_Account(String iD_Account) {
		ID_Account = iD_Account;
	}

	public String getReason() {
		return Reason;
	}

	public void setReason(String reason) {
		Reason = reason;
	}

	
}
