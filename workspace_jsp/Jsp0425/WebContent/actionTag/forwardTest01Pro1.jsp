<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest01Pro1</title>
</head>
<body>
	<h2>정보 처리 페이지</h2>
	<p>지금 페이지는 forwardTest01Pro.jsp</p> 페이지입니다. <br>
	
	<jsp:forward page="forwardTest01Pro2.jsp"></jsp:forward>
	
	<p>이 페이지에서 포워딩이 발생합니다.</p>

</body>
</html>