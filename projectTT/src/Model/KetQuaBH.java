package Model;

import java.util.Date;

public class KetQuaBH {
	private int id;
	private String tensp;
	private String ngaymua;
	private int hanbaohanh;
	private int trangthai;
	
	
	public KetQuaBH() {

	}


	public KetQuaBH(int id, String tensp, String ngaymua, int hanbaohanh, int trangthai) {
		super();
		this.id = id;
		this.tensp = tensp;
		this.ngaymua = ngaymua;
		this.hanbaohanh = hanbaohanh;
		this.trangthai = trangthai;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTensp() {
		return tensp;
	}


	public void setTensp(String tensp) {
		this.tensp = tensp;
	}


	public String getNgaymua() {
		return ngaymua;
	}


	public void setNgaymua(String ngaymua) {
		this.ngaymua = ngaymua;
	}


	public int getHanbaohanh() {
		return hanbaohanh;
	}


	public void setHanbaohanh(int hanbaohanh) {
		this.hanbaohanh = hanbaohanh;
	}


	public int getTrangthai() {
		return trangthai;
	}


	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	
	
}
