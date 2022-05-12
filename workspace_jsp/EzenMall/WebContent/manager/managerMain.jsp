<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리자 페이지</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hammersmith+One&family=Paytone+One&display=swap');
#container { width: 300px; margin: 20px auto;}
a { text-decoration: none; color: black;}

/* 상단 - 메인, 서브 타이틀 */
.m_title { font-family:'Paytone One', sans-serif; font-size: 3em; text-align: center;}
.s_title { font-family:'Do Hyeon', sans-serif; font-size: 2em; text-align: center; margin-bottom: 30px}
a { text-decoration: none; font-size: 0.95em; font-weight: bold;}
.c_logout { text-align: right; margin-bottom: 10px;}
.c_logout a { color: #705e7b;}

/* 중단 - 로그인 박스 */
.b_box { border: 1px solid lightgray; padding: 5px; margin: 10px;}
.b_box input[type='text'], .b_box input[type='password'] { height: 30px; padding-left: 35px; border: none;}
.b_box input[type='text']:focus, .b_box input[type='password']:focus { outline: none;} 
.b_box input[type='text'] { background: url('../../icons/login_id.png') no-repeat; background-size: 25px; background-position: left center;}
.b_box input[type='password'] { background: url('../../icons/login_pwd.png') no-repeat; background-size: 22px; background-position: left center;}
.c_box { padding: 0; margin: 10px;}
.c_box input[type='button'] { width: 280px; height: 45px; border: none; background: #5e869c; color: #fff; font-weight: bold; font-size: 1.03em;}


/* 테이블 메뉴 */
table { width: 100%; border: 1px solid black; border-collapse: collapse;
border-top: 3px solid black; border-bottom: 3px solid gray; border-left: hidden; border-right: hidden;}
tr { height: 50px;}
th { border: 1px solid black;}
.logout_row { background: #dddce9;}
.title_row { background: #dee2e6; font-size: 1.1em;}
.a_row { background: #dddce9; opacity: 0.5; cursor: pointer;}
</style>
</head>
<body>
<%
String managerId = (String)session.getAttribute("managerId");
if(managerId == null) {
	out.print("<script>location = 'logon/managerLoginForm.jsp';</script>");
}
%>
<div id="container">
	<div class="m_title"><a href="#">AH MALL</a></div>
	<div class="s_title">쇼핑몰 관리자 페이지</div>
	<div class="c_logout"><a href="logon/managerLogout.jsp">로그아웃</a></div>
	<table>
		<tr class="title_row"><th>상품 관리</th></tr>
		<tr class="a_row"><th><a href="product/productRegisterForm.jsp">상품 등록</a></th></tr>
		<tr class="a_row"><th><a href="product/productList.jsp">상품 목록(수정/삭제)</a></th></tr>
		<tr class="title_row"><th>주문 관리</th></tr>
		<tr class="a_row"><th><a href="">주문 목록(수정/삭제)</a></th></tr>
		<tr class="title_row"><th>회원 관리</th></tr>
		<tr class="a_row"><th><a href="">회원 목록(수정/삭제)</a></th></tr>
		
	</table>
</div>

</body>
</html>