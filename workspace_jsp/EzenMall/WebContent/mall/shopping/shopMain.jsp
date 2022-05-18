<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="manager.product.*, java.util.*"%>
<%-- 쇼핑몰 메인 페이지: 상품이 나열되는 페이지 --%>
<%-- 상품의 분류별 전체 보기 --%>
<style>
/* 상품 분류별 노출 */
.d_kind1 { text-align: left; margin-bottom: 5px;}
.d_kind1 .s_kind1 { display: inline-block; float: right;}
.d_kind3 { text-align: center; float: left; font-size: 0.9em;}
.d_kind3 a { text-decoration: none; color: #000;}
.c_product { position: relative; display: inline-block; width: 250px; height: 350px; padding: 10px; margin: 10px; border: 1px solid black;}
.c_product:hover { background: rgba(100, 100, 100, 0.6);}
.c_product div { margin-bottom: 5px;}
.c_product .c_p2, .c_product .c_p4 { font-weight: bold;}
.c_product .c_p3 { font-size: 0.95em; color: #adb5bd;}
.c_product .c_p2, .c_product .c_p3 { white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
.c_product .c_p2:hover, .c_product .c_p3:hover { white-space: nowrap; overflow: visible; text-overflow: inherit;}

/* hover 했을 때 화면 구성 */
.c_product figcaption {
  position: absolute;
  /* 이미지 위에 올라가야하기 때문에 position:absolute, top:0, left:0 */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .8);
  transition: .2s;
  opacity: 0;
}

.c_product:hover figcaption { opacity: 1;}

figcaption div {
  position: absolute;
  top: 40%;
  width: 70px;
  height: 70px;
  border: 1px solid white;
  border-radius: 50%;
  color: white;
  font-size: 14px;
  text-align: center;
  line-height: 70px;
}
figcaption div:hover {
  cursor: pointer;
}
.buy {
  left: 20%;
  background-color: white;
  color: #000;
}
.info {
  right: 20%;
  color: #fff;
}

</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	let product_kind = document.getElementById("product_kind");
	
	// 상품 분휴 선택에 대한 change 이벤트 처리
	product_kind.addEventListener("change", function(event) {
		// product_kind를 가지고 shopAll.jsp로 이동
		location = 'shopAll.jsp?product_kind=' + product_kind.value;
		
	})
	
})
</script>
<%
request.setCharacterEncoding("utf-8");
String product_kind = request.getParameter("product_kind");
if(product_kind == null) product_kind = "110";

// 상품 분류별 상품명 설정
String product_kindName = "";
switch(product_kind) {
case "110": product_kindName = "소설/시"; break;
case "120": product_kindName = "에세이"; break;
case "210": product_kindName = "역사"; break;
case "220": product_kindName = "예술"; break;
case "230": product_kindName = "종교"; break;
case "240": product_kindName = "사회"; break;
case "250": product_kindName = "과학"; break;
case "310": product_kindName = "경제/경영"; break;
case "320": product_kindName = "자기계발"; break;
case "410": product_kindName = "여행"; break;
case "420": product_kindName = "만화"; break;
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

ProductDAO productDAO = ProductDAO.getInstance();
List<ProductDTO> productList = productDAO.getProductList(product_kind);

// for(ProductDTO product : productList) {
// 	System.out.println(product);
// }
%>
<%-- 분류별 상품을 4개씩 3단으로 처리 --%>
<div>
	<div class="d_kind1">
		<span class="s_kind1"><%=product_kindName %> 분야 상품 목록</span>
		<span class="s_kind2">
			<select id="product_kind">
				<option value="110" <%if(product_kind.equals("110")) {  %>selected <%} %>>소설/시</option>
				<option value="120" <%if(product_kind.equals("120")) {  %>selected <%} %>>에세이</option>
				<option value="210" <%if(product_kind.equals("210")) {  %>selected <%} %>>역사</option>
				<option value="220" <%if(product_kind.equals("220")) {  %>selected <%} %>>예술</option>
				<option value="230" <%if(product_kind.equals("230")) {  %>selected <%} %>>종교</option>
				<option value="240" <%if(product_kind.equals("240")) {  %>selected <%} %>>사회</option>
				<option value="250" <%if(product_kind.equals("250")) {  %>selected <%} %>>과학</option>
				<option value="310" <%if(product_kind.equals("310")) {  %>selected <%} %>>경제/경영</option>
				<option value="320" <%if(product_kind.equals("320")) {  %>selected <%} %>>자기계발</option>
				<option value="410" <%if(product_kind.equals("410")) {  %>selected <%} %>>여행</option>
				<option value="420" <%if(product_kind.equals("420")) {  %>selected <%} %>>만화</option>
				<option value="510" <%if(product_kind.equals("510")) {  %>selected <%} %>>잡지</option>
				<option value="610" <%if(product_kind.equals("610")) {  %>selected <%} %>>어린이</option>
				<option value="620" <%if(product_kind.equals("620")) {  %>selected <%} %>>육아</option>
				<option value="630" <%if(product_kind.equals("630")) {  %>selected <%} %>>가정/살림</option>
				<option value="710" <%if(product_kind.equals("710")) {  %>selected <%} %>>건강/취미</option>
				<option value="720" <%if(product_kind.equals("720")) {  %>selected <%} %>>요리</option>
				<option value="810" <%if(product_kind.equals("810")) {  %>selected <%} %>>IT 모바일</option>
				<option value="910" <%if(product_kind.equals("910")) {  %>selected <%} %>>수험서/자격증</option>
				<option value="920" <%if(product_kind.equals("920")) {  %>selected <%} %>>초중고 참고서</option>
			</select>
		</span>
	</div>
	<div class="d_kind2"></div>
	<div class="d_kind3">
		<%for(ProductDTO product: productList) { %>
		<div class="c_product">		
			<a href="shopContent.jsp?product_id=<%=product.getProduct_id()%>">
				<div class="c_p1"><img src="../../../../images_ezenmall/<%=product.getProduct_image()%>" width="200" height="280"></div>
				<div class="c_p2"><span title="<%=product.getProduct_name()%>"><%=product.getProduct_name() %></span></div>
				<div class="c_p3"><span title="<%=product.getAuthor()%>"><%=product.getAuthor() %></span> | <span title="<%=product.getPublishing_com()%>"><%=product.getPublishing_com() %></span></div>
				<div class="c_p4"><span title="<%=product.getProduct_price()%>"><%=product.getProduct_price() %></span> | <span>(<%=product.getDiscount_rate() %>%)</span></div>
			</a>
			<figcaption>
				<div class="buy">구매</div>
				<a href="shopContent.jsp?product_id=<%=product.getProduct_id() %>"><div class="info">상세</div></a>	
			</figcaption>
			
		</div><% } %>
	</div>
</div>

