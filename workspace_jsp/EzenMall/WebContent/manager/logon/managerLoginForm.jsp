<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 폼</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hammersmith+One&family=Paytone+One&display=swap');
#container { width: 300px; margin: 0 auto;}
a { text-decoration: none; color: black;}
/* 상단 - 메인, 서브 타이틀 */
.m_title { font-family:'Paytone One', sans-serif; font-size: 3em; text-align: center;}
.s_title { font-family:'Do Hyeon', sans-serif; font-size: 2em; text-align: center; margin-bottom: 30px}

/* 중단 - 로그인 박스 */
.b_box { border: 1px solid lightgray; padding: 5px; margin: 10px;}
.b_box input[type='text'], .b_box input[type='password'] { height: 30px; padding-left: 35px;}
.b_box input[type='text'] { background: url('../../icons/login_id.png') no-repeat;}
.b_box input[type='password'] { background: url('../../icons/login_pwd.png') no-repeat;}

</style>

<script>


</script>
</head>
<body>

<div id="container">
	<div class="m_title"><a href="#">AH MALL</a></div>
	<div class="s_title">관리자 로그인</div>
	
	<form action="managerLoginPro.jsp" method="post" name="managerLoginForm">
		<div class="a_box">
			<div class="b_box">
				<%-- flaticon 사이트에서 아이콘 다운 --%>
				<input type="text" name="managerId" id="managerId" placeholder="아이디" size="28">
			</div>
			<div class="b_box">
				<input type="password" name="managerPwd" id="managerPwd" placeholder="비밀번호" size="28">
			</div>
			<div class="b_box">
				<input type="button" value="로그인" id="btn_login">
			</div>
		</div>
	
	</form>
</div>

</body>
</html>