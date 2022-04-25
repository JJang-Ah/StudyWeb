<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest01Form</title>
</head>
<body>
<%--
< 내장 객체 > Implicit Object 
- 객체의 생성없이 바로 사용할 수 있도록 JSP에서 미리 만들어 놓은 객체
- 9개의 내장 객체
- 입출력 관련(out), 페이지 환경 정보 제공 (info), 예외처리(exception), 서블릿 관련 객체(...)

< 9개의 내장 객체 >
1. request 객체 - 웹 브라우저의 요청을 처리하는 내장 객체
2. response 객체 - 웹 브라우저의 요청에 대한 응답을 처리하는 내장 객체
3. session 객체 - 웹 브라우저의 세션에 관한 처리를 하는 내장 객체
4. application 객체 - 웹 애블리케이션의 Context 정보를 저장하는 내장 객체
5. pageContext 객체 - JSP 페이지에 대한 정보를 저장하는 내장 객체
6. out 객체 - JSP 페이지의 출력을 담당하는 내장 객체
7. page 객체 - JSP 페이지를 구현하는 자바 클래스 내장 객체
8. config 객체 - JSP 페이지의 설정 정보를 저장하는 내장 객체
9. exception - JSP 페이지에서 예외처리에서 사용되는 내장 객체

-- 많이 사용하는 내장 객체 : request, out, response, session의 4가지 내장 객체를 주로 사용
-- application, pageContext는 가끔 사용

< 영역 객체 >
-- 웹브라우저의 요청에 대한 처리의 영역과 관련된 4가지의 내장 객체
-- pageContext < request < session < application
-- pageContext : 해당 페이지에서 처리되는 영역
-- request: 요청에 대한 처리를 하는 영역
-- session: 세션에 대한 처리를 하는 영역
-- application: 애플리케이션의 처리를 하는 영역
 --%>
 
 <%-- 
 문제 ) 학번, 이름, 학년, 선택과목을 입력하는 페이지
 --  no, name, grade, subject
 -- grade: 1학년, 2학년, 3학년, 4학년 
 -- subject: HTML5/CSS3, JAVA, Oracle, JSP -> select
 
 < 결과 페이지 설계 >
 4가지의 정보를 테이블로 출력
 
  --%>
	  
	<h2>학생정보를 입력하는 폼 페이지</h2>
	<form action="requestTest01Pro.jsp" method="post">
		학번: <input type="text" name="no"> <br>
		이름: <input type="text" name="name"> <br>
		학년: 
		<label><input type="checkbox" name="grade" value="1">1학년</label>
		<label><input type="checkbox" name="grade" value="2">2학년</label>
		<label><input type="checkbox" name="grade" value="3">3학년</label>
		<label><input type="checkbox" name="grade" value="4">4학년</label>
		<br>
		선택과목:
		<select name="subject">
			<option>HTML5/CSS3</option>
			<option>JAVA</option>
			<option>Oracle</option>
			<option>JSP</option>
		</select>
		<br>
		<input type="submit" value="입력완료">
	</form>







</body>
</html>