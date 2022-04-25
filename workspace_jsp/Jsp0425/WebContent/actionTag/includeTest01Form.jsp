<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest01Form</title>
</head>
<%--
★★★★★
<액션 태그>
- JSP 스크립트 요소를 사용하지 않아 태그로 구현하여 데이터의 이동과 흐름을 제어할 수 있도록 하는 기능
- include, forward, javabean(useBean, setProperty, getProperty), plug-in(현재 사용하지 않음)

※include directive: 다른 웹페이지를 정적으로 포함
※include action tag: 다른 웹페이지를 동적으로 포함


 --%>
<body>
	<h2>include action tag</h2>
	
	<form action="includeTest01Pro.jsp" method="post">
		이름: <input type="text" name="name"> <br>
		페이지 이름: <input type="text" name="pageName" value="includeTest01Pro2.jsp"> <br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>