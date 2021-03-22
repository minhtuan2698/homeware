package Model;

public class Seri {
	private String masanpham;
	private String tensanpham;
	private int soseri;
	private int trangthai;
	private int goodReceipt_detailID;
	private int invoice_detailID;
	public Seri() {
		
	}

	public Seri(String masanpham, String tensanpham, int soseri, int trangthai) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.soseri = soseri;
		this.trangthai = trangthai;
	}
	public Seri(String masanpham, String tensanpham, int soseri, int trangthai, int goodReceipt_detailID) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.soseri = soseri;
		this.trangthai = trangthai;
		this.goodReceipt_detailID = goodReceipt_detailID;
	}
	public Seri(String masanpham, String tensanpham, int soseri, int trangthai, int goodReceipt_detailID, int invoice_detailID) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.soseri = soseri;
		this.trangthai = trangthai;
		this.goodReceipt_detailID = goodReceipt_detailID;
		this.invoice_detailID = invoice_detailID;
	}

	public String getMasanpham() {
		return masanpham;
	}

	public void setMasanpham(String masanpham) {
		this.masanpham = masanpham;
	}

	public String getTensanpham() {
		return tensanpham;
	}

	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	public int getSoseri() {
		return soseri;
	}

	public void setSoseri(int soseri) {
		this.soseri = soseri;
	}
	public int getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public int getGoodReceipt_detailID() {
		return goodReceipt_detailID;
	}
	public void setGoodReceipt_detailID(int goodReceipt_detailID) {
		this.goodReceipt_detailID = goodReceipt_detailID;
	}
	public int getInvoice_detailID() {
		return invoice_detailID;
	}
	public void setInvoice_detailID(int invoice_detailID) {
		this.invoice_detailID = invoice_detailID;
	}
}
