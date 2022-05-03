<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLogout</title>
</head>
<body>
	<%
	/*
	< 세션 삭제 방법 2가지 >
	
	1. session.invalidate(); // 모든 세션 무효화(삭제)
	
	2. session.removeAttribute(세션이름); // 세션이름에 해당하는 세션만 삭제 
	
	*/
	/*
	String memberId = (String)session.getAttribute("memberId");
	memberId = null;
	*/
	session.removeAttribute("memberId");

	%>
	<script>
		alert('로그아웃 되었습니다.');
		location = '../logon/memberLoginForm.jsp';
	</script>
</body>
</html>