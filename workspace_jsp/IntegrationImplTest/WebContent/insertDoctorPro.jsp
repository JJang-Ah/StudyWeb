<%@page import="doctor.DoctorDAO"%>
<%@page import="doctor.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 등록 처리</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="doctor" class="doctor.DoctorDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="doctor"/>
	<%
	DoctorDAO doctorDAO = DoctorDAO.getInstance();
	int cnt = doctorDAO.insertDoctor(doctor);
	%>
	<script>
	<% if(cnt > 0) { %>
		location = 'listDoctor.jsp';
	<%} else { %>
		alert('회원가입에 실패하였습니다.');
		history.back();
	<%} %>
	</script>



</body>
</html>