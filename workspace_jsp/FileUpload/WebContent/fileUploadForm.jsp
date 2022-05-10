<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 폼</title>
<style>
#container { width: 400px; margin: 0 auto;}
h3 { text-align: center;}
.a_box { width: 100%; padding: 10px; border: 1px solid black; text-align: center;}
.b_box { width: 100%; padding: 5px; margin: 10px 0;}
.a_box label { display: inline-block; width: 60px; font-weight: bold; text-align: right; margin-right: 20px;}
.a_box input { width: 200px; height: 25px;}
.btns { text-align: center; margin-top: 10px;}
.btns input { width: 100px; height: 35px; border: none; background: black; color: white; font-weight: bold; border-radius: 10px;}



</style>
</head>
<body>

<div id="container">
	<h3>파일 업로드 폼</h3>
	<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data"> 
		<%-- 파일 업로드 할떄에는 enctype 필수! --%>
		<div class="a_box">
			<div class="b_box">
				<label for="writer">작성자</label>
				<input type="text" name="writer" id="writer">
			</div>
			<div class="b_box">
				<label for="subject">제목</label>
				<input type="text" name="subject" id="subject">
			</div>
			<div class="b_box">
				<label for="uploadFile">파일명</label>
				<input type="file" name="uploadFile" id="uploadFile">
			</div>
		</div>
		<div class="btns">
			<input type="submit" value="파일 업로드">
		</div>
	</form>
</div>

</body>
</html>