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
// 1. Ŭ���̾�Ʈ�� �Է������� ȹ��
String id = request.getParameter("id");
String password = request.getParameter("password");

// 2. ��ü ���� �� DB ����
MemberDTO dto = new MemberDTO();
dto.setId(id);
dto.setPassword(password);

MemberDAO memberDAO = new MemberDAO();
MemberDTO member = memberDAO.getMember(dto);

// 3. ȭ�� �̵�
if(member != null) 	{
	response.sendRedirect("getBoardList.jsp");
} else {
	response.sendRedirect("login.jsp");
}
%>

</body>
</html>