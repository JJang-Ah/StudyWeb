<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContextTest01</title>
</head>

<%--
< pageContext 내장 객체>
-- 현재 페이지와 관련된 저어보를 갖는 영역 객체
-- JSP 펭지와 관련된 다른 내장 객체의 정보를 얻거나, 현재 페이지의 요청과 응담에 관한 제어권을 다른 페이지로 넘겨주는데 사용

1. getRequest(): 페이지에서 request 내장 객체를 리턴
2. getResponse(): 페이지에서 response 내장 객체를 리턴
3. getSession(): 페이지에서 session 내장객체를 리턴
4. forward(): 현재 페이지의 요청과 응답에 관한 제어권을 다른 페이지로 영구적으로 넘겨주는 메소드
5. include(): 현재 페이지의 요청과 응답에 관한 제어권을 다른 페이지로 넘겨주고 처리가 끝나면 다시 제어권이 돌아오는 메소드

 --%>
<body>
	<h2>pageContextTest01 페이지</h2>
	<hr>
	<%
	pageContext.forward("pageContextTest02.jsp");
	%>
</body>
</html>