<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectTest02Pro</title>

<style>
#container { margin: 20px auto; width: 400px;}
h2 { text-align: center;}
table { width: 100%;, border: 1px solid black; border-collapse: collapse;}
tr { height: 40px;}
th, td { border: 1px solid black;}
th { background: #ccc;}
td { text-align: center;}

</style>
</head>
<body>
<div id="container">
	<h2></h2>
	
	<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
	
	// 폼의 파라미터 값을 받음
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	// DB 접속 정보
	String url = "jdbc:mysql://localhost:3306/db01?SSL=false";
	String dbId = "ezen01";
	String dbPwd = "1234";
	
	// 연결, 질의, 결과테이블 객체
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// sql문 - 조건의 아이디에 해당하는 사원 조회
	String sql = "select * from member where id = ?";
	
	try {
		Class.forName("com.mysql.jdbc.Driver"); // 1단계 - 드라이버 연결
		conn = DriverManager.getConnection(url, dbId, dbPwd); // 2단계 - DB 접속
		
		pstmt = conn.prepareStatement(sql); // 3단계 - pstmt 생성, 바인딩 변수 값을 설정
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); // 4단계 - sql문 실행, rs로 결과를 받음
		
		// if문: 1건의 데이터, while문: 여러 건의 데이터
		if(rs.next()) { // 아이디가 존재
			String t_pwd = rs.getString("pwd");
			if(pwd.equals(t_pwd)) { // 아이디가 존재하고, 그 아이디의 비밀번호 일치할 때
				String name = rs.getString("name");
				int age = rs.getInt("age");
				Timestamp regDate = rs.getTimestamp("regDate");
				out.print("<h2>" + id + "님의 회원정보</h2><br>");
				out.print("<table>");
				out.print("<tr><th>아이디</th><td>" + id + "</td></tr>");
				out.print("<tr><th>비밀번호</th><td>" + pwd + "</td></tr>");
				out.print("<tr><th>이름</th><td>" + name + "</td></tr>");
				out.print("<tr><th>나이</th><td>" + age + "</td></tr>");
				out.print("<tr><th>가입일자</th><td>" + sdf.format(regDate) + "</td></tr>");
				
				
				out.print("</table>");
			} else { // 아이디는 존재하지만, 그 아이디의 비밀번호가 일치하지 않을 때
				out.print("<script>alert('비밀번호가 일치하지 않습니다.');history.back();</script>");	
			}
		} else { // 아이디가 존재하지 않다.
			out.print("<script>alert('아이디가 존재하지 않습니다.');history.back();</script>");
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null) { try { rs.close();} catch(Exception e) { e.printStackTrace();}} // 먼저 연것부터 닫아줘야한다.
		if(pstmt != null) { try { pstmt.close();} catch(Exception e) { e.printStackTrace();}}
		if(conn != null) { try { conn.close();} catch(Exception e) {e.printStackTrace();}}
	}
	%>
	
</div>

</body>
</html>