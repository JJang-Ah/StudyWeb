<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.*" %>
<%@ page import="com.springbook.biz.board.impl.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제 처리</title>
</head>
<body>
<%
// 1.
int seq = Integer.parseInt(request.getParameter("seq"));

// 2. 
BoardDTO dto = new BoardDTO();
dto.setSeq(seq);

BoardDAO boardDAO = new BoardDAO();
boardDAO.deleteBoard(dto);

// 3. 화면이동
response.sendRedirect("getboardList.jsp");
%>
</body>
</html>