<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLoginPro</title>
</head>
<body>
	<%-- 로그인 처리, 아디와 패스워드를 확인, 아이디를 세션으로 저장 --%>
	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// 아이디와 비밀번호 확인
	// id는 catain6, pwd는 1234로 가정하고 프로그래밍 -> 원래는 DB작업
	if(id.equals("captain6")) {
		if(pwd.equals("1234")) { // 아이디가 있고, 비밀번호가 일치할 때
			// 아이디를 세션으로 저장
			session.setAttribute("id", id);
			response.sendRedirect("sessionMain.jsp");
			
		}else { // 아이디는 있지만, 비밀번호가 일치하지 않을 때 
			out.print("<script>alert('비밀번호가 일치하지 않습니다.');history.back();</script>");

		}
	} else {
		out.print("<script>alert('아이디가 존재하지 않습니다.');history.go(-1);</script>");
		
	}
	%>

</body>
</html>