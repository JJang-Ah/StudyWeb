<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useCookie</title>
</head>
<body>
	<h2>쿠키를 사용하는 페이지</h2>
	
	<%
	// <쿠키를 사용하는 단계>
	// 1단계 - 모든 쿠키 정보를 획득
	Cookie[] cookies = request.getCookies();
	// 2단계 - 사용하고자 하는 쿠키의 정보를 검색
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				out.print("쿠키 이름: " + cookies[i].getName() + "<br>");
				out.print("쿠키 값: " + cookies[i].getValue() + "<br>");
			}
		}
	}
	%>
</body>
</html>