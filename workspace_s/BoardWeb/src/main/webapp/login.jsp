<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인폼<title>
<style>
.container { width: 400px; margin: 20px auto;}
h1 { text-align: center;}
table { border: 1px solid black; border-collapse: collapse;}
tr { height: 50px;}
th, td { border: 1px solid black;}
th { background: #eec9ef;}
td { padding-left: 10px;}
tr:nth-of-type(3) td { text-align: center;}
input[type=text], input[type=password] { width: 210px; height: 25px;}
input[type=submit] { width: 100px; height: 35px; font-size: 1.05em; font-weight: bold; border-radius: 5px;}

</style>
</head>
<body>
<div class="container">
	<h1>로그인</h1>
	<hr>
	<form action="" method="post">
		<table>
			<tr>
				<th width="30%">아이디</th>
				<td width="70%"><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>