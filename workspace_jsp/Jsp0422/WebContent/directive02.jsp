<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디렉티브(directive) 기본2 - include</title>
</head>

<%-- 
(2) include directive
-- 여러 페이지에서 공통적으로 사용하는 내용이 있을 때, 그 내용을 따로 파일로 저장하고, 필요할 때 삽입하여 사용하는 기능
※ include 액션태그 (action tag) - 동적인 방법

(3) taglib directive
- EL(Expression Language, 표현 언어), JSTL(JSP Standard Tag Library,
 커스텀 태그(Custom Tag)를 활용할 때 사용
 --%>
<body>
	<%
	String name = "철수철수김철수";
	%>

	<%@ include file="directive02_top.jsp"%>
	<hr>
	<h2>Main Page</h2>
	<p>메인페이지 입니다. </p>
	<hr>
	<%@ include file="directive02_bottom.jsp" %>
	
</body>
</html>