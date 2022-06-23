<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>

.container { width: 500px; margin: 20px auto;}
h1, .d1 { text-align: center;}
.d1 { margin-bottom: 20px;}
a { text-decoration: none; color: #196ab3; font-weight: bold; font-size: 1.05em;}
table { width: 100%; border: 1px solid black; border-collapse: collapse;}
tr { height: 40px;}
th, td { border: 1px solid black;}
th { background: #e9ecef;}
td { padding: 5px;}
table .id {width: 150px; height: 20px;}
table .password {width: 150px; height: 20px;}
table .name {width: 150px; height: 20px;}
table .email {width: 150px; height: 20px;}
table .tel {width: 200px; height: 20px;}
table .address {width: 380px; height: 20px;}
.btns { margin-top: 20px; text-align: center;}
.btns input { width: 100px; height: 35px; font-size: 1.02em; font-weight: bold; border-radius: 3px; cursor: pointer;}
.btns input[type=submit] { background: #000; color: #fff; border: 1px solid #000;}
.btns input[type=button] { background: #868e96; color: #fff; border: 1px solid #868e96;}

</style>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		let btn_back = document.getElementById("btn_back");
		btn_back.addEventListener("click", function() {
			location = "login.do";
		})
	})
</script>
<body>
<div id="container">
	<h1>회원가입</h1>
	<form action="insertMember.do" method="post" name="insertMemberForm">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" class="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="password" class="password"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" class="name"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" class="email"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" class="tel"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" class="address"></td>
		</tr>
	</table>
	<div class="btns">
		<input type="submit" value="가입">
		<input type="reset" value="취소">
		<input type="button" value="돌아가기" id="btn_back">
	</div>
	
	</form>
	
</div>
</body>
</html>