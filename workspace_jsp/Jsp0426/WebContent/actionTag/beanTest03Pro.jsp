<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest03Pro</title>
</head>
<body>
	<h2>C 단체톡방 로그인 처리</h2>
	<% request.setCharacterEncoding("utf-8"); %>
	
	<%-- 액션태그를 사용하는 방법: 파라미터의 이름과 프로퍼티의 이름이 다를 때  --%>
	
	<%-- 1단계: 객체 생성 --%>
	<jsp:useBean id="testBean" class="test.TestBean"/>
	
	<%-- 2단계: 파라미터의 값을 받아서, 프로퍼티에 값을 넣을 때, 파라미터와 프로퍼티의 이름이 다르다면 문제가 발생
		해결방법: param 속성을 사용하여 파라미터의 값을 받음
	 --%>
	
	<jsp:setProperty property="id" param="sid" name="testBean"/>
	<jsp:setProperty property="name" param="sname" name="testBean"/>
	
	<%-- 3단계: 프로퍼티에 저장된 값을 출력 --%>
	아이디: <jsp:getProperty property="id" name="testBean"/>
	이름: <jsp:getProperty property="name" name="testBean"/>

</body>
</html>