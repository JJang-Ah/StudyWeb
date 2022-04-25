<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest01</title>
</head>
<%--
< session 내장 객체 >
-- 요청에 대한 연결을 session이 만료되기 전까지 유지하는 역할

< http와 session>
http: 웹에서 사용하는 기본적인 프로토콜 
-- 특성: 요청이 완료되면 연결을 끊는다. 연결상태를 유지하지 않음
-- stateless 속성 
-- 일반적인 웹에서의 특성
session: 특성, session이 만료될때까지 연결상태를 유지함.
-- state 속성
-- ex) 로그인, 은행업무, 웹 쇼핑, ...

<cookie와 session>
-- 쿠키와 세션은 연결상태를 유지함.
-- cookie: 연결정보를 클라이언트 쪽에 저장, 보안이 취약, ex) 웹서핑목록, 웹검색 목록...
-- session: 연결정보를 서버 쪽에 저장, 보안이 유리 ex) 로그인 정보...

1. getId(): 웹브라우저에 생성된 고유한 세션 ID를 리턴
2. getCreateionTime(): 세션이 생성된 시간을 리턴
3. getLastAccessedTime(): 세션의 요청이 시도된 마지막 접근 시간을 리턴
4. setMaxInactiveInterval(): 세션의 유지 시간을 초단위로 설정
5. getMaxInactiveInterval(): 세션의 유지 시간을 리턴, 세션의 기본 유지시간은 1800초 = 30분
6. inNew(): 새로 생성된 세션일때 true를 리턴
7. invalidate(): 모든 세션을 무효화할 때 사용.
8. setAttribute(key, value): key와 value값으로 세션을 지정할 때 사용
9. getAttribute(key): 세션의 key로 value값을 얻을 때 사용
10. removeAttribute(key): 해당 key의 세션을 제거할 때 사용.
 

 --%>
<body>
	<%
	session.setMaxInactiveInterval(10); // 10초 생성
	%>
	<h2>세션 테스트</h2>
	isNew: <%=session.isNew() %> <br>
	생산시간: <%=session.getCreationTime() %> <br>
	최종접속시간: <%=session.getLastAccessedTime() %> <br>
	세션ID: <%=session.getId() %> <br>
	
	세션 유지시간: <%=session.getMaxInactiveInterval() %> <br>
	

</body>
</html>