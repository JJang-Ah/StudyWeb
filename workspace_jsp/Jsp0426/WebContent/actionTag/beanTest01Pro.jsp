<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="test.TestBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beanTest01Pro</title>
</head>

<%--
1. 자바의 클래스를 사용하는 방법
(1) 단순명 사용, Simple Name(SN)
import java.util.Date;

// 클래스 main 메소드 안에서
Date now = new Date();

(2)완전수식명 사용, Full Qualified Name(FQN)
java.util.Date now = new java.util.Date();

 --%>
<body>
	
	<h2>A 커뮤니티 로그인 처리</h2>
	<% request.setCharacterEncoding("utf-8"); %>
	
	
	<%-- TestBean 객체 생성 --%>
	<jsp:useBean id="testBean" class="test.TestBean"></jsp:useBean>
	
	<%-- TestBean 객체에 property값을 넣음 --%>
	<jsp:setProperty property="id" name="testBean"/>
	<jsp:setProperty property="name" name="testBean"/>
	
	<%-- TestBean 객체의 property값을 받음 --%>
	아이디: <jsp:getProperty property="id" name="testBean"/> <br>
	이름:  <jsp:getProperty property="name" name="testBean"/>
	<hr>
	아이디: <%=testBean.getId() %> <br>
	이름: <%=testBean.getName() %>
	 
	
<!-- 	위 작업을 아래처럼 할 수 있다. 위 액션태그를 사용하는것이 좋다. -->
	<%-- 
	<%
	TestBean testBean2 = new TestBean();
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	testBean2.setId(id);
	testBean2.setName(name);
	
	out.print("아이디: " + testBean2.getId() + "<br>이름: " + testBean2.getName());
	%> 
	--%>
	
</body>
</html>