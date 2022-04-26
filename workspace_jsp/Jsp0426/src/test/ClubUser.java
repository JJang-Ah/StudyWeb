package test;


/*
 < 자바빈 >
 - 프로퍼티명: id, pwd, name, clubname, age, tel, email, addr
  
  문제) 
  1. 자바빈을 완성하시오.
  2. clubUserForm.jsp에서 입력폼을 만들어 clubUserPro.jsp에서 처리하도록 하시오.
  3. clubUserForm.jsp에서는 액션태그를 사용하여 사용자 정보를 처리하고, 테이블 형태로 출력하시오.
 
 */
public class ClubUser {

	private String id;
	private String pwd;
	private String name;
	private String clubName;
	private int age;
	private String tel;
	private String email;
	private String addr;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
