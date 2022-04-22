<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 스크립트 요소</title>
</head>
<%--
1. JSP 스크립트 요소
- declaration (선언문) - 전역 변수, 메소드 선언
- scriptlet (스크립틀릿) - 자바의 문법을 jsp 페이지 안에서 사용하기 위한 요소, 가장 많이 사용
- expression (표현식) - 변수의 값을 출력, 함수 호출 시의 값을 출력


 --%>
<body>
	<h2>JSP 스크립트 요소 1</h2>
	<%!
	// 선언문 안 - 전역변수
	String str1 = "전역변수";
	
	// 선언문 안 - 전역 메소드
	String getStr1() {
		return str1;
	}
	%>
	<%
	// 스크립틀릿 안
	String str2 = "지역변수";
	%>
	
	선언문 안에서 선언된 변수 str1은 <%=getStr1() %>입니다. <br>
	스크립틀릿 안에서 선언된 변수 str2는 <%=str2 %>입니다. <br>
</body>
</html>