<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 정보 등록</title>
<style>
#container { width: 800px; margin: 20px auto;}
.center { text-align: center;}
.d_insertForm { margin: 0 auto;}
.t_d_insert { width: 700px; margin: 0 auto; border-collapse: collapse;}
.t_d_insert th { text-align: center; background: lightgray; width: 100px;}
.t_d_insert th, .t_d_insert td { height: 40px; border: 1px solid black;}
.t_d_insert input { margin-left: 20px; height: 20px; border: 2px solid lightgray;}

.btns { margin-top: 10px; text-align: center;}
.btns input { width: 100px; height: 25px; display: inline-block; margin: 5px;}

</style>
<script>

document.addEventListener("DOMContentLoaded", function() {
	let form = document.d_insertForm;
	let btn_d_list = document.getElementById("btn_d_list");
	btn_d_list.addEventListener("click", function() {
		location = "listDoctor.jsp";
	})
	
	let btn_d_insert = document.getElementById("btn_d_insert");
	btn_d_insert.addEventListener("click", function() {
		form.submit();
	})
})
</script>
</head>
<body>
<div id="container">
<h2 class="center">의사 정보 등록</h2>
<form action="insertDoctorPro.jsp" method="post" class="d_insertForm" name="d_insertForm">
	<table class="t_d_insert">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" size="30"></td>
		</tr>
		<tr>
			<th>학번</th>
			<td><input type="text" name="snum" size="15"></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><input type="text" name="major" size="50"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" size="38"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" size="70"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" size="40"></td>
		</tr>
	</table>
	<div class="btns">
		<input type="button" value="등록" id="btn_d_insert">
		<input type="button" value="다시 작성" id="btn_reset">
		<input type="button" value="의사 목록" id="btn_d_list">
		
	</div>
</form>

</div>

</body>
</html>