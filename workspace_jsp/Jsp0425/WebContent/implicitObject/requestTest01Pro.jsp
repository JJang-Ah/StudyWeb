<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>requestTest01Pro</title>
</head>
<style>
	table { border: 1px solid black; border-collapse: collapse;}
	tr { height: 30px;}
	th, td { border: 1px solid black;}
	
</style>
<body>
	<h2>학생 정보를 처리하는 페이지</h2>
	
	<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String subject = request.getParameter("subject");
	%>
	
	<table>
		<tr>
			<th>학번</th>
			<td><%=no %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>학년</th>
			<td><%=grade %></td>
		</tr>
		<tr>
			<th>선택과목</th>
			<td><%=subject %></td>
		</tr>
	</table>

</body>
</html>