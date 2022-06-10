package doctor;

public class DoctorDTO {
	private String id;
	private String password;
	private String name;
	private String snum;
	private String major;
	private String tel;
	private String address;
	private String email;
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getSnum() {
		return snum;
	}
	public String getMajor() {
		return major;
	}
	public String getTel() {
		return tel;
	}
	public String getAddress() {
		return address;
	}
	public String getEmail() {
		return email;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "DoctorDTO [id=" + id + ", password=" + password + ", name=" + name + ", snum=" + snum + ", major="
				+ major + ", tel=" + tel + ", address=" + address + ", email=" + email + "]";
	}
	
	

}
