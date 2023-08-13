package Entity;

public class Classes {
	private int id;
	private String class_Name;
	private String class_Teacher;
	private int class_Room;
	private int total_Seat;
	private int available_Seat;
	private String class_Pic;
	private int year_Id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClass_Name() {
		return class_Name;
	}
	public void setClass_Name(String class_Name) {
		this.class_Name = class_Name;
	}
	public String getClass_Teacher() {
		return class_Teacher;
	}
	public void setClass_Teacher(String class_Teacher) {
		this.class_Teacher = class_Teacher;
	}
	public int getClass_Room() {
		return class_Room;
	}
	public void setClass_Room(int class_Room) {
		this.class_Room = class_Room;
	}
	public int getTotal_Seat() {
		return total_Seat;
	}
	public void setTotal_Seat(int total_Seat) {
		this.total_Seat = total_Seat;
	}
	public int getAvailable_Seat() {
		return available_Seat;
	}
	public void setAvailable_Seat(int available_Seat) {
		this.available_Seat = available_Seat;
	}
	public String getClass_Pic() {
		return class_Pic;
	}
	public void setClass_Pic(String class_Pic) {
		this.class_Pic = class_Pic;
	}
	public int getYear_Id() {
		return year_Id;
	}
	public void setYear_Id(int year_Id) {
		this.year_Id = year_Id;
	}
	@Override
	public String toString() {
		return "Classes [id=" + id + ", class_Name=" + class_Name + ", class_Teacher=" + class_Teacher + ", class_Room="
				+ class_Room + ", total_Seat=" + total_Seat + ", available_Seat=" + available_Seat + ", class_Pic="
				+ class_Pic + ", year_Id=" + year_Id + "]";
	}
	public Classes(int id, String class_Name, String class_Teacher, int class_Room, int total_Seat, int available_Seat,
			String class_Pic, int year_Id) {
		super();
		this.id = id;
		this.class_Name = class_Name;
		this.class_Teacher = class_Teacher;
		this.class_Room = class_Room;
		this.total_Seat = total_Seat;
		this.available_Seat = available_Seat;
		this.class_Pic = class_Pic;
		this.year_Id = year_Id;
	}
	public Classes() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
