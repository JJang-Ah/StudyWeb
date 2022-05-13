<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴(삭제) 처리</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	int cnt = memberDAO.deleteMember(id, pwd);
	%>
	<script>
	<%if(cnt > 0) {%> // 삭제 성공
		alert(`계정이 성공적으로 삭제되었습니다.`);
		location='../logon/memberLoginForm.jsp';
	<%} else {%> // 삭제 실패
		alert(`계정 탈퇴(삭제)에 실패하였습니다.`);
		history.back();
	<%}%>
	</script>

</body>
</html>