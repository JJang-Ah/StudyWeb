package test;


/*
 자바빈(JavaBean)
 - JSP에서 자바의 문법을 사용하기 위해서 만든 클래스 파일
 - JSP에서 데이터를 효율적으로 전달하기 위해 자바의 클래스를 사용
 - 자바빈은 액션태그 중에서 useBean, getProperty, setProperty에서 사용
 - 
 
 < 자바빈의 규칙 >
 1. 멤버변수는 반드시 private를 붙여서 외부에서 접근할수 없도록 한다.
 2. 객체의 정보에 접근할 때는 public을 붙인 getter/setter 메소드를 사용한다.
 3. 생성자는 디폴트 생성자를 사용한다. 생성자 오버로딩은 사용하지 않는다. 
 
 
 */
// 자바빈 정의
public class TestBean {

	private String id; // 사용자 아이디
	private String name; // 사용자 이름
	
	//setter
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//getter
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	
}
