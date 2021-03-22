package Model;

public class Season {
	private int ID_Season;
	private String Name_Season;
	private String DateStart;
	private String DateEnd;
	
	
	public Season() {
		super();
	}

	public Season(int idseason, String nameseason, String dateStart, String dateEnd) {
		super();
		this.ID_Season = idseason;
		this.Name_Season = nameseason;
		this.DateStart = dateStart;
		this.DateEnd = dateEnd;
		
		
	}

	public int getID_Season() {
		return ID_Season ;
	}

	public void setID_Season(int idseason) {
		this.ID_Season  = idseason;
	}

	public String getName_Season() {
		return Name_Season;
	}

	public void setName_Season(String nameseason) {
		this.Name_Season = nameseason;
	}

	public String getDateStart() {
		return DateStart;
	}

	public void setDateStart(String dateStart) {
		this.DateStart = dateStart;
	}

	public String getDateEnd() {
		return DateEnd;
	}

	public void setDateEnd(String dateEnd) {
		this.DateEnd = dateEnd;
	}

	
}
