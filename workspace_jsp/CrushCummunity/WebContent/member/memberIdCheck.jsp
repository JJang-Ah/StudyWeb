<%@ page import="member.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberIdCheck</title>
</head>
<body>
	<%-- ID 중복 체크 처리 페이지 --%>
	<%
	String id = request.getParameter("id");
	MemberDAO memberDAO = MemberDAO.getInstance();
	int cnt = memberDAO.checkId(id);
	%>
	<script>
	<% if(cnt == 0) {%> // 아이디가 있음 -> 사용할 수 없는 아이디
		alert(`이미 사용중인 아이디가 있습니다. \n다른 아이디를 입력해 주세요`);
	<%} else { // 아이디가 없음 -> 사용할 수 있는 아이디%>
		alert(`사용가능한 아이디입니다.`);
	<%}%>
	history.back();
	</script>
		

</body>
</html>