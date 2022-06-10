<%@page import="doctor.DoctorDTO"%>
<%@page import="doctor.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의사 정보</title>
<style>

#container { width: 800px; margin: 20px auto;}
.center { text-align: center;}
.d_infoForm { margin: 0 auto;}

.t_d_info { width: 700px; margin: 0 auto; border-collapse: collapse;}
.t_d_info th { text-align: center; background: lightgray; width: 100px;}
.t_d_info th, .t_d_info td { height: 40px; border: 1px solid black;}
.t_d_info input { margin-left: 20px; height: 20px; border: 2px solid lightgray;}

.warn { color: red; margin-left: 10px;}
.btns { margin-top: 10px; text-align: center;}
.btns input { width: 100px; height: 25px; display: inline-block; margin: 5px;}


</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
	let form = document.d_infoForm;
	let btn_update = document.getElementById("btn_update");
	btn_update.addEventListener("click", function() {
		form.submit();
	})
	let btn_delete = document.getElementById("btn_delete");
	btn_delete.addEventListener("click", function() {
		form.action = 'deleteDoctorPro.jsp';
		form.submit();
	})
	let btn_d_list = document.getElementById("btn_d_list");
	btn_d_list.addEventListener("click", function() {
		location = "listDoctor.jsp";
	})
})

</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");

DoctorDAO doctorDAO = DoctorDAO.getInstance();
DoctorDTO doctor = doctorDAO.getDoctor(id);
%>
<div id="container">

<h2 class="center">의사 정보 상세보기</h2>
<form action="updateDoctor.jsp" method="post" class="d_infoForm" name="d_infoForm">
	<input type="hidden" name="id" value="<%=doctor.getId() %>">
	<table class="t_d_info">
		<tr>
			<th>아이디</th>
			<td>&ensp;&ensp;&ensp;<%=doctor.getId()%><span class="warn">*아이디는 변경할 수 없습니다.</span></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" size="30" value="<%=doctor.getName()%>"></td>
		</tr>
		<tr>
			<th>학번</th>
			<td><input type="text" name="snum" size="15" value="<%=doctor.getSnum()%>"></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><input type="text" name="major" size="50" value="<%=doctor.getMajor()%>"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" size="38" value="<%=doctor.getTel()%>"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" size="70" value="<%=doctor.getAddress()%>"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" size="40" value="<%=doctor.getEmail()%>"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="password"><span class="warn">*비밀번호를 입력하면 수정 및 변경이 가능합니다.</span></td>
		</tr>
	</table>
	<div class="btns">
		<input type="button" value="수정" id="btn_update">
		<input type="button" value="삭제" id="btn_delete">
		<input type="button" value="의사 목록" id="btn_d_list">
		
	</div>
</form>
</div>

</body>
</html>