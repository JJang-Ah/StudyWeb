<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertTest01Form</title>
<style>
	#container { width: 400px; margin: 20px auto;}
	h2 { text-align: center; margin-bottom: 30px;}
	form { border: 1px solid black; padding: 10px;}
	.d_in { width: 100%; margin: 10px; padding: 10px;}
	.d_in label { display: inline-block; width: 80px; text-align: right; margin-right: 20px;}
	.d_in input[type='text'], .d_in input[type='password'] { width: 200px;}
	.btns { text-align: center; margin-top: 20px;}
	.btns input { width: 100px; height: 35px; border: none; background: black; color: white; font-weight: bold; cursor: pointer;}
	.btns input:hover { background: white; color: black; border: 1px solid black;}
</style>
</head>
<body>
	<div id="container">
	
	
		<h2>회원 정보 입력</h2>
		
		<form action="insertTest01Pro.jsp" method="post">
			<div class="d_in"><label for="id">아이디</label><input type="text" id="id" name="id"></div>
			<div class="d_in"><label for="pwd">비밀번호</label><input type="password" id="pwd" name="pwd"></div>
			<div class="d_in"><label for="name">이름</label><input type="text" id="name" name="name"></div>
			<div class="d_in"><label for="age">나이</label><input type="text" id="age" name="age"></div>
			<div class="btns">
				<input type="submit" value="입력완료"> &ensp;&ensp;
				<input type="reset" value="취소">
			</div>
		</form>	
		
	</div>
	
</body>
</html>