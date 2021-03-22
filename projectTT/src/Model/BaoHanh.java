package Model;

import java.sql.Date;

public class BaoHanh {
	private int id;
	private int soseri;
	private String ngaynhan;
	private String ngaytra;
	private String thoigiandukien;
	private int trangthai;
	
	public BaoHanh() {
		
	}

	public BaoHanh(int id, int soseri, String ngaynhan, String ngaytra, String thoigiandukien, int trangthai) {
		super();
		this.id = id;
		this.soseri = soseri;
		this.ngaynhan = ngaynhan;
		this.ngaytra = ngaytra;
		this.thoigiandukien = thoigiandukien;
		this.trangthai = trangthai;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNgaynhan() {
		return ngaynhan;
	}

	public void setNgaynhan(String ngaynhan) {
		this.ngaynhan = ngaynhan;
	}

	public String getNgaytra() {
		return ngaytra;
	}

	public void setNgaytra(String ngaytra) {
		this.ngaytra = ngaytra;
	}

	public String getThoigiandukien() {
		return thoigiandukien;
	}

	public void setThoigiandukien(String thoigiandukien) {
		this.thoigiandukien = thoigiandukien;
	}

	public int getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}

	public int getSoseri() {
		return soseri;
	}

	public void setSoseri(int soseri) {
		this.soseri = soseri;
	}
	
	
}
