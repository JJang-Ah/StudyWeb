<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest01Pro2</title>
</head>
<body>


	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String hobby = request.getParameter("hobby");
	%>
	
	<p>포워딩 페이지 forwardTest01Pro2.jsp페이지 입니다.</p>
	<b><%=id %></b>님의 취미는 <b><%=hobby %></b>입니다. <br>
	
	
</body>
</html>