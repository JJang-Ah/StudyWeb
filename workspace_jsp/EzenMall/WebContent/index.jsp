<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index 파일</title>
</head>
<body>

<%-- 인터넷 주소창에 localhost:8088/EzenMall 만 입력해도 shopAll 페이지로 넘어간다. --%>
<% response.sendRedirect("mall/shopping/shopAll.jsp"); %>

</body>
</html>