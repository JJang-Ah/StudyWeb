<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseRedirect01</title>
</head>

<%--
< response 내장 객체 메소드 >
1. sendRedirect(): 페이지를 이동하는 메소드, url로 주어진 페이지로 제어가 이동됨.
※redirect와 forward의 차이점 -> 액션 태그에서 설명

2. addCooki(): 쿠키를 설정하는 메소드
※cookie와 session에서 설명
 --%>
<body>
	<h2>response 내장 객체 - redirect 메소드</h2>
	
	현재 페이지는 <b>responseRedirect01.jsp</b> 페이지입니다.
	
	<%
	response.sendRedirect("responseRedirect02.jsp");
	// 바로 responseRedirect02.jsp 파일로 넘어간다.
	%>

</body>
</html>