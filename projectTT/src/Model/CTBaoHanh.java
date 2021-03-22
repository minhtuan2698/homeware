package Model;

public class CTBaoHanh {
	private int idbaohanh;
	private int idtinhtrang;
	private String tentinhtrang;
	
	public CTBaoHanh() {
		
	}
	
	public CTBaoHanh(int idbaohanh, int idtinhtrang, String tentinhtrang) {
		super();
		this.idbaohanh = idbaohanh;
		this.idtinhtrang = idtinhtrang;
		this.tentinhtrang = tentinhtrang;
	}

	public int getIdbaohanh() {
		return idbaohanh;
	}
	public void setIdbaohanh(int idbaohanh) {
		this.idbaohanh = idbaohanh;
	}
	public int getIdtinhtrang() {
		return idtinhtrang;
	}
	public void setIdtinhtrang(int idtinhtrang) {
		this.idtinhtrang = idtinhtrang;
	}
	
	public String gettentinhtrang() {
		return tentinhtrang;
	}
	public void settentinhtrang(String tentinhtrang) {
		this.tentinhtrang = tentinhtrang;
	}
}
