<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest01Form</title>
</head>
<body>
	<h2>forward action tag</h2>
	
	<form action="forwardTest01Pro1.jsp" method="post">
		아이디: <input type="text" name="id"> <br>
		취미: 
		<select name="hobby">
			<option>독서</option>
			<option>여행</option>
			<option>운동</option>
			<option>음악감상</option>
			<option>맛집탐방</option>
		</select> <br>
		<input type="submit" value="입력완료">
	
	</form>
</body>
</html>