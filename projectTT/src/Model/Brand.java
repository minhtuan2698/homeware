package Model;

public class Brand {
	private String ID_Brand;
	private String Name_Brand;
	private String Country;
	private String Parent_Brand;
	
	public Brand() {
		super();
    }
	public Brand(String iD_Brand, String name_Brand, String country, String parent_Brand) {
		super();
		this.ID_Brand = iD_Brand;
		this.Name_Brand = name_Brand;
		this.Country = country;
		this.Parent_Brand = parent_Brand;
	}

	public String getID_Brand() {
		return ID_Brand;
	}

	public void setID_Brand(String iD_Brand) {
		this.ID_Brand = iD_Brand;
	}

	public String getName_Brand() {
		return Name_Brand;
	}

	public void setName_Brand(String name_Brand) {
		this.Name_Brand = name_Brand;
	}
     
	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		this.Country = country;
	}
	public String getParent_Brand() {
		return Parent_Brand;
	}

	public void setParent_Brand(String parent_Brand) {
		this.Parent_Brand = parent_Brand;
	}
	
	
}
