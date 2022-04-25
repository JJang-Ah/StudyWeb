<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest01Pro2</title>
</head>
<body>

	포함되는 페이지 includeTest01Pro2.jsp 페이지입니다. <br>
	<%
	String name = request.getParameter("name");
	%>
	<b><%=name %></b>님이 입장하였습니다.

</body>
</html>