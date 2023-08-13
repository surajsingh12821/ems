package Entity;

import java.util.Date;

public class Year {
	private int id;
	private String year_Name;
	private Date start_Date;
	private Date end_Date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getYear_Name() {
		return year_Name;
	}
	public void setYear_Name(String year_Name) {
		this.year_Name = year_Name;
	}
	public Date getStart_Date() {
		return start_Date;
	}
	public void setStart_Date(Date start_Date) {
		this.start_Date = start_Date;
	}
	public Date getEnd_Date() {
		return end_Date;
	}
	public void setEnd_Date(Date end_Date) {
		this.end_Date = end_Date;
	}
	@Override
	public String toString() {
		return "Year [id=" + id + ", year_Name=" + year_Name + ", start_Date=" + start_Date + ", end_Date=" + end_Date
				+ "]";
	}
	public Year(int id, String year_Name, Date start_Date, Date end_Date) {
		super();
		this.id = id;
		this.year_Name = year_Name;
		this.start_Date = start_Date;
		this.end_Date = end_Date;
	}
	public Year(String year_Name, Date start_Date, Date end_Date) {
		super();
		this.year_Name = year_Name;
		this.start_Date = start_Date;
		this.end_Date = end_Date;
	}
	public Year() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	
}
