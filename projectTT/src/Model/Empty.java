package Model;

public class Empty {
	public String ID_Account;
	public Empty() {
		super();
	}
	public Empty (String iD_Account){
		super();
		this.ID_Account = iD_Account;
	}
	public String getID_Account() {
		return ID_Account;
	}

	public void setID_Account(String iD_Account) {
		ID_Account = iD_Account;
	}
}
