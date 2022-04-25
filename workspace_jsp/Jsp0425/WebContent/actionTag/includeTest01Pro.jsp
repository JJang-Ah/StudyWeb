<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest01Pro</title>
</head>
<body>
	<h2>정보 처리 페이지</h2>
	
	<%
	request.setCharacterEncoding("utf-8");
	String pageName = request.getParameter("pageName");
	%>
	
	포함하는 페이지 includeTest01Pro.jsp 페이지입니다.
	<hr>
	
	<jsp:include page="<%=pageName %>"></jsp:include>

</body>
</html>