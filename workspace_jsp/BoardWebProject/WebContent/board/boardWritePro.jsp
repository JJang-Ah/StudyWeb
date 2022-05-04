<%@page import="board.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String writer = (String)session.getAttribute("memberId");
%>

<jsp:useBean id="board" class="board.BoardDTO"/>
<jsp:setProperty property="*" name="board"/>


<%
BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.insertBoard(board);

response.sendRedirect("boardList.jsp");


%>

</body>
</html>