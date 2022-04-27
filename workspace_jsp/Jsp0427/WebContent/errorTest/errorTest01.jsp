<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorTest01</title>
</head>

<%--

< JSP 에러 메시지 >
-- 그중에서 가장 많이 발현되는 메시지 2가지
404: 해당 페이지가 없을 때, 페이지를 찾지 못했을 때 -> 해결책: 페이지가 없거나, 페이지의 위치가 잘못되었거나, 페이지의 이름이 다르거나
500: JSP, JAVA, SQL의 문법적인 오류가 발생했을 때 -> JSP, JAVA, SQL의 문법이 정확한지 살펴봄.

-- 기타 알아두어야 하는 에러 메시지
400: Bad Request, 요청 실패
405: Method Not Allowed, 허용되지 않은 메소드를 사용할 때
406: Not Acceptable, 서버가 받아들일 수 없는 요청을 할 때
407: Proxy Authentication Required, Proxy Server의 인증이 필요할 때
408: Request Timeout, 요청 시간이 초과
413: Request Entity Error, 요청이 과도하게 많은 경우
414: Request-URI Too Long, 요청한 URI가 너무 갈때 발생하는 에러

502: Bad Gateway, 게이트웨이가 사용 불가할 때
503: Service Unavailable, 서비스 이용 불가일 때
504: Gateway Timeout, 게이트웨이의 사용 시간을 초과 했을 때

 --%>
<body>
	<h2>에러 테스트 페이지</h2>
	
	<%-- 404 에러: 페이지의 이름을 잘못 적었을 때 --%>
	<a href="errorTest03.jsp">errorTest02.jsp 페이지로 이동</a>

	<%-- 500 에러: 문법이 잘못되었을 때 --%>
	<%
	java.util.Date now = new java.util.Date();
	java.text.SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String strDate = sdf.format(now);
	%>

<%-- 	오늘의 날짜는 <%=strData %>입니다. <br> --%>
	오늘의 날짜는 <%=strDate %>입니다. <br>

</body>
</html>