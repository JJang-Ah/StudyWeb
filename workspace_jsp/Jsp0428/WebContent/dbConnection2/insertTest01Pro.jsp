<%-- <%@ page import="java.sql.Statement"%> --%>
<%-- <%@ page import="java.sql.Connection"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> <!-- on-demand import 방법 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTest01Pro</title>
<style>



</style>
</head>

<%--
< JDBC 연동 프로그래밍 >
1. C(create) - insert
< JSP 페이지에서 DB로 데이터를 삽입하는 작업 >
1단계: 드라이버명으로 DB를 확인
2단계: url, 계정명, 계정비밀번호를 사용하여 DB에 접속 -> 커넥션을 획득 (Connection 객체)
3단계: Statement, PrepareStatement, CallableStatement 3가지 중에 하나의 객체를 생성
Statement: SQL을 사용할 수 있는 객체, sql을 연결하여 질의하는 방법을 제공, 단점: 연결된 sql문이 길어지고, 복잡함.
PreparedStatement: SQL문을 사용할 수 있는 객체, sql을 연결하여 질의하는 방법을 제공, Statement 객체의 단점을 보완, 장점: sql문이 간결, 바인딩(binding) 변수(홀더)를 사용
CallableStatement: PL/SQL을 사용할 수 있는 객체 

4단계: Statement, PreparedStatement 객체를 사용하여 sql문을 실행함.


 --%>
 
<body>
	<div id="container">
		<h2>회원 정보 확인</h2>
		
		<%
		request.setCharacterEncoding("utf-8");
		
		// 1번 - 폼에서 넘어오는 데이터 받는 방법 (request)
		/*
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		*/
		%>
		
		<!--  2번 - 폼에서 넘어오는 데이터 받는 방법(action tag 중에서 useBean 사용)  -->
		<jsp:useBean id="member" class="bean.Member"/>
		<jsp:setProperty property="*" name="member"/> <!-- name은 useBean의 id값 -->
		<%
		String id = member.getId();
		String pwd = member.getPwd();
		String name = member.getName();
		int age = member.getAge();
		/////////////////////////////
		// DB 접속 정보
		String url = "jdbc:mysql://localhost:3306/db01?SSL=false";
		String dbId = "ezen01";
		String dbPwd = "1234";
		
		// 연결, 질의 객체
		Connection conn = null;
// 		Statement stmt = null;
		PreparedStatement pstmt = null;
		
		// SQL문 - insert문
		// 1번 - Statement 객체에서 사용하는 sql문
		// 문자는 '' 홀따옴표로 감싼다. 정수는 ""만 감싼다.
		// String sql = "insert into member values('" + id + "', '" + pwd + "', '" + name + "', " + age + ", now()" + ")";
		
		// 2번 - PreparedStatement 객체에서 사용하는 sql문
		String sql = "insert into member values(?, ?, ?, ?, now())"; // ? : 바인딩(binding) 변수
		int cnt = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); // 1단계: DB 드라이버 인식/확인
			conn = DriverManager.getConnection(url, dbId, dbPwd); // 2단계: DB 접속 -> 커넥션 획득
			
			// 1번 - Statement 객체를 사용
			//stmt = conn.createStatement(); // 3단계: Statement 객체를 생성
			//cnt = stmt.executeUpdate(sql); // 4단계: Statement 객체를 사용하여 dql문을 실행 -> 결과는 insert, update, delete인 경우에는 행의 수를 리턴
			
			// 2번 - PreparedStatement 객체를 사용
			pstmt = conn.prepareStatement(sql); // 3단계: PreparedStatement 객체를 생성하고, 바인딩 변수에 값을 삽입 
			pstmt.setString(1, id); // 1번째 ?(바인딩 변수)에 id값을 넣는다.
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setInt(4, age);
			cnt = pstmt.executeUpdate(); // 4단계: sql문을 실행 -> 결과는 insert, update, delete의 경우에는 행의 수를 리턴
			
			if(cnt > 0){ // insert 성공
				out.print("데이터 추가에 성공하였습니다.");
			} else { // insert 실패
				out.print("데이터 추가에 실패하였습니다.");
			}
		} catch(Exception e) {
			e.printStackTrace(); // 예외를 단계별로 전부 보여준다.
			out.print("데이터 추가시에 예외가 발생하였습니다.");
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			if(conn != null) {
				try {
					conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		%>
		
		
	</div>
	
</body>
</html>