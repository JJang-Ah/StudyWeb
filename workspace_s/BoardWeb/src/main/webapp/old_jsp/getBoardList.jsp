<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.springbook.biz.board.*" %>
<%@ page import="com.springbook.biz.board.impl.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 전체</title>
<style>
.container { width: 1000px; margin: 20px auto; }
h1 { text-align: center; }
a { text-decoration: none; color: gray; font-weight: bold; font-size: 0.9em; }
.d1 { width: 100%; margin-bottom: 10px; }
.d1 div { display: inline-block; }
.d1 .d1_1 { float: left; }
.d1 .d1_2 { float: right; } 
table { width: 100%; border: 1px solid black; border-collapse: collapse; }
tr { height: 30px; }
th { background: #e9ecef; }
.t1 tr td:nth-of-type(1) { text-align: right; padding-right: 5px; }
.t1 tr td:nth-of-type(2), .t1 tr td:nth-of-type(3) { padding:0 5px; }
.t1 select { width: 100px; height: 25px;}
.t1 input[type=text] { width: 280px; height: 18px; padding-left: 3px; }
.t1 input[type=submit] { width: 90px; height: 25px;  }
.t2 .center { text-align: center; }
.t2 .left { padding-left: 5px; }
</style>
</head>
<body>
<%
// 1.DB 연동
BoardDTO dto = new BoardDTO();
BoardDAO boardDAO = new BoardDAO();
List<BoardDTO> boardList = boardDAO.getBoardList(dto);

SimpleDateFormat sdf = new SimpleDateFormat();

// 2. 화면구성
%>
<div class="container">
	<h1>게시판 목록</h1>
	<div class="d1">
		<div class="d1_1"><h3>테스트님 환영합니다...<a href="logout.jsp">LOGOUT</a></h3></div> 
		<div class="d1_2"><a href="insertBoard.jsp">글등록</a></div>
	</div>
	<form action="getBoardList.jsp" method="post">
	<table class="t1">
		<tr>
			<td width="60%">
				<select name="searchCondition">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
			</td>
			<td width="30%"><input type="text" name="searchKeyword"></td>
			<td width="10%"><input type="submit" value="검색"></td>
		</tr>
	</table>
	</form>
	<table class="t2">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="15%">등록일</th>
			<th width="10%">조회수</th>
		</tr>
		<%for(BoardDTO board : boardList){ %>
		<tr>
			<td class="center"><%=board.getSeq() %></td>
			<td class="left"><a href="getBoard.jsp?seq=<%=board.getSeq()%>"><%=board.getTitle()%></a></td>
			<td class="center"><%=board.getWriter()%></td>
			<td class="center"><%=sdf.format(board.getRegDate())%></td>
			<td class="center"><%=board.getCnt()%></td>
		</tr>
		<%} %>
	</table>
</div>
</body>
</html>