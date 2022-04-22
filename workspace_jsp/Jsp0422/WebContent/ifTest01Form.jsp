<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTEst01Form</title>
</head>

<%--
폼 태그의 속성
- action: 이동할 jsp 페이지 
- method: get or post

웹에서 데이터를 전달하는 방식
(1) get 방식
- 데이터를 url 태그에 붙여서 이동하는 방식
- 장점: 상대적으로 속도가 빠름
- 단점: 데이터가 url에 그대로 노출
ex) 쇼핑몰의 상품에 관한 정보의 노출
(2) post 방식
- 데이터의 html 태그에 헤더영역에 숨겨서 이동하는 방법
- 장점: 데이터의 노출이 되지 않음. 보안
- 단점: 상대적으로 속도가 느리다.
ex) 로그인, 회원가입, 은행.. 
 --%>
<body>
	<h2>숫자 판별 폼</h2>
	<p>정수를 입력하면 양수, 음수, 0을 판별합니다. </p>
	<form action="ifTest01Pro.jsp" method="post">
		<input type="text" name="number">
		<input type="submit" value="입력완료">
	</form>

</body>
</html>