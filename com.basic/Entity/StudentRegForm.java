package Entity;

import java.sql.Date;

public class StudentRegForm {
	
	int id;
	private String firstName;
	private String lastName;
	private String fatherName;
	private String motherName;
	private String gender;
	private Date dob;
	private String bloodGroup;
	private int year_Id;
	private int class_Id;
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
	public int getYear_Id() {
		return year_Id;
	}
	public void setYear_Id(int year_Id) {
		this.year_Id = year_Id;
	}
	public int getClass_Id() {
		return class_Id;
	}
	public void setClass_Id(int class_Id) {
		this.class_Id = class_Id;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	@Override
	public String toString() {
		return "StudentRegForm [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", fatherName="
				+ fatherName + ", motherName=" + motherName + ", gender=" + gender + ", dob=" + dob + ", bloodGroup="
				+ bloodGroup + ", year_Id=" + year_Id + ", class_Id=" + class_Id + ", addressId=" + addressId + "]";
	}
	public StudentRegForm(int id, String firstName, String lastName, String fatherName, String motherName,
			String gender, Date dob, String bloodGroup, int year_Id, int class_Id, int addressId) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.gender = gender;
		this.dob = dob;
		this.bloodGroup = bloodGroup;
		this.year_Id = year_Id;
		this.class_Id = class_Id;
		this.addressId = addressId;
	}
	public StudentRegForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StudentRegForm(String firstName, String lastName, String fatherName, String motherName, String gender,
			Date dob, String bloodGroup, int year_Id, int class_Id) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.gender = gender;
		this.dob = dob;
		this.bloodGroup = bloodGroup;
		this.year_Id = year_Id;
		this.class_Id = class_Id;
	}
	
	
	

}
