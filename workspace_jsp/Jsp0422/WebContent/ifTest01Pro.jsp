<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTest01Pro</title>
</head>
<%--
request: 요청 페이지의 데이터를 받아서 처리하는 내장객체
-- getParameter(): name으로 넘어오는 값을 받는 메소드

Wrapper Class
-- 데이터 타입을 변경하는 8개의 클래스에 동침.
-- Character, Byte, short, Integer, Long, Float, Double, Boolean
-- Integer.parseInt(): 문자열을 정수로 변환하는 메소드
-- Double.parseDouble(): 문자열을 실수로 변환하는 메소드

 --%>
<body>
	<h2>숫자 처리 페이지</h2>
	<%
	String strNumber = request.getParameter("number"); // 문자열 "10"
	int number = Integer.parseInt(strNumber); // "10" -> 10
	%>
	
	<%-- 1번 방법: 스크립틀릿과 익스프레션을 사용 --%>
	<%if(number > 0) {%>	
		<%=number %>는 양수 입니다.
	<%} else if(number < 0) {%>
		<%=number %>는 음수 입니다.
	<%} else if(number == 0) {%>
		<%=number %>는 양수도 음수도 아닙니다.
	<%}%>
	
	<hr>
	
	<%-- 2번 방법: 스크립틀릿 안에서 out 내장 객체를 사용 --%>
	<%
	if(number > 0) {
		out.print(number + "는 양수입니다.");	
	} else if(number < 0) {
		out.print(number + "는 음수입니다.");	
	} else if(number ==0) {
		out.print(number + "는 양수도 음수도 아닙니다.");	
	}
	%>

</body>
</html>