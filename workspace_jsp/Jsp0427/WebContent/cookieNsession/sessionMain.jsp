<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionMain</title>
</head>
<body>
	<h2>로그인 확인</h2>
	
	<%
	String id = (String)session.getAttribute("id");
	if(id == null) { // id가 null일 때
		response.sendRedirect("sessionLoginForm.jsp");
	} 
	
	// id가 null이 아닐 떄, id값을 받았을 때
	%>
	
	<b><%=id %></b>님이 로그인 하였습니다. <br><br>
	<a href="sessionLogout.jsp">로그아웃</a>
</body>
</html>