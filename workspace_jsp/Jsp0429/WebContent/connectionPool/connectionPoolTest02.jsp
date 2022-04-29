<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.text.*, db.conn.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container { width: 600px; margin: 20px auto;}
	h2 { text-align: center;}
	table { width: 100%; border: 1px solid black; border-collapse: collapse;}
	tr { height: 35px;}
	th, td { border: 1px solid black;}
	td { text-align: center;}
	th { background: #ccc;}
</style>
</head>
<body>

<div id="container">
	<h2>전체 회원 정보 확인</h2>
	
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member";
	
	try {
		// 커넥션 풀을 사용하는 방법
		conn = JDBCUtil.getConnection();
		
		// 3~5 단계

		pstmt = conn.prepareStatement(sql); // 3단계 - PreparedStatement 객체 생성
		rs = pstmt.executeQuery(); // 4단계 - sql 실행
		
		out.print("<table><tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>나이</th><th>가입일자</th></tr>");
		while(rs.next()) { // rs로 가져온 결과 테이블에 다음 데이터가 있다면 
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");
			int age = rs.getInt("age");
			Timestamp regDate = rs.getTimestamp("regDate");

			out.print("<tr>");
			out.print("<td width='15%'>" + id + "</td>");
			out.print("<td width='15%'>" + pwd + "</td>");
			out.print("<td width='10%'>" + name + "</td>");
			out.print("<td width='10%'>" + age + "</td>");
			out.print("<td width='45%'>" + sdf.format(regDate) + "</td>");
			out.print("</tr>");
		}
		out.print("</table>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JDBCUtil.close(conn, pstmt, rs);
	}
	
	%>
	
</div>

</body>
</html>