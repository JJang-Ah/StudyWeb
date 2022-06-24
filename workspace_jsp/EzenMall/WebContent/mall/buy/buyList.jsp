<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.buy.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종구매확인폼</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String memberId = (String)session.getAttribute("memberId");
if(memberId == null) {
	out.print("<script>alert('로그인을 해주세요.'); location='../logon/memberLoginForm.jsp';");
	out.print("</script>");
	return;
} 

List<BuyDTO> buyList = (List<BuyDTO>)session.getAttribute("buyList");
for(BuyDTO buy : buyList) {
	System.out.println("buyList : "+ buy);
}

// BuyDAO buyDAO = BuyDAO.getInstance();

%>
</body>
</html>