<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>outTest01</title>
</head>

<%--
< out 내장 객체 >
- JSP 페이지에서 생성할 결과를 웹브라우저로 출력하는 객체
1. print(): 웹페이지의 결과를 웹브라우저로 출력하는 메소드
- <%= %>으로 출력하면 복잡해지는 자바의 문법을 out 내장 객체로 간단하게 출력

--%>
<body>
	<h2>out 내장객체 </h2>
	
	<%
	String name = "박서준";
	
	out.print("나의 이름은 " + name + "입니다." + "<br>");
	%>	
	
	My Name is <%=name %>.

</body>
</html>