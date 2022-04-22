<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTest03Form</title>
</head>
<!-- 
문제) 입력정보를 처리페이지에서 출력하도록 작성하시오.
서울: 02, 경기도: 031, 강원: 033, 충남: 041, 충북: 043, 전남: 061, 전북: 063
, 경남:055, 경북: 054

<출력 페이지>
박서준님의 전화번호는 031-7777-7777 입니다.


 -->
<body>

	<h2>이름과 전화번호를 입력하는 폼 페이지</h2>
	<p>이름과 전화번호를 입력하시오. </p>
	
	<form action="ifTest03Pro.jsp" method="post">
		이름: <input type="text" name="name"> <br>
		전화번호: 
	
		<select name="Local">
			<option value="서울">서울</option>
			<option value="경기도">경기도</option>
			<option value="강원도">강원도</option>
			<option value="충남">충남</option>
			<option value="충북">충북</option>
			<option value="전남">전남</option>
			<option value="전북">전북</option>
			<option value="경남">경남</option>
			<option value="경북">경북</option>
		</select>
		
		- <input type="text" name="tel"> <br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>