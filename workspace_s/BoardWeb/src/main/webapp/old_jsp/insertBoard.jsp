<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
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
table .writer { width: 150px; height: 20px; }
.btns { margin-top: 20px; text-align: center; }
.btns input { width: 80px; height: 35px; font-size: 1.05em; font-weigth: bold; border-radius: 5px; cursor: pointer; }
.btns input[type=submit] { background: #000; color: #fff; border: 1px solid #000; }
.btns input[type=button] { background: #495057; color: #fff; border: 1px solid #495057; }
</style>
<script>	
	document.addEventListener("DOMContentLoaded", function(){
		let form = document.insertForm;
		
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
<div class="container">
	<h1>글등록</h1>
	<div class="d1"><a href="logout.jsp">LOGOUT</a></div> 
	<hr>
	<form action="insertBoardPro.jsp" method="post" name="insertForm">
	<table>
		<tr>
			<th width="20%">제목</th>
			<td width="80%"><input type="text" name="title" value="" class="title"> </td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" class="writer"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="15" cols="52"></textarea></td>
		</tr>
	</table>
	<div class="btns">
		<input type="submit" value="글등록">&ensp;
		<input type="button" value="글목록" id="btn_boardList">		
	</div>
	</form>
</div>
</body>
</html>