package Entity;

import java.sql.Timestamp;

public class Email {
	
	String message;
	String subject;
	String to;
	String from;
	
	Timestamp send_Date;
	
	public Timestamp getSend_Date() {
		return send_Date;
	}
	public void setSend_Date(Timestamp send_Date) {
		this.send_Date = send_Date;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	@Override
	public String toString() {
		return "MyMessage [message=" + message + ", subject=" + subject + ", to=" + to + ", from=" + from
				+ ", send_Date=" + send_Date + "]";
	}
	public Email(String message, String subject, String to, String from) {
		super();
		this.message = message;
		this.subject = subject;
		this.to = to;
		this.from = from;
	}
	public Email() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Email(String message, String subject, String to, String from, Timestamp send_Date) {
		super();
		this.message = message;
		this.subject = subject;
		this.to = to;
		this.from = from;
		this.send_Date = send_Date;
	}
	
	

}
