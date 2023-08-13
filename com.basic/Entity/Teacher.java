package Entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Teacher extends TeacherRegForm {

	int id;
	private String registration_Apply;
	private Timestamp registration_Date;
	private String admission_Confirm;
	private Timestamp admission_Date;
	private String teacherStatus;
	
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
	public String getTeacherStatus() {
		return teacherStatus;
	}
	public void setTeacherStatus(String teacherStatus) {
		this.teacherStatus = teacherStatus;
	}
	@Override
	public String toString() {
		return "Teacher [id=" + id + ", registration_Apply=" + registration_Apply + ", registration_Date="
				+ registration_Date + ", admission_Confirm=" + admission_Confirm + ", admission_Date=" + admission_Date
				+ ", teacherStatus=" + teacherStatus + "]";
	}
	public Teacher(int id, String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, String maritalStatus, String designation, String experience,
			String highestDegree, String joiningDate, int salaryExp, int addressId, int id2, String registration_Apply,
			Timestamp registration_Date, String admission_Confirm, Timestamp admission_Date, String teacherStatus) {
		super(id, firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, maritalStatus, designation,
				experience, highestDegree, joiningDate, salaryExp, addressId);
		id = id2;
		this.registration_Apply = registration_Apply;
		this.registration_Date = registration_Date;
		this.admission_Confirm = admission_Confirm;
		this.admission_Date = admission_Date;
		this.teacherStatus = teacherStatus;
	}
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Teacher(int id, String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, String maritalStatus, String designation, String experience,
			String highestDegree, String joiningDate, int subject_Id, int salaryExp, int addressId) {
		super(id, firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, maritalStatus, designation, experience,
				highestDegree, joiningDate, subject_Id, salaryExp, addressId);
		// TODO Auto-generated constructor stub
	}
	public Teacher(int id, String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, String maritalStatus, String designation, String experience,
			String highestDegree, String joiningDate, int salaryExp, int addressId) {
		super(id, firstName, lastName, fatherName, motherName, gender, dob, bloodGroup, maritalStatus, designation, experience,
				highestDegree, joiningDate, salaryExp, addressId);
		// TODO Auto-generated constructor stub
	}
	
	
	

	
	
}
