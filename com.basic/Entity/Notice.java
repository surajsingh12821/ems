package Entity;

import java.sql.Timestamp;

public class Notice {
	
	int id;
	String title;
	int notice_Type;
	String subject;
	String message;
	String date;
	String time;
	Timestamp uploaded_On;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNotice_Type() {
		return notice_Type;
	}
	public void setNotice_Type(int notice_Type) {
		this.notice_Type = notice_Type;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Timestamp getUploaded_On() {
		return uploaded_On;
	}
	public void setUploaded_On(Timestamp uploaded_On) {
		this.uploaded_On = uploaded_On;
	}
	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", notice_Type=" + notice_Type + ", subject=" + subject
				+ ", message=" + message + ", date=" + date + ", time=" + time + ", uploaded_On=" + uploaded_On + "]";
	}
	public Notice(int id, String title, int notice_Type, String subject, String message, String date, String time,
			Timestamp uploaded_On) {
		super();
		this.id = id;
		this.title = title;
		this.notice_Type = notice_Type;
		this.subject = subject;
		this.message = message;
		this.date = date;
		this.time = time;
		this.uploaded_On = uploaded_On;
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
