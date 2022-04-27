<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogout</title>
</head>
<body>
	<%
	// id 세션을 삭제
	session.removeAttribute("id");
	response.sendRedirect("sessionLoginForm.jsp");
	%>

</body>
</html>