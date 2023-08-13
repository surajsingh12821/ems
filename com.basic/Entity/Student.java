package Entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Student extends StudentRegForm{
	
	int id;
	String registration_Apply;
	Timestamp registration_Date;
	String admission_Confirm;
	Timestamp admission_Date;
	String studentStatus;
	int reg_Id;
	int user_Id;
	
	public Student(int id, String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, int year_Id, int class_Id, int addressId, int id2, String registration_Apply,
			Timestamp registration_Date, String admission_Confirm, Timestamp admission_Date, String studentStatus,
			int reg_Id, int user_Id) {
		super(id, firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, year_Id, class_Id, addressId);
		id = id2;
		this.registration_Apply = registration_Apply;
		this.registration_Date = registration_Date;
		this.admission_Confirm = admission_Confirm;
		this.admission_Date = admission_Date;
		this.studentStatus = studentStatus;
		this.reg_Id = reg_Id;
		this.user_Id = user_Id;
	}
	public int getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(int user_Id) {
		this.user_Id = user_Id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRegistration_Apply() {
		return registration_Apply;
	}
	public void setRegistration_Apply(String registration_Apply) {
		this.registration_Apply = registration_Apply;
	}
	public Timestamp getRegistration_Date() {
		return registration_Date;
	}
	public void setRegistration_Date(Timestamp registration_Date) {
		this.registration_Date = registration_Date;
	}
	public String getAdmission_Confirm() {
		return admission_Confirm;
	}
	public void setAdmission_Confirm(String admission_Confirm) {
		this.admission_Confirm = admission_Confirm;
	}
	public Timestamp getAdmission_Date() {
		return admission_Date;
	}
	public void setAdmission_Date(Timestamp admission_Date) {
		this.admission_Date = admission_Date;
	}
	public String getStudentStatus() {
		return studentStatus;
	}
	public void setStudentStatus(String studentStatus) {
		this.studentStatus = studentStatus;
	}
	public int getReg_Id() {
		return reg_Id;
	}
	public void setReg_Id(int reg_Id) {
		this.reg_Id = reg_Id;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", registration_Apply=" + registration_Apply + ", registration_Date="
				+ registration_Date + ", admission_Confirm=" + admission_Confirm + ", admission_Date=" + admission_Date
				+ ", studentStatus=" + studentStatus + ", reg_Id=" + reg_Id + ", user_Id=" + user_Id + "]";
	}
	public Student(int id, String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, int year_Id, int class_Id, int addressId, String registration_Apply,
			Timestamp registration_Date, int reg_Id) {
		super(id, firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, year_Id, class_Id, addressId);
		this.registration_Apply = registration_Apply;
		this.registration_Date = registration_Date;
		this.reg_Id = reg_Id;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(int id, String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, int year_Id, int class_Id, int addressId) {
		super(id, firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, year_Id, class_Id, addressId);
		// TODO Auto-generated constructor stub
	}
	public Student(String firstName, String lastName, String fatherName, String motherName, String gender, Date dob,
			String bloodGroup, int year_Id, int class_Id) {
		super(firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, year_Id, class_Id);
		// TODO Auto-generated constructor stub
	}
	public Student(int id, String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, int year_Id, int class_Id, int addressId, int id2, String registration_Apply,
			Timestamp registration_Date, int user_Id) {
		super(id, firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, year_Id, class_Id, addressId);
		id = id2;
		this.registration_Apply = registration_Apply;
		this.registration_Date = registration_Date;
		this.user_Id = user_Id;
	}
	

	

}
