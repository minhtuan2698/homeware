package Model;

public class Advertise {
	private int ID_Ads;
	private String Image_Ads;
	
	public Advertise() {
		super();
    }
	public Advertise(int iD_Ads, String image_Ads) {
		super();
		this.ID_Ads= iD_Ads;
		this.Image_Ads = image_Ads;
		
	}

	public int getID_Ads() {
		return ID_Ads;
	}

	public void setID_Ads(int iD_Ads) {
		this.ID_Ads = iD_Ads;
	}

	public String getImage_Ads() {
		return Image_Ads;
	}

	public void setImage_Ads(String image_Ads) {
		this.Image_Ads = image_Ads;
	}
  
}
