package Entity;

import java.sql.Date;

public class TeacherRegForm {
	
	int id;
	private String firstName;
	private String lastName;
	private String fatherName;
	private String motherName;
	private String gender;
	private Date dob;
	private String bloodGroup;
	private String maritalStatus;
	private String designation;
	private String experience;
	private String highestDegree;
	private String joiningDate;
	private int subject_Id;
	private int salaryExp;
	private int addressId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getBloodGroup() {
		return bloodGroup;
	}
	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getHighestDegree() {
		return highestDegree;
	}
	public void setHighestDegree(String highestDegree) {
		this.highestDegree = highestDegree;
	}
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	public int getSalaryExp() {
		return salaryExp;
	}
	public void setSalaryExp(int salaryExp) {
		this.salaryExp = salaryExp;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int address) {
		this.addressId = addressId;
	}
	@Override
	public String toString() {
		return "TeacherRegForm [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", fatherName="
				+ fatherName + ", motherName=" + motherName + ", gender=" + gender + ", dob=" + dob + ", bloodGroup="
				+ bloodGroup + ", maritalStatus=" + maritalStatus + ", designation=" + designation + ", experience="
				+ experience + ", highestDegree=" + highestDegree + ", joiningDate=" + joiningDate + ", subject_Id="
				+ subject_Id + ", salaryExp=" + salaryExp + ", address=" + addressId + "]";
	}
	public TeacherRegForm(int id, String firstName, String lastName, String fatherName, String motherName,
			String gender, Date dob, String bloodGroup, String maritalStatus, String designation, String experience,
			String highestDegree, String joiningDate, int salaryExp, int addressId) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.gender = gender;
		this.dob = dob;
		this.bloodGroup = bloodGroup;
		this.maritalStatus = maritalStatus;
		this.designation = designation;
		this.experience = experience;
		this.highestDegree = highestDegree;
		this.joiningDate = joiningDate;
		this.salaryExp = salaryExp;
		this.addressId = addressId;
	}
	public TeacherRegForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSubject_Id() {
		return subject_Id;
	}
	public void setSubject_Id(int subject_Id) {
		this.subject_Id = subject_Id;
	}
	public TeacherRegForm(int id, String firstName, String lastName, String fatherName, String motherName,
			String gender, Date dob, String bloodGroup, String maritalStatus, String designation, String experience,
			String highestDegree, String joiningDate, int subject_Id, int salaryExp, int addressId) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.gender = gender;
		this.dob = dob;
		this.bloodGroup = bloodGroup;
		this.maritalStatus = maritalStatus;
		this.designation = designation;
		this.experience = experience;
		this.highestDegree = highestDegree;
		this.joiningDate = joiningDate;
		this.subject_Id = subject_Id;
		this.salaryExp = salaryExp;
		this.addressId = addressId;
	}
	
}

