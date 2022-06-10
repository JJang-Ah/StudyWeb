<%@page import="doctor.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
	<jsp:useBean id="doctor" class="doctor.DoctorDTO"/>
	<jsp:setProperty property="*" name="doctor"/>
	<%
	System.out.println(doctor);
	DoctorDAO doctorDAO = DoctorDAO.getInstance();
	int cnt = doctorDAO.updateDoctor(doctor);
	%>
	<script>
	<% if(cnt > 0) {%>
		location='listDoctor.jsp';
	<%} else { %>
		alert(`회원 정보 수정에 실패하였습니다.`);
		history.back();
	<%} %>
	</script>
</body>
</html>