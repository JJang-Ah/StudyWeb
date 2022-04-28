<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteTest01Pro</title>
</head>
<body>
<div id="container">
	<%
	request.setCharacterEncoding("utf-8");

	// 폼에서 넘어오는 파라미터값 받음
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
	
	// sql문 - 조건의 아이디에 해당하는 사원 조회, 조건의 아이디와 비밀번호가 일치하는 사원을 삭제
	String sql = "select * from member where id = ?";
	String sql2 = "delete from member where id = ? and pwd = ?"; // oracle에서는 delete만 쓰지만 mysql에서는 delete from 을 써야한다.
	int cnt = 0;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, dbId, dbPwd);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()) { //아이디가 존재한다.
			String t_pwd = rs.getString("pwd");
			if(pwd.equals(t_pwd)) { // 아이디가 존재하고, 그 아이디에 대한 비밀번호도 일치 할 때
				// 해당 아이디의 정보를 삭제
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				cnt = pstmt.executeUpdate();
				if(cnt > 0) {
					out.print(id + "님의 회원정보가 삭제되었습니다.");
				} else {
					out.print(id + "님의 회원정보가 삭제되지 않았습니다.");
				}
			} else { // 아이디는 존재하지만, 비밀번호가 일치하지 않을 때
				out.print("<script>alert('비밀번호가 일치하지 않습니다.');history.back();</script>");
			}
		} else { // 아이디가 존재하지 않는다.
			out.print("<script>alert('아이디가 존재하지 않습니다.');history.back();</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rs != null) { try { rs.close();} catch(Exception e) { e.printStackTrace();}} // 먼저 열린 것부터 닫아줘야한다.
		if(pstmt != null) { try { pstmt.close();} catch(Exception e) { e.printStackTrace();}}
		if(conn != null) { try { conn.close();} catch(Exception e) {e.printStackTrace();}}
	}
	
	
	%>
</div>

</body>
</html>