<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 전체</title>
<style>
.container { width: 1000px; margin: 20px auto;}
h1 { text-align: center;}
a { text-decoration: none; color: #196ab3; font-weight: bold; font-size: 0.95em;}
.d1 { width: 100%; padding-bottom: 40px;}
.d1 div { display: inline-block;}
.d1 .d1_1 { float: left;}
.d1 .d1_2 { float: right; width: 68px; border: 1px solid #196ab3; padding: 3px 10px; border-radius: 3px; margin-right: 5px; text-align: center;}
table { width: 100%; boarder: 1px solid black; border-collapse: collapse;}
tr { height: 30px;}
th, td { border: 1px solid black;}
th { background: #e9ecef;}
.t1 tr td:nth-of-type(1) { text-align: right; padding-right: 5px;}
.t1 tr td:nth-of-type(2), .t1 tr td:nth-of-type(3) { padding: 0 5px;}
.t1 select { width: 100px; height: 25px;}
.t1 input[type=text] { width: 280px; height: 18px; padding-left: 3px;}
.t1 input[type=submit] { width: 88px; height: 25px; cursor: pointer;}
.t2 .center { text-align: center;}
.t2 .left { padding-left: 5px;}
</style>
</head>
<body>
<div class="container">
	<h1>게시판 목록</h1>
	<div class="d1">
		<div class="d1_1"><a href="getMember.do?id=${member.id}">${member.id }</a>님 환영합니다!&emsp;
			<a href="logout.do">로그아웃</a>
		</div>
		<div class="d1_2"><a href="insertBoard.do">글등록</a></div>
	</div>
	<form action="getBoardList.do" method="post">
	<table class="t1">
		<tr>
			<td width="60%">
				<select name="searchCondition">
					<c:forEach var="option" items="${conditionMap }">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
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
		<c:forEach var="board" items="${boardList }">
		<tr>
			<td class="center">${board.seq }</td>
			<td class="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
			<td class="center">${board.writer }</td>
			<td class="center">${board.regdate }</td>
			<td class="center">${board.cnt }</td>		
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>