package Model;

public class ImageDetail {
	private int ID_Image;
	private String Detail_Image;
	private Product San_Pham;
	private String Detail_Image1;
	private String Detail_Image2;
	public ImageDetail() {
		super();

	}

	public ImageDetail(int iD_Image, String detail_Image, Product san_Pham, String detail_Image1, String detail_Image2) {
		super();
		this.ID_Image = iD_Image;
		this.Detail_Image = detail_Image;
		this.San_Pham = san_Pham;
		this.Detail_Image1 = detail_Image1;
		this.Detail_Image2 = detail_Image2;
		
	}
	public int getID_Image() {
		return ID_Image;
	}

	public void setID_Image(int iD_Image) {
		this.ID_Image = iD_Image;
	}

	public String getDetail_Image() {
		return Detail_Image;
	}

	public void setDetail_Image(String detail_Image) {
		this.Detail_Image = detail_Image;
	}

	public Product getSan_Pham() {
		return San_Pham;
	}

	public void setSan_Pham(Product san_Pham) {
		this.San_Pham = san_Pham;
	}
	public String getDetail_Image1() {
		return Detail_Image1;
	}

	public void setDetail_Image1(String detail_Image1) {
		this.Detail_Image1 = detail_Image1;
	}
	public String getDetail_Image2() {
		return Detail_Image2;
	}

	public void setDetail_Image2(String detail_Image2) {
		this.Detail_Image2 = detail_Image2;
	}
	
}
