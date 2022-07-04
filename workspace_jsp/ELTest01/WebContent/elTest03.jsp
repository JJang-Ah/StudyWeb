<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Test 02</title>
</head>
<body>
<%--
1. JSP 영역객체 4가지의 사용 범위
- JSP 기본 : page < request < session < application
- EL : pageScope < requestScope < sessionScope < application

 --%>
 
 <%
 request.setAttribute("dataName", "Request Attribute");
 session.setAttribute("dataName", "Session Attribute");
 application.setAttribute("dataName", "Application Attribute");
 %>
 <%-- 1. JSP 문법 --%>
 JSP 기본 문법: request 내장객체의 값: <%=request.getAttribute("dataName") %><br>
 JSP 기본 문법: session 내장객체의 값: <%=session.getAttribute("dataName") %><br>
 JSP 기본 문법: application 내장객체의 값: <%=application.getAttribute("dataName") %><br>
 
 <%-- 2. EL --%>
 <%-- 이름이 겹칠때는 작은 범위의 값을 우선적으로 출력 --%>
 EL request 내장객체의 값: ${requestScope.dataName }<br>
 EL session 내장객체의 값: ${sessionScope.dataName }<br>
 EL application 내장객체의 값: ${applicationScope.dataName }<br>
 EL: ${dataName}
 


</body>
</html>