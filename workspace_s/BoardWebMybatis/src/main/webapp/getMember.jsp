<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 확인</title>
<style>

.container { width: 500px; margin: 20px auto;}
h1, .d1 { text-align: center;}
.d1 { margin-bottom: 20px;}
a { text-decoration: none; color: #196ab3; font-weight: bold; font-size: 1.05em;}
table { width: 100%; border: 1px solid black; border-collapse: collapse;}
tr { height: 40px;}
th, td { border: 1px solid black;}
th { background: #e9ecef;}
td { padding: 5px;}
.s_id { color: red; font-size: 0.9em;}
table .id {width: 150px; height: 20px;}
table .password {width: 150px; height: 20px;}
table .name {width: 150px; height: 20px;}
table .email {width: 150px; height: 20px;}
table .tel {width: 200px; height: 20px;}
table .address {width: 380px; height: 20px;}
.btns { margin-top: 20px; text-align: center;}
.btns input { width: 100px; height: 35px; font-size: 1.02em; font-weight: bold; border-radius: 3px; cursor: pointer;}
.btns input[type=submit] { background: #000; color: #fff; border: 1px solid #000;}
.btns input[type=button] { background: #868e96; color: #fff; border: 1px solid #868e96;}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	let form = document.detailForm;
	
	// 회원삭제 버튼 처리
	let btn_delete = document.getElementById("btn_delete");
	btn_delete.addEventListener("click", function() {
		form.action = "deleteMember.do";
		form.submit();
	})
	
	// 글목록 버튼 처리
	let btn_board_list = document.getElementById("btn_board_list");
	btn_board_list.addEventListener("click", function() {
//			form.action = "getBoardList.do";
//			form.submit();
		location = "getBoardList.do";
	})
})

</script>
</head>
<body>

<div id="container">
	<h1>회원정보</h1>
	<div class="d1"><a href="logout.do">로그아웃</a></div>
	
	<form action="updateMember.do" method="post" name="insertMemberForm">
	
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" class="id" value="${member.id } }" readonly>&emsp;<span class="s_id">아이디는 변경불가</span></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="password" class="password" value="${member.password }"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" class="name" value="${member.name }"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" class="email" value="${member.email }"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" class="tel" value="${member.tel }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" class="address" value="${member.address }"></td>
		</tr>
	</table>
	<div class="btns">
		<input type="submit" value="수정" id="btn_update">
		<input type="reset" value="삭제" id="btn_delete">
		<input type="button" value="글목록" id="btn_board_list">
	</div>
	
	</form>
	
</div>
</body>
</html>