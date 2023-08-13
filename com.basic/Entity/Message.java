package Entity;

import java.sql.Timestamp;

public class Message {

	
	int id;
	String name;
	String email;
	String phoneno;
	String message;
	String is_Read;
	Timestamp time;
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getIs_Read() {
		return is_Read;
	}
	public void setIs_Read(String is_Read) {
		this.is_Read = is_Read;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", name=" + name + ", email=" + email + ", phoneno=" + phoneno + ", message="
				+ message + ", is_Read=" + is_Read + ", time=" + time + "]";
	}
	public Message(int id, String name, String email, String phoneno, String message, String is_Read, Timestamp time) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phoneno = phoneno;
		this.message = message;
		this.is_Read = is_Read;
		this.time = time;
	}
	public Message(String name, String email, String phoneno, String message) {
		super();
		this.name = name;
		this.email = email;
		this.phoneno = phoneno;
		this.message = message;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
