<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makeCookie</title>
</head>
<%--
★★★
< http와 session >
http - HyperText Transfer Protocol, 하이퍼텍스트 전송 규약, 웹에서 사용하는 기본적인 통신규약
-- 특성: 요청이 완료되면 연결을 끊음, Stateless속성
session
-- 특성: 만료(해제)가 되기 전에는 연결을 계속 유지, State 속성

< cookie와 session >
-- 둘 다 연결 상태를 유지하는 방법 

cookie - 연결상태에 대한 정보를 클라이언트 쪽에 저장. 보안에 취약
session - 연결상태에 대한 정보를 서버 쪽에 저장. 보안에 유리(안전)
 --%>
<body>

	<%
	String cookieName = "id";
	
	//1단계 - 쿠키 생성
	Cookie cookie = new Cookie(cookieName, "박서준");
	
	//2단계 - 쿠키의 만료시간 설정, 만료시간을 설정하지 않으면 쿠키가 생성되지 않음.
	cookie.setMaxAge(60); // 60초=1분, 초단위
	
	//3단계 - 쿠키를 전송
	response.addCookie(cookie);
	%>
	<h2>쿠키를 생성하는 페이지</h2>
	<p><%=cookieName %>쿠키가 생성되었습니다.</p>
	
	<a href="useCookie.jsp">생성된 쿠키 확인</a>
	
	
	
	
	
</body>
</html>