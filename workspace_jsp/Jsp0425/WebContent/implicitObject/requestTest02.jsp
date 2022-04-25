<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest02</title>
</head>
<%--

< request 내장객체의 주요 메소드>
1. getParameter(): 파라미터 변수에 저장된 변수값 1개를 얻는 메소드
- String, input과 select로 넘어오는 값
2. getPafameterValues(): 파라미터 변수에 저장된 변수값들을 얻는 메소드,
- String[], checkbox로 넘어오는 값
3. getParameterNames(): 요청에 의해서 넘어오는 모든 파라미터 변수들
4. getProtocol(): 사용중인 프로토콜을 리턴
5. getServerName(): 서버의 도메인 이름을 리턴
6. getMethod(): 요청방식을 리턴(get, post, put ...)
7. getRequestURI(): 요청에 사용된 URI를 리턴 (자주씀)
8. getRequestURL(): 요청에 사용된 URL을 리턴 (자주씀)
9. getContextPath(): 컨텍스트 경로를 리턴 (자주씀)
10. getRemoteHost(): 웹 브라우저의 호스트 이름
11. getRemoteAddr(): 웹브라우저의 IP 주소
12. getServerPort(): 서버의 포트 번호
13. getHeader(): 헤더의 속성값을 리턴
14. getHeaderNames(): 헤더에 있는 모든 헤더 이름을 리턴

★★★
< 경로의 구분 >
URL: Uniform Resource Locator, 파일의 전체 경로, http부터 프로젝트명, 파일명까지 모두 포함
URI: Uniform Resource Identifier, 프로젝트명과 파일명을 포함
Context Path: 프로젝트명만을 포함
접근 경로: 프로젝트명을 제외하고, 폴더명과 파일명을 포함한 경로



 --%>
<body>
	<h2>request 내장 객체의 메소드</h2>
	
	<%
	String[] names = {"프로토콜 이름", "서버이름", "호스트 이름", "IP 주소", "포트번호", "메소드 방식", "URI", "URI", "컨텍스트 경로"};
	String[] values = {request.getProtocol(), request.getServerName(), request.getRemoteHost(), request.getRemoteAddr(),
					request.getServerPort()+"", request.getMethod(), request.getRequestURL().toString(),
					request.getRequestURI(), request.getContextPath()};
	Enumeration<String> e = request.getHeaderNames();
	String headerName = "";
	String headerValue = "";
	%>
	<h2>웹 서버의 정보 확인</h2>
	<%
	for(int i=0; i<names.length; i++) {
		out.print(names[i] + " : " + values[i] + "<br>");
	}
	
	// 접근 경로
	String uri = request.getRequestURI();
	String context = request.getContextPath();
	String path = uri.substring(context.length());
	out.print("접근 경로: " + path);
	%>
	<hr>
	<h2>헤더의 정보 확인</h2>
	<%
	while(e.hasMoreElements()) {
		headerName = e.nextElement();
		headerValue = request.getHeader(headerName);
		out.print(headerName + " : " + headerValue + "<br>");
	}
	%>
	
	
	
</body>
</html>