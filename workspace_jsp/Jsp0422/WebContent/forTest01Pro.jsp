<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forTest01Form</title>
<style>
table { border: 1px solid black; border-collapse: collapse;}
tr { height: 40px;}
th, td { border: 1px solid black; width: 200px;}
th { background: lightgray;}
td { text-align: center;}
</style>
</head>
<body>
	<h2>구구단 출력 처리 페이지</h2>
	<p>단을 표로 출력합니다. </p>
	<%
	int dan = Integer.parseInt(request.getParameter("dan"));
	%>
	<!-- 1번 방법: 스크립틀릿과 익스프레션을 사용하는 방법 -->
	<%-- 태그를 많이 사용할 때 --%>
	<table>
	<tr><th><%=dan %>단 </th></tr>
	<%for(int i=1; i<10; i++) {%>
		<tr><td><%=dan %> * <%=i %> = <%=dan*i %></td></tr>
	<%}%>
	</table>
	
	<hr>
	
	<%-- 2번 방법: 스크립틀릿 안에 내장 객체를 사용하는 방법 --%>
	<%-- 태그는 적고, 데이터를 중심으로 사용할 때 --%>
	<table>
	<tr><th><%=dan %>단</th></tr>
	<%
	for(int i=0; i<10; i++) {
		out.print("<tr><td>" + dan + "*" + i + "=" + (dan*i) + "</td></tr>");
	}
	%>
	</table>
</body>
</html>