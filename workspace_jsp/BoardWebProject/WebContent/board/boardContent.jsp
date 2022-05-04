<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hammersmith+One&family=Paytone+One&display=swap');
#container { width: 500px; margin: 0 auto;}
a { text-decoration: none; color: black;}
/* 상단 - 메인, 서브 타이틀 */
.m_title { font-family:'Paytone One', sans-serif; font-size: 3em; text-align: center;}
.s_title { font-family:'Do Hyeon', sans-serif; font-size: 2em; text-align: center; margin-bottom: 30px}

/* 본문 - 테이블 */
table { width: 100%; border: 1px solid black; border-collapse: collapse;}
tr { height: 40px; }
th, td { border: 1px solid black;}
th { background: #ced4da;}
td { padding: 5px;}
.content_row { height: 300px;}

/* 하단 - 버튼  */
.btns { text-align: center; margin-top: 20px;}
.btns input { width: 100px; height: 35px; border: none; background: black; color: white;
 font-weight: bold; cursor: pointer;}
 
</style>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		let form = document.contentForm;
		
		// 글 등록 버튼을 클릭할 때
		let btn_update = document.getElementById("btn_update");
		btn_update.addEventListener("click", function() {
	
		})
		
		// 전체 게시글 버튼을 클릭할 때
		let btn_boardList = document.getElementById("btn_boardList");
		btn_boardList.addEventListener("click", function() {
			location='boardList.jsp';
		})
		
	})

</script>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num")); //넘어오는 num의 값을 받는다.
BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO board = boardDAO.getBoard(num);

%>
<div id="container">
	<div class="m_title"><a href="#">EZEN MALL</a></div>
	<div class="s_title">글 정보</div> <br>
	
	<form action="" method="post" name="contentForm">
		<table>
			<tr>
				<th width="15%">글 번호</th>
				<td width="85"><%=board.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=board.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=board.getSubject() %></td>
			</tr>
			<tr class="content_row">
				<th>내용</th>
				<td><%=board.getContent() %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=board.getRegDate() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=board.getReadcount() %></td>
			</tr>
		</table>
		<div class="btns">
			<input type="button" value="글 수정" id="btn_update">&ensp;
			<input type="button" value="글 삭제" id="btn_delete">&ensp;
			<input type="button" value="댓글 작성" id="btn_review">&ensp;
			<input type="button" value="게시글 보기" id="btn_boardList">
		</div>
	</form>
</div>

</body>
</html>