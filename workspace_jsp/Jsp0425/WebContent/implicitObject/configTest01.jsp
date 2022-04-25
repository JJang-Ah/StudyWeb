<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>configTest01</title>
</head>

<%--
< config 내장 객체>
-- 웹 애플리케이션의 초기 정보를 저장하는 객체
1. getInitParameterNames(): 모든 초기화 파라미터 이름을 리턴
2. getInitParameter(): 초기화 파라미터 값을 리턴
3. getServletName(): 서블릿의 이름을 리턴

 --%>
<body>
	<h2>config 내장 객체</h2>
	<%
	Enumeration<String> e = config.getInitParameterNames();
	
	while(e.hasMoreElements()) {
		String initParamName = e.nextElement();
		out.print(initParamName + " : " + config.getInitParameter(initParamName) + "<br>");
		
	}
	%>	

</body>
</html>