<%@page import="doctor.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 리스트</title>
<style>
#container { width: 1000px; margin: 20px auto;}
.center { text-align: center;}
.insert_d { display: inline-block; float: right; color: black; border: 1px solid gray; border-radius: 3px; padding: 2px; background: #eee; font-size: 0.8em;}
.insert_d a { text-decoration: none; color: black;}
.d_list { width: 100%; margin: 0 auto; border-collapse: collapse; text-align: center;}
.d_list th { background: lightgray;}
.d_list th, .d_list td { border: 1px solid black; height: 40px;}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
DoctorDAO doctorDAO = DoctorDAO.getInstance();
List<DoctorDTO> doctorList = doctorDAO.getDoctorList();
%>
<div id="container">

<h2 class="center">의사 조회 프로그램</h2>
<hr>
<h3 class="center">의사 정보 목록</h3>
<br>
<div class="insert_d"><a href="insertDoctorForm.jsp">의사 정보 등록</a></div> <br><br>
<table class="d_list">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>학번</th>
		<th>전공</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>이메일</th>
	</tr>
	<%for(DoctorDTO doctor : doctorList) {%>
	<tr>
		<td><a href="detailDoctor.jsp?id=<%=doctor.getId()%>"><%=doctor.getId() %></a></td>
		<td><%=doctor.getName() %></td>
		<td><%=doctor.getSnum() %></td>
		<td><%=doctor.getMajor() %></td>
		<td><%=doctor.getTel() %></td>
		<td><%=doctor.getAddress() %></td>
		<td><%=doctor.getEmail() %></td>
	</tr>
	<%} %>
</table>
<br>
<div class="center">전체의사: <%=doctorDAO.getDoctorCount() %>명</div></div>

</body>
</html>