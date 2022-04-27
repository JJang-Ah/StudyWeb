<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template</title>
</head>
<style>

	table { width: 100%;}
	td { text-align: center;}
	.tr_top { height: 300px; background: orange;}
	.tr_bottom { height: 200px; background: lightgray;}
	.tr_item { height: 500px; background: skyblue;}
	
	
</style>
<body>
	<table>

		<tr class="tr_top"><td><jsp:include page="top.jsp"/></td></tr>
		<tr class="tr_item"><td><jsp:include page="item.jsp"/></td></tr>
		<tr class="tr_bottom"><td><jsp:include page="bottom.jsp"/></td></tr>
	</table>
	

</body>
</html>