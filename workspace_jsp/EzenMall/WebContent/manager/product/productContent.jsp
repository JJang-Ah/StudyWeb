<%@page import="manager.product.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hammersmith+One&family=Paytone+One&display=swap');
#container { width: 550px; margin: 20px auto;}
a { text-decoration: none; color: black;}

/* 상단 - 메인, 서브 타이틀 */
.m_title { font-family:'Paytone One', sans-serif; font-size: 3em; text-align: center;}
.s_title { font-family:'Do Hyeon', sans-serif; font-size: 2em; text-align: center; margin-bottom: 30px}
a { text-decoration: none; font-size: 0.95em; font-weight: bold;}
.c_logout { text-align: right; margin-bottom: 10px;}
.c_logout a { color: #99424f;}

/* 중단 - 상품 등록 테이블*/
table { width: 100%; border: 1px solid gray; border-collapse: collapse;
border-top: 5px; border-bottom: 5px; border-left: hidden; border-right: hidden;}
tr { height: 35px;}
td, th { border: 1px solid gray;}
th { background: #d8f4e6;}
td { padding-left: 5px;}

/* 중단 - 테이블 안의 입력상자*/
input[type="number"] { width: 100px;}
textarea { margin-top: 5px;}

/* 하단 - 버튼 */
select { height: 24px;}
input::file-selector-button { width: 90px; height: 27px; background: #2f9e77; color: #fff;
 border: none; border-radius: 5px;}
.btns { text-align: center; margin-top: 10px;}
.btns input { width: 100px; height: 35px; border: none; background: #495057; color: #fff; 
font-weight: bold; margin: 5px; cursor: pointer; border-radius: 5px;}
.btns input:nth-child(1) { background: #2f9277;}
.btns input:nth-child(1):hover { border: 2px solid #2f9277; background: #fff; color: #2f9e77;
font-weight: bold;}
</style>
</head>
<body>
<%
int product_id = Integer.parseInt(request.getParameter("product_id"));

// DB 연결, 질의 
ProductDAO productDAO = ProductDAO.getInstance();
ProductDTO product = productDAO.getProduct(product_id);


%>
<div id="container">
	<div class="m_title"><a href="../managerMain.jsp">AH MALL</a></div>
	<div class="s_title">상품 정보 확인</div>
	
	<form action="productRegisterPro.jsp" method="post" name="registerForm" enctype="multipart/form-data">
	<%-- enctype="multipart/form-data" 파일 업로드하는 폼 >> 그래서 다른 프로퍼티들이 Pro로 넘어가지 않는다. --%>
		<table>
			<tr>
				<th>상품 분류</th>
				<td>
					<select name="product_kind">
						<option value="110">소설/시</option>
						<option value="120">에세이</option>
						<option value="210">역사</option>
						<option value="220">예술</option>
						<option value="230">종교</option>
						<option value="240">사회</option>
						<option value="250">과학</option>
						<option value="310">자기계발</option>
						<option value="410">여행</option>
						<option value="510">잡지</option>
						<option value="610">어린이</option>
						<option value="620">육아</option>
						<option value="630">가정/살림</option>
						<option value="710">건강/취미</option>
						<option value="720">요리</option>
						<option value="810">IT 모바일</option>
						<option value="910">수험서/자격증</option>
						<option value="920">초중고 참고서</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품 제목</th>
				<td><input type="text" name="product_name" size="56" value="<%=product.getProduct_name()%>"></td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td><input type="number" name="product_price" min="1000" max="1000000" value="<%=product.getProduct_price()%>">원</td>
			</tr>
			<tr>
				<th>상품 수량</th>
				<td><input type="number" name="product_count" min="0" max="100000" value="<%=product.getProduct_count()%>">권</td>
			</tr>
			<tr>
				<th>저자</th>
				<td><input type="text" name="author" value="<%=product.getAuthor()%>">
			</tr>
			<tr>
				<th>출판사</th>
				<td><input type="text" name="publishing_com" value="<%=product.getPublishing_com()%>"></td>
			</tr>
			<tr>
				<th>출판일</th>
				<td><input type="date" name="publishing_date" value="<%=product.getPublishing_date()%>"></td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td><input type="file" name="product_image"></td>
			</tr>
			<tr>
				<th>상품 내용</th>
				<td><textarea name="product_content" rows="15" cols="60"><%=product.getProduct_content() %></textarea></td>
			</tr>
			<tr>
				<th>할인율</th>
				<td><input type="number" name="discount_rate" min="0" max="90" value="<%=product.getDiscount_rate()%>">%</td>
			</tr>
		</table>
		<div class="btns">
			<input type="button" value="상품 정보 수정" id="btn_register">
			<input type="reset" value="다시 입력">
			<input type="button" value="상품 목록" id="btn_list">
			<input type="button" value="관리자 페이지" id="btn_main">
		</div>
	</form>
</div>


</body>
</html>