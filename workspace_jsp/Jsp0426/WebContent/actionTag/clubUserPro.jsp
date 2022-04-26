<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clubUserPro</title>
</head>

<style>
	table { border: 1px solid black; border-collapse: collapse;}
	tr { height: 35px;}
	th, td { border: 1px solid black;}
	th { background: lightgray;}

</style>
<body>

	<h2>회원 정보 출력</h2>
	
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="clubUser1" class="test.ClubUser"/>
	<jsp:setProperty property="*" name="clubUser1"/>
	
	
	<table>
		<tr>
			<th>아이디</th>
			<td> <jsp:getProperty property="id" name="clubUser1"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td> <jsp:getProperty property="pwd" name="clubUser1"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td> <jsp:getProperty property="name" name="clubUser1"/></td>
		</tr>
		<tr>
			<th>클럽이름</th>
			<td> <jsp:getProperty property="clubName" name="clubUser1"/></td>
		</tr>
		<tr>
			<th>나이</th>
			<td> <jsp:getProperty property="age" name="clubUser1"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td> <jsp:getProperty property="tel" name="clubUser1"/></td>
		</tr>
		<tr>
			<th>메일</th>
			<td> <jsp:getProperty property="email" name="clubUser1"/></td>
		</tr>
		<tr>
			<th>주소</th>
			<td> <jsp:getProperty property="addr" name="clubUser1"/></td>
		</tr>
		
	</table>

</body>
</html>