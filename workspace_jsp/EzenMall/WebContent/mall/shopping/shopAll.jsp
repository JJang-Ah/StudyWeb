<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="manager.product.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 전체</title> <%-- 쇼핑몰 전체:: 상단+메인+하단 --%>

<%-- bxslider --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>
#container { width: 1300px; margin: 20px auto;}
/* 신상품 */
.new_items { text-align: center;}
.new_items div:nth-of-type(1) { display: inline-block;}
.c_new_img { transition: transform, 0.5s}
.c_new_img:hover { transform: scale(1.1);}

/* 추천상품 */
.good_items { text-align: center;}
.good_items div:nth-of-type(1) { display: inline-block;}
.c_good_img { transition: transform, 0.5s}
.c_good_img:hover { transform: scale(1.1);}


</style>
<script>
// 슬라이더(slider), 카로섹(carosel)
$(document).ready(function(){
  $('.slider').bxSlider({
        autoControls: true, 	// 기본값:false, 재생/정지 컨트롤 버튼 유무
        stopAutoOnclick: true, 	// 기본값:false, 불릿을 누르고나면 슬라이드 정지
        auto: true, 			// 기본값: false, 자동 슬라이드 전환
        autoHover: true, 		// 기본값: false, 마우스 위에 올렸을때 슬라이드 정지
        speed: 2000, 			// 화면 전환 속도
        pause: 3000,  			// 화면전환 시간 + 전환 지연시간 > 1초+1초 = 2초
        // 중요한 속성
        slideWidth: 200, 		// 이미지의 너비
        slideHeight: 320, 		// 이미지의 높이
        maxSlides: 5, 			// 이미지의 최대 노출 개수
        minSlides: 2, 			// 이미지의 최소 노출 개수
        moveSides: 2, 			// 슬라이드 이동 분할 개수
        slideMargin: 20, 		// 슬라이드 사이의 마진
        touchEnabled: false, 	// 웹 화면의 touch 이벤트를 제거
  });
});

</script>
</head>
<body>
<%
ProductDAO productDAO = ProductDAO.getInstance();

// 100번대와 200번대에서 신상품 3개씩을 리스트에 담아서 리턴
String[] nProducts = {"110", "120","210", "220", "230", "240", "250"};
List<ProductDTO> newProductList = productDAO.getProductList(nProducts, 1);

// 메인2: 추천상품(모든 상품에서 최신상품 1개씩 리스트에 담아서 리턴) - 나중에는 주문에 의한 구매수로 변환
List<ProductDTO> goodProductList = productDAO.getGoodProductList();

// for(ProductDTO product : newProductList) {
// 	System.out.println(product.getProduct_id() + " " + product.getProduct_image());
// }
%>
<div id="container">
	
	<div> <%-- 상단 --%>
		<header><jsp:include page="../common/shopTop.jsp"/></header>
	</div>
	<div> <%-- 메인(본문) --%>
		<main> <%-- 메인1: 100번대와 200번대에서 신상품을 3개씩 가져와서 bx-slider로 노출 --%>
			
			<article class="new_items">
				<h3>신상품</h3>
				<div class="slider">
				<%for(ProductDTO product : newProductList) {%>
					<a href="shopContent.jsp?product_id=<%=product.getProduct_id()%>"><img src="../../../../images_ezenmall/<%=product.getProduct_image()%>" class="c_new_img"></a>
				<%}%>
				</div>
			</article>
			
			<article class="good_items"> <%-- 메인2: 모든 상품에서 신상품 1개씩을 가져와서 slick으로 노출  --%>
				<h3>추천상품</h3>
				<div class="slider">
				<%for(ProductDTO product : goodProductList) {%>
					<a href="shopContent.jsp?product_id=<%=product.getProduct_id()%>"><img src="../../../../images_ezenmall/<%=product.getProduct_image()%>" class="c_good_img"></a>
				<%}%>
				</div>
			</article>
			<hr>
			<article class="best_items"> <%-- 메인3: 베스트셀러(주문수량이  가장 많은 상품 20개를 가져와서 노출) --%>
			</article>
			<article class=""> <%-- 메인4: 상품 종류별로 나열되도록 설정한 영역 --%>
				<jsp:include page="shopMain.jsp"/>
			</article> 
		</main>
	</div>
	<div> <%-- 하단 --%>
		<footer><jsp:include page="../common/shopBottom.jsp"/></footer>
	</div>

</div>


</body>
</html>