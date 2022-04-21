<%-- 디렉티브(directive), 지시어(문): JSP 파일의 기본적인 환경 설정 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 프로그래밍</title>
</head>
<body>

<h1>JSP 프로그래밍</h1>

<!-- 주석: html -->
<%-- 주석: jsp --%>
<%--
 웹서버 프로그래밍 -> 백엔드 프로그래밍
 ASP - C# 기반
 PHP - C 기반
 JSP - Java 기반, Java Server Page
 
 dJango(장고), Flask - Python
 
 JSP 웹서버 프로그래밍
 HTML5 + CSS3 
 Javascript + jQuery 
 Java
 JSP
 MySQL : DB Server
 
 Web Server : 웹을 구동하는 서버 
 WAS (Web Application Server) : 프로그래밍 언어로 웹에서 사용할 수 있도록 하는 서버 ex)tomcat
 
 WAS : JEUS, JBOSS, Top Link ... 상용
 Tomcat 서버 : 무료
 
 Servlet(서블릿) : 자바 언어 안에 웹언어를 넣어서 실행하도록 만든 언어, 너무 커지고 복잡해지고 사용은 어려워 짐. 
 JSP : html 안에 자바 언어 넣어서 사용하도록 변경, 간결한 문법 구조, JSP를 파싱하면 결국에는 Servlet이 된다.
 --%>
 
 <%--
 [ JSP 문법 ]
 <%-- -- %> : JSP 주석
 <%@ %> : directive(디렉티브), 지시문 - JSP 파일의 기본적인 환경 설정
 
 [ JSP 스크립트 요소 ] - 자바 프로그래밍을 할 수 있도록 하는 요소
 <%! %> : declaration(디클러레이션), 선언문 - 전역 변수, 메소드 선언
 <% %> : scriptlet(스크립틀릿) - 실질적인 프로그래밍 코드 기술 // 많이 쓰임
 <%= %> : expression(익스프레션), 표현식 - 변수, 함수 호출, 값 // 많이 쓰임
 
  --%>
</body>
</html>