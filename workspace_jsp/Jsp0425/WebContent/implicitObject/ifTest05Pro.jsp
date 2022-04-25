<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ifTest05Pro</title>
</head>
<body>
	<h2>참가자 취미 활동 보고서</h2>
	
	<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
// 	String hobby = request.getParameter("hobby"); // 값을 하나만을 받을 떄 사용
	String[] hobbies = request.getParameterValues("hobby");
	

	// 1번 방법 - out 내장객체
	String txt = "";
	for(int i=0; i<hobbies.length; i++) {
		txt += hobbies[i];
		if(i<hobbies.length-1) {
			txt += ", ";
		} 
	}
	out.print(name + "님의 취미는 " + txt + "입니다.");
	%>
	
	<hr>
	<hr>
	<%-- 2번 방법 - 익스프레션  --%>
	<%
	String txt2 = "";
	for(int i=0; i<hobbies.length; i++) {
		txt2 += hobbies[i];
		if(i < hobbies.length-1) txt2 += ", ";
	}
	%>
	<%=name %>님의 취미는 <%=txt2 %>입니다.
</body>
</html>