<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트 요소2</title>
</head>
<body>
	<h2>JSP 스크립트 요소2</h2>
	<%
	String[] subjects = {"HTML/CSS3", "Javascript", "Java", "MySQL", "JSP"};
	int i = (int)(Math.random() * 5);
	String s = subjects[i];
	%>
	
	당신은 <%=s %>과목을 좋아합니다. <br>

</body>
</html>