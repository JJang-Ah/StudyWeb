<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 확인</title>
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
.c_id { background: #ccc;}
.s_id { color: red; font-size: 0.9em;}
.addr_row {height: 100px;}
.addr_row input { margin: 2px 0;}
 color: white; font-size: 12px; cursor: pointer; border-radius: 3px; margin-left: 10px;}
#btn_address { width: 100px; height: 28px; border: none; background: #76af7b;
 color: white; font-size: 12px; cursor: pointer; border-radius: 3px;}
span { font-size: 0.8em;}
/* 하단 - 가입, 취소 버튼 */
.btns { text-align: center; margin-top: 30px;}
.btns input[type="button"] { width: 120px; height: 40px; background: black;
 color: white; border: none; font-size: 14px; font-weight: bold; cursor: pointer;}
 

</style>
<!-- 주소 다음 라이브러리 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 

<script>
	document.addEventListener("DOMContentLoaded", function() {
		let form = document.infoForm; // 폼은 그냥 받을 수 있음
		let id = form.id;
		let pwd = form.pwd;
		let pwd2 = form.pwd2;
		let name = form.name;
		let email = form.email;
		let tel = form.tel;
		let address = form.address;
		let address2 = form.address2;
		

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
		
		// 이메일 검사 함수
		let isEmail = function(value) {
			return (value.indexOf('@') > 2) && (value.split('@')[1].indexOf('.') > 1);
		}
		
		// 이메일 확인
		// 1. '@'문자를 포함하고 있는지의 여부 -> 아이디가 3글자 이상인지를 판별
		// 2. '@'문자 다음에 '.'을 포함하고 있는지의 여부 -> 회사이름도 3글자 이상인지를 판별
		let chk_email = document.getElementById("chk_email");
		email.addEventListener("keyup", function(event) {
			let value = event.currentTarget.value;
			if(isEmail(value)) { // 이메일 형식에 맞을 때
				chk_email.innerHTML="이메일 형식이 맞습니다. : " + value;
				chk_email.style.color = "blue";
				
			} else { // 이메일 형식이 아닐 때
				chk_email.innerHTML= "이메일 형식이 아닙니다. : " + value;
				chk_email.style.color="red";
			}
		})
		
		// 주소 찾기 버튼 - 다음 라이브러리 활용
		let btn_address = document.getElementById("btn_address");
		btn_address.addEventListener("click", function() {
			new daum.Postcode({
				oncomplete: function(data) {
					address.value = data.address;
				}
			}).open();
		})
		
		// 회원수정 페이지의 전체 내용 입력 유무에 따른 페이지 이동 처리
		let btn_update = document.getElementById("btn_update");
		btn_update.addEventListener("click", function() {
			
			if(pwd.value.length == 0) {
				alert(`비밀번호를 입력하세요!`);
				pwd.focus();
				return;
			}
			if(pwd.value.length == 0) {
				alert(`비밀번호 확인을 입력하세요!`);
				pwd2.focus();
				return;
			}
			if(pwd.value != pwd2.value) {
				alert(`비밀번호와 비밀번호 확인이 일치하지 않습니다.`);
				pw2.focus();
				return;
			}
			if(name.value.length == 0) {
				alert(`이름을 입력하세요!`);
				name.focus();
				return;
			}
			if(email.value.length == 0) {
				alert(`이메일을 입력하세요!`);
				email.focus();
				return;
			}
			if(tel.value.length == 0) {
				alert(`전화번호를 입력하세요!`);
				tel.focus();
				return;
			}
			if(address.value.length == 0) {
				alert(`주소찾기 버튼을 클릭하여 주소를 선택하세요!`);
				address.focus();
				return;
			}
			if(address2.value.length == 0) {
				alert(`상세주소를 입력하세요!`);
				address2.focus();
				return;
			}
			form.submit();
		})
		
		// 회원정보 수정 버튼을 클릭할 때
		// 회원탈퇴 버튼을 클릭할 때 - 회원 탈퇴 (삭제)
		let btn_delete = document.getElementById("btn_delete");
		btn_delete.addEventListener("click", function() {
			let form = document.infoForm;
			
			if(!form.id.value) {
				alert('아이디를 입력하시오~!');
				form.id.focus();
				return;
			}
			if(!form.pwd.value) {
				alert('비밀번호를 입력하시오~!');
				form.pwd.focus();
				return;
			}
			if(!form.pwd2.value) {
				alert('비밀번호 확일을 입력하시오~!');
				form.pwd2.focus();
				return;
			}
			if(form.pwd.value != form.pwd2.value) {
				alert('비밀번호와 비밀번호 확인의 값이 다릅니다!');
				form.pwd2.focus();
				return;
			}
			// 폼의 액션을 바꾸는 방법!!
			form.action = 'memberDeletePro.jsp';
			form.submit();
			
			
		})
	})
</script>
</head>
<body>
<%
String memberId = (String)session.getAttribute("memberId"); // .getAttribute()는 object 타입이기때문

if(memberId == null) {
	out.print("<script>location='../logon/memberLoginForm.jsp'</script>");
	
	
}

// 아래는 세션 memberId가 있을 때 실행
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO member = new MemberDTO();
member = memberDAO.getMember(memberId);

%>

<div id="container">
	<div class="m_title"><a href="#">EZEN MALL</a></div>
	<div class="s_title">회원정보 확인</div>
	
	<form action="memberUpdatePro.jsp" method="post" name="infoForm">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" size="15" value="<%=member.getId()%>" class="c_id" readonly>
					&ensp;<span class="s_id">아이디는 변경불가</span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" size="15" value="<%=member.getPwd()%>"> <br>
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
				<td><input type="text" name="name" size="15" value="<%=member.getName()%>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" size="30" value="<%=member.getEmail()%>"> <br>
					<span id="chk_email"></span>
				</td>
				
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" size="20" value="<%=member.getTel()%>"></td>
			</tr>
			<tr class="addr_row">
				<th>주소</th>
				<td>
					<input type="button" value="주소 찾기" id="btn_address"> <br>
					<input type="text" name="address" size="47"> <br>
					<input type="text" name="address2" size="47">
				</td>
			</tr>
			<tr>
				<th>가입 일시</th>
				<td><%=member.getRegDate() %></td>
			</tr>
		</table>
		<div class="btns">
			<input type="button" value="회원정보 수정" id="btn_update"> &emsp;&emsp;
			<input type="button" value="회원 탈퇴" id="btn_delete">
		</div>
	
	</form>
</div>


</body>
</html>