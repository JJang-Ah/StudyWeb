<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Test 02</title>
</head>
<body>
<% request.setAttribute("name", "한이한"); %>

요청 URI: ${pageContext.request.requestURI } <br>
request의 name 값: ${requestScope.name } <br>
request의 code 값: ${requestScope.code } <br>


</body>
</html>