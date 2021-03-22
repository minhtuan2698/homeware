package Model;

public class Count {
	public int count_id;
	public Count() {
		super();
	}
	public Count (int countid){
		super();
		this.count_id = countid;
	}
	public int getCount_id() {
		return count_id;
	}

	public void setCount_id(int countid) {
		count_id = countid;
	}
}