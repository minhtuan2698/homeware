package Model;

public class Shipper {
	private int ID_Shipper;
	private String Name_Shipper;
	private String Phone_Shipper;
	private String Company_Shipper;
	
	public Shipper() {
		super();
	}
	public Shipper(int iD_Shipper, String name_Shipper, String phone_Shipper, String company_Shipper) {
		super();
		this.ID_Shipper = iD_Shipper;
		this.Name_Shipper = name_Shipper;
		this.Phone_Shipper = phone_Shipper;
		this.Company_Shipper = company_Shipper;
		
		
	}
	public int getID_Shipper() {
		return ID_Shipper;
	}
	public void setID_Shipper(int iD_Shipper) {
		ID_Shipper = iD_Shipper;
	}
	public String getName_Shipper() {
		return Name_Shipper;
	}
	public void setName_Shipper(String name_Shipper) {
		Name_Shipper = name_Shipper;
	}
	public String getPhone_Shipper() {
		return Phone_Shipper;
	}
	public void setPhone_Shipper(String phone_Shipper) {
		Phone_Shipper = phone_Shipper;
	}
	public String getCompany_Shipper() {
		return Company_Shipper;
	}
	public void setCompany_Shipper(String companny_Shipper) {
		Company_Shipper = companny_Shipper;
	}
	
}
