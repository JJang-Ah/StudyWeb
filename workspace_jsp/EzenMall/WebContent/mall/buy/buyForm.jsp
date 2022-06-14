<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.member.*, mall.cart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 확인폼</title>
<style>

</style>
<script>

</script>
</head>
<body>
<%
// buyForm.jsp -> 구매정보 확인폼(구매 여부를 결정하는 폼), buyList.jsp -> 구매 목록 폼 (최종 구매)
request.setCharacterEncoding("utf-8");

String memberId = (String)session.getAttribute("memberId");

if(memberId == null) {

	out.print("<script>alert('로그인을 해주세요');location='../logon/memberLoginForm.jsp';</script>");
	return;
}

// Cart DB 연동 -> cartList에서 넘어오는 정보
CartDAO cartDAO = CartDAO.getInstance();

// Member DB 연동
MemberDAO memberDAO = MemberDAO.getInstance();

// Bank DB 연동




%>


</body>
</html>