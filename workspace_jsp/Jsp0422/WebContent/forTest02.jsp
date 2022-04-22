<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forTest02</title>
<style>
table { border: 1px solid black; border-collapse: collapse;}
tr { height: 40px;}
th, td { border: 1px solid black; width: 200px;}
th { background: lightgray;}
td { text-align: center;}
</style>
</head>
<%--
문제) 학생의 정보를 이름, 국어, 영어, 수학, 총점, 평균을 테이블 형태로 출력하시오.
 --%>
<body>
	<h2>학생의 정보를 출력하는 페이지</h2>
	<%
	String[][] st = {
			{"이익준", "95", "87", "92"},
			{"김준완", "88", "75", "96"},
			{"채송화", "85", "88", "79"},
			{"양석형", "68", "77", "88"},
			{"안정원", "83", "88", "94"}		
	};
	%>
	<%-- 1번 방법 --%>
	<table>
	<tr><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th></tr>
	<%for(int i=0; i<st.length; i++) {%>
		<tr>
		<%
		int sum=0;
		for(int j=0; j<st[i].length; j++) {%>
			<td><%=st[i][j] %></td>
		<% if(j !=0 ) sum += Integer.parseInt(st[i][j]);
		}
		%>
		<td><%=sum %></td>
		<td><%=sum/3 %></td>
		</tr>
	<%}%>
	</table>
	<hr>
	<%-- 2번 방법 --%>
	<table>
	<tr><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th></tr>
	<%for(int i=0; i<st.length; i++) {
		out.print("<tr>");
		int sum=0;
		for(int j=0; j<st[i].length; j++) {
			out.print("<td>" + st[i][j] + "</td>");
		 if(j !=0 ) sum += Integer.parseInt(st[i][j]);
		}
		out.print("<td>" + sum + "</td><td>" + (sum/3) + "</td></tr>");
	}%>
	</table>
	
</body>
</html>