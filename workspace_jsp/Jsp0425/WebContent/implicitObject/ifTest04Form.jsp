<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTest04Form</title>
</head>
<body>
	<h2>참가자 직업 조사</h2>
	
	<form action="ifTest04Pro.jsp" method="post">
		이름: <input type="text" name="name"> <br>
		직업: 
		<label><input type="radio" name="job" value="회사원" checked>회사원</label>
		<label><input type="radio" name="job" value="공무원">공무원</label>
		<label><input type="radio" name="job" value="자영업">자영업</label>
		<label><input type="radio" name="job" value="프리랜서">프리랜서</label>
		<label><input type="radio" name="job" value="학생">학생</label>
		<label><input type="radio" name="job" value="취업준비생">취업준비생</label>
		<label><input type="radio" name="job" value="무직">무직</label>
		<br>
		<input type="submit" value="선택완료">
		
		
	</form>
</body>
</html>