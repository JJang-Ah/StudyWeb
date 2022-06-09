<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.impl.*" %>
<%@ page import="com.springbook.biz.board.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세 </title>
<style>
.container { width: 500px; margin: 20px auto; }
h1, .d1 { text-align: center; }
.d1 { margin-bottom: 20px; }
a { text-decoration: none; color: gray; font-weight: bold; font-size: 1.05em; }
table { width: 100%; board: 1px solid black; board-collapese: collapse; }
tr { height: 40px; }
th, td { border: 1px solid black; }
th { background: #e9ecef; }
td { padding: 5px; }
table .seq { width: 100px; height: 25px; background:#f1f3f5; }
table .title { width: 300px; height: 20px; }
.btns { margin-top: 20px; text-align: center; }
.btns input { width: 80px; height: 35px; font-size: 1.05em; font-weigth: bold; border-radius: 5px; cursor: pointer; }
.btns input[type=submit] { background: #000; color: #fff; border: 1px solid #000; }
.btns input[type=button] { background: #495057; color: #fff; border: 1px solid #495057; }
</style>
<script>	
	document.addEventListener("DOMContentLoaded", function(){
		let form = document.detailForm;
		
		// 글삭제 버튼 처리
		let btn_delete = document.getElementById("btn_delete");
		btn_delete.addEventListener("click", function(){
			form.action = "deleteBoardPro.jsp";
			form.submit();
		})
		
		// 전체글 버튼 처리
		let btn_boardList = document.getElementById("btn_boardList");
		btn_boardList.addEventListener("click", function(){
			form.action = "boardList.jsp";
			form.submit();
		})
	})
</script>
</head>
<body>
<%
// 1. 요청 정보 획득
int seq = Integer.parseInt(request.getParameter("seq"));

// 2. 객체 생성, DB 연동
BoardDTO dto = new BoardDTO();
dto.setSeq(seq);

BoardDAO boardDAO = new BoardDAO();
BoardDTO board = boardDAO.getBoard(dto);

// 3. 화면 구성
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>

<div class="container">
	<h1>글상세</h1>
	<div class="d1"><a href="logout.jsp">LOGOUT</a></div> 
	<hr>
	<form action="updateBoardPro.jsp" method="post" name="detailForm">
	<table>
		<tr>
			<th width="20%">번호</th>
			<td width="80%">><input type="text" name="seq" value="<%=board.getSeq()%>" readonly class="seq"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="<%=board.getTitle()%>" class="title"> </td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=board.getWriter() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="15" cols="52"><%=board.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=sdf.format(board.getRegDate()) %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=board.getCnt() %></td>
		</tr>
	</table>
	<div class="btns">
		<input type="submit" value="글수정">&ensp;
		<input type="button" value="글삭제" id="btn_delete">&ensp;
		<input type="button" value="글목록" id="btn_boardList">		
	</div>
	</form>
</div>
</body>
</html>