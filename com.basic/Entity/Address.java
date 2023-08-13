package Entity;

public class Address {

	private int id;
	private String address;
	private String city;
	private String state;
	private String zipcode;
	private String country;
	private String phoneNo;
	
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", city=" + city + ", state=" + state + ", zipcode="
				+ zipcode + ", country=" + country + ", phoneNo=" + phoneNo + "]";
	}
	public Address(int id, String address, String city, String state, String zipcode, String country, String phoneNo) {
		super();
		this.id = id;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipcode = zipcode;
		this.country = country;
		this.phoneNo = phoneNo;
	}
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
