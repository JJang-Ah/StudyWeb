<%@page import="java.text.*"%>
<%@page import="manager.product.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hammersmith+One&family=Paytone+One&display=swap');
#container { width: 1200px; margin: 0 auto;}
a { text-decoration: none; color: black;}

/* 상단 - 메인, 서브 타이틀 */
.m_title { font-family:'Paytone One', sans-serif; font-size: 3em; text-align: center;}
.s_title { font-family:'Do Hyeon', sans-serif; font-size: 2em; text-align: center; margin-bottom: 30px}
a { text-decoration: none; font-size: 0.95em; font-weight: bold;}

/* 상단 - 전체 상품수, 아이디, 로그아웃, 상품등록*/
.top_info { margin-bottom: 10px; text-align: right;}
.c_cnt { float: left;}
.c_cnt, .c_managerId { color: #59637f; font-size: 0.95em; font-weight: bold;}
.c_managerId { clear: both;}
.c_logout a { color: #99424f;}

/* 중단 - 상품 정보 테이블 */
table { width: 100%; border: 1px solid black; border-collapse: collapse; font-size: 0.9em;}
tr { height: 30px;}
/* tr:nth-child(2n) { background: #e9ecef;} */
tr:nth-child(2n+1) { background: #f8f9fa;}
th, td { border: 1px solid black;}
th { background: #dee2e6;}
.center { text-align: center;}
.left { text-align: left; padding-left: 2px;}
.right { text-align: right; padding-right: 5px;}
</style>
<script>

</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String managerId = (String)session.getAttribute("managerId");
if(managerId == null) {
	out.print("<script>location='../logon/managerLoginForm.jsp';</script>");
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
DecimalFormat df = new DecimalFormat("#,###,###");
String product_kindName = "";
// DB 연결, 질의 처리
ProductDAO productDAO = ProductDAO.getInstance();

// 전체 상품수 조회
int cnt = productDAO.getProductCount();

// 전체 상품 조회
List<ProductDTO> productList = productDAO.getProductList();

int number = cnt;
%>
<div id="container">
	<div class="m_title"><a href="../managerMain.jsp">AH MALL</a></div>
	<div class="s_title">상품 목록</div>
	
	<div class="top_info">
		<span class="c_cnt">전체 상품수: <%=cnt %>개</span>
		<span class="c_managerId"><%=managerId %>님(관리자)</span>&emsp;|&emsp;
		<span class="c_logout"><a href="../logon/managerLogout.jsp">로그아웃</a></span>&emsp;|&emsp;
		<span class="c_register_product"><a href="productRegisterForm.jsp">상품등록</a></span>
	</div>
	
	<table>
		<tr>
			<th width="4%">No</th>
			<th width="9%">분류</th>
			<th width="5%">상품사진</th>
			<th width="20%">제목</th>
			<th width="7%">가격</th>
			<th width="5%">재고</th>
			<th width="12%">저자</th>
			<th width="12%">출판사</th>
			<th width="7%">출판일</th>
			<th width="4%">할인율</th>
			<th width="7%">등록일</th>
			<th width="8%">수정|삭제</th>
		</tr>
		<% if(cnt == 0) { // 등록된 글이 없을 때  
			out.print("<tr><td colspan='13'>등록된 글이 없습니다.</td></tr>");
		} else {		// 등록된 글이 있을 때
			for(ProductDTO product : productList) {
				switch(product.getProduct_kind()) {
				case "110": product_kindName = "소설/시"; break;
				case "120": product_kindName = "에세이"; break;
				case "210": product_kindName = "역사"; break;
				case "220": product_kindName = "예술"; break;
				case "230": product_kindName = "종교"; break;
				case "240": product_kindName = "사회"; break;
				case "250": product_kindName = "과학"; break;
				case "310": product_kindName = "자기계발"; break;
				case "410": product_kindName = "여행"; break;
				case "510": product_kindName = "잡지"; break;
				case "610": product_kindName = "어린이"; break;
				case "620": product_kindName = "육아"; break;
				case "630": product_kindName = "가정/살림"; break;
				case "710": product_kindName = "건강/취미"; break;
				case "720": product_kindName = "요리"; break;
				case "810": product_kindName = "IT 모바일"; break;
				case "910": product_kindName = "수험서/자격증"; break;
				case "920": product_kindName = "참고서"; break;
				}
		%>
		<tr>
			<td class="center"><%=number-- %></td>	
			<td class="center"><%=product_kindName %></td>	
			<td class="center">
				<a href="productContent.jsp?product_id=<%=product.getProduct_id()%>">
					<img src=<%="/images_ezenmall/" + product.getProduct_image()%> width="55px" height="80px">
				</a>
			</td>	
			<td class="left">
				<a href="productContent.jsp?product_id=<%=product.getProduct_id()%>"><%=product.getProduct_name() %></a>
			</td>	
			<td class="right"><%=df.format(product.getProduct_price()) %>원</td>
			<td class="right"><%=df.format(product.getProduct_count()) %>권</td>
			<td class="center"><%=product.getAuthor() %></td>	
			<td class="center"><%=product.getPublishing_com() %></td>	
			<td class="center"><%=product.getPublishing_date() %></td>
			<td class="center"><%=product.getDiscount_rate() %></td>	
			<td class="center"><%=sdf.format(product.getReg_date()) %></td>	
			<td class="center">수정 | 삭제</td>	
		</tr>
		<%} }%>
	</table>
</div>
</body>
</html>