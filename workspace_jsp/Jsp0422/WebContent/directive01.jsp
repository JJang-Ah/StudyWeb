<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="처음 작성하는 JSP 페이지" %>
<%@ page import="java.sql.Timestamp, java.text.SimpleDateFormat" %>
<%--<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디렉티브(directive) 기본</title>
</head>
<%-- 
1. 디렉티브(directive)
- 지시어, 지시문
- 형식 <%@ %>
- jsp 페이지에 대한 기본적인 환경 설정

2. 디렉티브의 종류
- page, include, taglib

(1) page directive
info: 페이지의 설명, 선택
language: jsp 페이지에서 사용하는 언어
contentType: 문서의 타입
pageEncoding: 해당 페이지의 문자 인코딩, 기본값: "text/html; charset=UTF-8"
extends: 자신이 상속한 
★★★import: 다른 패키지에 있는 클래스를 사용할 때 사용 // 아주 자주 사용
session: 세션의 사용 여부를 지정, 기본값: true
buffer: 버서의 크기 유무를 지정, 기본값: 8kb
autoFlush: 출력버퍼가 다 채워졌을 경우에 버퍼의 내용을 처리하는 속성, 기본값: true
isThreadSafe: 현재 페이지에서 다중 쓰레드를 허용할지의 여부, 기본값: true

-- 에러 페이지의 설정은 아래의 방법이 아닌 다른 방법을 사용하고 있음.
-- JSP 2.0 이상부터는 아래의 방법이 사용되지 않음. tomcat의 5.5.9버전 이상에서는 동작하지 않는다.
errorPage: 현재 페이지에서 에러가 발생했을 때, 에러를 처리할 페이지를 지정하는 속성
isErrorPage: 현재 페이지를 에러 페이지로 지정하는 속성, 기본값: false


 --%>
<body>

	<h1>디렉티브 연습</h1>
	<%= getServletInfo() %> <%-- page directive의 info의 내용을 출력하는 메소드 --%>
	<%
	Timestamp now = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년mm월dd일 hh:mm:ss");
	String str = sdf.format(now);
	%>
	현재 날짜와 시간은 <%=str %>입니다.
	
	
</body>
</html>