<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%
	//post 방식에서는 인코딩 형식을 다시 정해주어야한다.
	// 그러지않으면 한글이 깨지는 문제가 발생한다.
	request.setCharacterEncoding("utf-8");
	
	int age = Integer.parseInt(request.getParameter("age"));
	String nam = request.getParameter("nam");
	%>

	<%
	
	if(age >= 20) {
		out.print(nam + "은 성년입니다.");	
	} else if(age < 20) {
		out.print(nam + "은 미성년입니다.");	
	} 
	%>
</body>
</html>