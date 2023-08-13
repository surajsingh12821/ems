package Entity;

public class Role {
	
	int id;
	String type;
	String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", type=" + type + ", status=" + status + "]";
	}
	public Role(int id, String type, String status) {
		super();
		this.id = id;
		this.type = type;
		this.status = status;
	}
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
