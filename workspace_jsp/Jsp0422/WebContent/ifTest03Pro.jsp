<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTest03Pro</title>
</head>
<%--
서울: 02, 경기도: 031, 강원: 033, 충남: 041, 충북: 043, 전남: 061, 전북: 063
, 경남:055, 경북: 054

 --%>
<body>
	<h2>이름과 전화번호를 출력하는 페이지</h2>
	
	<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String local = request.getParameter("local");
	String tel = request.getParameter("tel");
	String tel2 = "";
	
	if(local.equals("서울")) {
		tel2 = "02";
	} else if(local.equals("경기도")) {
		tel2 = "031";
	} else if(local.equals("강원")) {
		tel2 = "033";
	} else if(local.equals("충남")) {
		tel2 = "041";
	} else if(local.equals("충북")) {
		tel2 = "043";
	} else if(local.equals("전남")) {
		tel2 = "061";
	} else if(local.equals("전북")) {
		tel2 = "063";
	} else if(local.equals("경남")) {
		tel2 = "055";
	} else if(local.equals("경북")) {
		tel2 = "054";
	} 
	
	//2번 방법
	out.print(name + "님의 전화번호는 " + tel2 + ")" + tel + "입니다.");
	%>
	<%-- 1번 방법: 스크립틀릿과 익스프레션을 사용하는 방법 --%>
	<%=name %>님의 전화번호는 <%=tel2 %> - <%=tel %>입니다.
	<%-- 2번 방법: 스크립틀릿과 out 내장객체를 사용하는 방법 --%>

</body>
</html>