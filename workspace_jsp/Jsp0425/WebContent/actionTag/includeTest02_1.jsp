<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest02_1</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("utf-8");

	String name = "박서준";
	String pageName = "includeTest02_2.jsp";
	%>
	
	포함하는 페이지 includeTest02_1.jsp 페이지입니다. <br>
	포함되는 페이지에 파라미터값을 전달합니다. <br>
	<hr>
	<jsp:include page="<%=pageName %>">
		<jsp:param value="<%=name %>" name="name"/>
		<jsp:param value="<%=pageName %>" name="pageName"/>
	</jsp:include>
	

</body>
</html>