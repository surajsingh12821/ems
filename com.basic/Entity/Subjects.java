package Entity;

public class Subjects {
	private int id;
	private String  subject_Name;
	private String  subject_Type;
	private String  subject_Teacher;
	private int subject_Marks; 
	private String subject_Book;
	private String subject_Notes;
	private int class_Id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject_Name() {
		return subject_Name;
	}
	public void setSubject_Name(String subject_Name) {
		this.subject_Name = subject_Name;
	}
	public String getSubject_Type() {
		return subject_Type;
	}
	public void setSubject_Type(String subject_Type) {
		this.subject_Type = subject_Type;
	}
	public String getSubject_Teacher() {
		return subject_Teacher;
	}
	public void setSubject_Teacher(String subject_Teacher) {
		this.subject_Teacher = subject_Teacher;
	}
	public int getSubject_Marks() {
		return subject_Marks;
	}
	public void setSubject_Marks(int subject_Marks) {
		this.subject_Marks = subject_Marks;
	}
	public String getSubject_Book() {
		return subject_Book;
	}
	public void setSubject_Book(String subject_Book) {
		this.subject_Book = subject_Book;
	}
	public String getSubject_Notes() {
		return subject_Notes;
	}
	public void setSubject_Notes(String subject_Notes) {
		this.subject_Notes = subject_Notes;
	}
	public int getClass_Id() {
		return class_Id;
	}
	public void setClass_Id(int class_Id) {
		this.class_Id = class_Id;
	}
	@Override
	public String toString() {
		return "Subjects [id=" + id + ", subject_Name=" + subject_Name + ", subject_Type=" + subject_Type
				+ ", subject_Teacher=" + subject_Teacher + ", subject_Marks=" + subject_Marks + ", subject_Book="
				+ subject_Book + ", subject_Notes=" + subject_Notes + ", class_Id=" + class_Id + "]";
	}
	public Subjects(int id, String subject_Name, String subject_Type, String subject_Teacher, int subject_Marks,
			String subject_Book, String subject_Notes, int class_Id) {
		super();
		this.id = id;
		this.subject_Name = subject_Name;
		this.subject_Type = subject_Type;
		this.subject_Teacher = subject_Teacher;
		this.subject_Marks = subject_Marks;
		this.subject_Book = subject_Book;
		this.subject_Notes = subject_Notes;
		this.class_Id = class_Id;
	}
	public Subjects() {
		super();
		// TODO Auto-generated constructor stub
	} 
	

}
