<%@page import="doctor.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="doctor" class="doctor.DoctorDTO"></jsp:useBean>
<jsp:setProperty property="*" name="doctor"/>
<%
DoctorDAO doctorDAO = DoctorDAO.getInstance();
int cnt = doctorDAO.deleteDoctor(doctor.getId(), doctor.getPassword());
%>

<script>
<%if(cnt>0) {%>
	location = "listDoctor.jsp";
<%} else {%>
	alert(`회원 삭제에 실패하였습니다.`);
	history.back();
<%}%>
</script>
</body>
</html>