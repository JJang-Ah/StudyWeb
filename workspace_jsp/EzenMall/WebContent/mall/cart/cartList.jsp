<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.cart.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<style>
.container { width: 1200px; margin: 0 auto;}

/* 상품 정보 테이블 */
.cart_list { width: 100%;}
.t_cart_list { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; text-size: 0.9em;}
.t_cart_list tr { height: 40px;}
.t_cart_list td, .t_cart_list th { border: 1px solid gray;}
.t_cart_list th { }
.t_cart_list td { }
.left { text-align: left; margin-left: 10px;}
.center { text-align: center;}
.td1 #check_cart { zoom: 1.5;}
.td4 input[type="number"] { width: 45px; margin-bottom: 5px;}

/* number 화살표 항상 보이는 효과 */
.td4 input[type=number]::-webkit-inner-spin-button, 
.td4 input[type=number]::-webkit-outer-spin-button { -webkit-appearance: "Always Show Up/Down Arrows"; opacity: 1;}

.td4 input[type="button"] { width: 55px; height: 25px; border: 1px solid gray; background: #fff; border-radius: 2px; font-size: 0.8em; cursor: pointer;}
.td7 input[type="button"] { width: 100px; height: 30px; border: none; border-radius: 3px; color: #fff; font-weight: bold; cursor: pointer;}

.td7 #btn_buy { background: #1e94be; border: 1px solid #1e94bd; margin-bottom: 5px;}
.td7 #btn_delete { background: #c84557; border: 1px solid #c84557;}

</style>
<script>
	document.addEventListener("DOMContentLoaded", funnction() {
		// 구매 수량 제한 효과(1~100)
		let buy_count = document.getElementById("buy_count");
		buy_count.addEventListener("keyup", function() {
			if(buy_count.value < 0) {
				buy_count.value = 1;
			} else if(buy_count.value >= 100) {
				buy_count.value = 100;
			}
		})
	})
</script>
</head>
<body>
<%
String memberId = (String)session.getAttribute("memberId");

if(memberId == null) {
	out.print("<script>alert('로그인을 해주세요.');");
	out.print("location='../logon/memberLoginForm.jsp';</script>");
}

SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
DecimalFormat df = new DecimalFormat("#,###,###");


CartDAO cartDAO = CartDAO.getInstance();
List<CartDTO> cartList = cartDAO.getCartList(memberId);

// 상품가격(정가), 할인율, 할인가격(판매가)
int product_price = 0;
int buy_price = 0;
int discount_rate = 0;
int buy_count = 0;
int p_sum = 0;
// // 장바구니 확인
// for(CartDTO cart : cartList) {
// 	System.out.println(cart);
// }


%>

<div id="container">
	<jsp:include page="../common/shopTop.jsp"></jsp:include>
	<div>
		<table class="t_cart_list">
			<tr>
				<th colspan="3">상품정보</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>배송정보</th>
				<th>주문</th>
			</tr>
			<%for(CartDTO cart : cartList) { 
				product_price = cart.getProduct_price();
				buy_price = cart.getBuy_price();
				discount_rate = cart.getDiscount_rate();
				
			%>
			<tr>
				<td class="center td1" width="3%"><input type="checkbox" name="check_cart" id="check_cart" class="check_cart"></td>
				<td class="center td2" width="8%"><img src="/images_ezenmall/<%=cart.getProduct_image()%>" width="60" height="90"></td>
				<td class="left td3" width="50%">
					<%=cart.getProduct_name() %><br>
					<%=cart.getAuthor() %> | <%=cart.getPublishing_com() %><br>
					<%=cart.getBuy_price() %> | <%=cart.getBuy_price() %> (<%=cart.getDiscount_rate() %>%)
				</td>
				<td class="center td4" width="8%">
					<input type="number" name="buy_count" value="<%=cart.getBuy_count()%>" id="buy_count"><br>
					<input type="button" name="btn_count" value="변경" id="btn_update">
				</td>
				<td class="center td5" width="8%"><%=cart.getBuy_price() * cart.getBuy_count() %></td>
				<td class="center td6" width="%">4일 이내</td>
				<td class="center td7" width="5%">
					<input type="button" name="btn_buy" value="주문하기" id="btn_buy"><br>
					<input type="button" name="btn_delte" value="삭제" id="btn_delete">
				</td>
			</tr>
			<%} %>
		</table>
	</div>
	<jsp:include page="../common/shopBottom.jsp"></jsp:include>
</div>

</body>
</html>