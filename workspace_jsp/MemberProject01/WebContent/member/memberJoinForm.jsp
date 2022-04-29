<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hammersmith+One&family=Paytone+One&display=swap');
#container { width: 500px; margin: 0 auto;}
a { text-decoration: none; color: black;}
input[type="text"], input[type="password"] { height: 20px;}
/* 상단 - 메인, 서브 타이틀 */
.m_title { font-family:'Paytone One', sans-serif; font-size: 3em; text-align: center;}
.s_title { font-family:'Do Hyeon', sans-serif; font-size: 2em; text-align: center; margin-bottom: 30px}
/* 중단 - 입력 테이블 */
table { width: 100%; border: qpx solid black; border-collapse: collapse;}
tr { height: 65px;}
th, td { border: 1px solid black; padding-left: 10px;}
th { background: #ced4da;}
.addr_row {height: 100px;}
.addr_row input { margin: 2px 0;}
#btn_chk_id { width: 100px; height: 28px; border: none; background: #1e94be;
 color: white; font-size: 12px; cursor: pointer; border-radius: 3px; margin-left: 10px;}
#btn_address { width: 100px; height: 28px; border: none; background: #76af7b;
 color: white; font-size: 12px; cursor: pointer; border-radius: 3px;}
span { font-size: 0.8em;}
/* 하단 - 가입, 취소 버튼 */
.btns { text-align: center; margin-top: 30px;}
.btns input[type="button"] { width: 120px; height: 40px; background: black;
 color: white; border: none; font-size: 14px; font-weight: bold; cursor: pointer;}
 

</style><script>

	document.addEventListener("DOMContentLoaded", function() {
		let form = document.joinForm; // 폼은 그냥 받을 수 있음
		let pwd = form.pwd;
		let pwd2 = form.pwd2;
		let email = form.email;

		// 비밀번호 - pwd
		// 비밀번호 유효성 검사 - 8글자 이상의 비밀번호를 생성하도록 함
		let chk_pwd = document.getElementById("chk_pwd");
		pwd.addEventListener("keyup", function() {
			if (pwd.value.length < 4) {
				chk_pwd.innerHTML = "비밀번호는 4글자 이상이어야 합니다.";
				chk_pwd.style.color = "red";
			} else {
				chk_pwd.innerHTML = "사용가능한 비밀번호입니다."
				chk_pwd.style.color = "blue";
			}

		})
		// 비밀번호 확인 - pwd2
		// 비밀번호와 비밀번호 확인의 글자가 동일한지 유무 판단
		let chk_pwd2 = document.getElementById("chk_pwd2");
		pwd2.addEventListener("keyup", function() {
			if(pwd.value == pwd2.value) {
				chk_pwd2.innerHTML = "비밀번호가 일치합니다.";
				chk_pwd2.style.color = "blue";
			} else {
				chk_pwd2.innerHTML = "비밀번호가 일치하지 않습니다.";
				chk_pwd2.style.color = "red";
			}
		})
		
	})
</script>
</head>
<body>
<div id="container">
	<div class="m_title"><a href="#">EZEN MALL</a></div>
	<div class="s_title">회원가입</div>
	
	<form action="memberJoinPro.jsp" method="post" name="joinForm">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" size="15">
					<input type="button" value="ID중복체크" id="btn_chk_id"> <br>
					<span id="chk_id"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" size="15"> <br>
					<span id="chk_pwd"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="pwd2" size="15"> <br>
					<span id="chk_pwd2"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="15"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="30">
					<span id="chk_email"></span>
				</td>
				
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" size="20"></td>
			</tr>
			<tr class="addr_row">
				<th>주소</th>
				<td>
					<input type="button" value="주소 찾기" id="btn_address"> <br>
					<input type="text" name="address" size="47"> <br>
					<input type="text" name="address2" size="47">
				</td>
			</tr>
		</table>
		<div class="btns">
			<input type="button" value="회원가입" id="btn_insert"> &emsp;
			<input type="button" value="취소" id="btn_cancel">
		</div>
	
	</form>
</div>

</body>
</html>