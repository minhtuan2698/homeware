package Model;

public class TinhTrang {
	private int id;
	private String tentinhtrang;
	private int thoigiansuachua;

	public TinhTrang() {
		
	}

	public TinhTrang(int id, String tentinhtrang, int thoigiansuachua) {
		super();
		this.id = id;
		this.tentinhtrang = tentinhtrang;
		this.thoigiansuachua = thoigiansuachua;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTentinhtrang() {
		return tentinhtrang;
	}

	public void setTentinhtrang(String tentinhtrang) {
		this.tentinhtrang = tentinhtrang;
	}

	public int getThoigiansuachua() {
		return thoigiansuachua;
	}

	public void setThoigiansuachua(int thoigiansuachua) {
		this.thoigiansuachua = thoigiansuachua;
	}
	
}
