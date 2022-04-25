<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applicationTest01</title>
</head>
<%--
< application 내장객체 >
- 웹 애블리케이션이 실행되는 서버의 설정 정보, 자원의 정보, 애플리케이션이 실행되는 동안 발생하는 로그 정보

1. getMajorVersion(): JSP 메이저 버전을 리턴
2. getMinorVersion(): JSP 마이너 버전을 리턴
3. getServerInfo(): JSP 컨테이너 이름과 버전을 리턴
4. getMimeType(): 서버의 MimeType을 리턴
5. getRealPath(): 웹 애플리케이션의 실제 파일 시스템 경로를 리턴
6. log(): 로그 파일에 메시지를 기록함.
  
 --%>
<body>
	<h2>application 내장 객체</h2>
	<%
	out.print("JSP 버전: " + application.getMajorVersion() + "." + application.getMinorVersion() + "<br>");
	out.print("컨테이너 정보: " + application.getServerInfo() + "<br>");
	out.print("애플리케이션 실제 시스템 경로: " + application.getRealPath("/"));
	application.log("로그 기록을 남깁니다.");
	%>	

</body>
</html>