package Entity;

public class Holiday {
	
	int id;
	String name;
	String date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Holiday [id=" + id + ", name=" + name + ", date=" + date + "]";
	}
	public Holiday(int id, String name, String date) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
	}
	public Holiday() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
