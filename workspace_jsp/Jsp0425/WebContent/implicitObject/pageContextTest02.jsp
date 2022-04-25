<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContextTest02</title>
</head>
<body>
	<h2>pageContextTest02 페이지</h2>
	
	<h3>지금 페이지는 pageContextTest02.jsp 페이지입니다.</h3>
	<hr>
	<%
	pageContext.include("pageContextTest03.jsp");
	%>


</body>
</html>