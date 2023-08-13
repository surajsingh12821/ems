package Entity;

import java.sql.Timestamp;

public class User {
	
	private int id;
	private String user_Name;
	private String email;
	private String password;
	private String phone_No;
	private int role_Id;
	private Timestamp reg_Date;
	private String Account_Status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone_No() {
		return phone_No;
	}
	public void setPhone_No(String phone_No) {
		this.phone_No = phone_No;
	}
	public int getRole_Id() {
		return role_Id;
	}
	public void setRole_Id(int role_Id) {
		this.role_Id = role_Id;
	}
	public Timestamp getReg_Date() {
		return reg_Date;
	}
	public void setReg_Date(Timestamp reg_Date) {
		this.reg_Date = reg_Date;
	}

	public String getAccount_Status() {
		return Account_Status;
	}
	public void setAccount_Status(String account_Status) {
		Account_Status = account_Status;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", user_Name=" + user_Name + ", email=" + email + ", password=" + password
				+ ", phone_No=" + phone_No + ", role_Id=" + role_Id + ", reg_Date=" + reg_Date + ", Account_Status=" + Account_Status + "]";
	}
	public User(int id, String user_Name, String email, String password, String phone_No, int role_Id,
			Timestamp reg_Date, String account_Status) {
		super();
		this.id = id;
		this.user_Name = user_Name;
		this.email = email;
		this.password = password;
		this.phone_No = phone_No;
		this.role_Id = role_Id;
		this.reg_Date = reg_Date;
		Account_Status = account_Status;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String user_Name, String email, String password, String phone_No, int role_Id) {
		super();
		this.user_Name = user_Name;
		this.email = email;
		this.password = password;
		this.phone_No = phone_No;
		this.role_Id = role_Id;
	}
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	public User(String user_Name, int role_Id) {
		super();
		this.user_Name = user_Name;
		this.role_Id = role_Id;
	}
	public User(int id, String user_Name, String email, String password, String phone_No, int role_Id,
			String account_Status) {
		super();
		this.id = id;
		this.user_Name = user_Name;
		this.email = email;
		this.password = password;
		this.phone_No = phone_No;
		this.role_Id = role_Id;
		Account_Status = account_Status;
	}
	public User(int id, String user_Name, String email, String password, String phone_No, String account_Status) {
		super();
		this.id = id;
		this.user_Name = user_Name;
		this.email = email;
		this.password = password;
		this.phone_No = phone_No;
		Account_Status = account_Status;
	}
	
}
