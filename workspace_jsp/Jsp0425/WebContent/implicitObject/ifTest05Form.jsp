<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTest05Form</title>
</head>
<body>
	<h2>참가자 취미 활동 조사</h2>
	
	<form action="ifTest05Pro.jsp" method="post">
		이름: <input type="text" name="name"> <br>
		취미: 
		<label><input type="checkbox" name="hobby" value="여행">여행</label>
		<label><input type="checkbox" name="hobby" value="운동">운동</label>
		<label><input type="checkbox" name="hobby" value="음악감상">음악감상</label>
		<label><input type="checkbox" name="hobby" value="영화감상">영화감상</label>
		<label><input type="checkbox" name="hobby" value="맛집탐방">맛집탐방</label>
		<label><input type="checkbox" name="hobby" value="등산">등산</label>
		<br>
		<input type="submit" value="입력완료">
	</form>

</body>
</html>