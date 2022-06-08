<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.springbook.biz.member.MemberDTO"%> 
<%@ page import="com.springbook.biz.member.impl.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
// 1. 클라이언트의 입력정보를 획들
String id = request.getParameter("id");
String password = request.getParameter("password");

// 2. 객체 생성 및 DB 연동
MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPassword(password);

MemberDAO memberDAO = new MemberDAO();
MemberDTO member = memberDAO.getMember(dto);

// 3. 화면 이동
if(member != null) 	{
	response.sendRedirect("getBoardList.jsp");
} else {
	response.sendRedirect("login.jsp");
}
%>

</body>
</html>