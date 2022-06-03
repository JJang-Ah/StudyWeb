<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.cart.*, java.util.*, mall.member.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<style>
.container { width: 1200px; margin: 0 auto;}
.cart_list { width: 100%;}
/* 상단1 */

/* 상단2 */

/* 상단3 */
.d3 { width: 90%; padding: 15px; margin: 15px 45px; }
.d3 .s1 { font-size: 1.1em; font-weight: bold; margin-right: 30px;}
.d3 .s2, .d3 .s3 { display: inline-box; width: 150px; text-align: center; padding: 6px 17px; border: 1px solid #333; font-size: 0.8em; border-radius: 15px; font-weight: bold;}
.d3 .s2 { width: 300px; background: #333; color: #fff; z-index: 10; position: relative;}
.d3 .s3 { width: 300px; background: #fff; color: #333; margin-left: -30px; z-index: -10; position: relative;}

/* 상품 정보 테이블 */
.t_cart_list { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; text-size: 0.9em;}
.t_cart_list tr { height: 40px;}
.t_cart_list td, .t_cart_list th { border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; border-right: none; border-left: none;}
.t_cart_list th { background: #f1f3f5;}
.t_cart_list td { }
.left { text-align: left; margin-left: 10px;}
.center { text-align: center;}
.td1 #check_cart { zoom: 1.5;}
.td3 .s1 { font-weight: bold; color: #1e94be;}
.td3 .s2 { font-size: 0.9em; color: black;}
.td3 .s3 { font-size: 0.9em; color: gray; text-decoration: line-through;}
.td3 .s4 { font-weight: bold; color: #c84557;}
.td4 input[type="number"] { width: 45px; margin-bottom: 5px;}

/* number 화살표 항상 보이는 효과 */
.td4 input[type=number]::-webkit-inner-spin-button, 
.td4 input[type=number]::-webkit-outer-spin-button { -webkit-appearance: "Always Show Up/Down Arrows"; opacity: 1;}

.td4 input[type="button"] { width: 55px; height: 25px; border: 1px solid gray; background: #fff; border-radius: 2px; font-size: 0.8em; cursor: pointer;}
.td7 input[type="button"] { width: 100px; height: 30px; border: none; border-radius: 3px; color: #fff; font-weight: bold; cursor: pointer;}

.td7 #btn_buy_one { background: #1e94be; border: 1px solid #1e94bd; margin-bottom: 5px;}
.td7 #btn_delete_one { background: #c84557; border: 1px solid #c84557;}

</style>
<script>
	document.addEventListener("DOMContentLoaded", funnction() {
		// 구매 수량 제한 효과(1~100) -> 수정
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

// 회원 연결  DB연결, 질의
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO member = memberDAO.getMember(memberId);

String address = member.getAddress();


// 장바구니 DB 연결, 질의
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
	<div class="cart_list">
		<div class="d1">
		
		</div>
		<div class="d2">
			<input type="checkbox" name="ck_cart_all" id="ck_cart_all"><label for="ck_cart_all">전체 선택</label>
			<input type="button" value="주문" id="btn_buy_select">
			<input type="button" value="삭제" id="btn_delete_select">
			
		</div>
		<div class="d3">
			<span class="s1">EZENMALL 배송</span>
			<span class="s2">당일/하루/일반 배송</span>
			<span class="s3">아침배송</span>
		</div>
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
				buy_count = cart.getBuy_count();
				discount_rate = cart.getDiscount_rate();
				p_sum = buy_price * buy_count; // 각상품의 합계
				
			%>
			<tr>
				<td class="center td1" width="3%"><input type="checkbox" name="check_cart" id="ck_cart_one" class="ck_cart_one" id="ch_cart_one"></td>
				<td class="center td2" width="8%"><img src="/images_ezenmall/<%=cart.getProduct_image()%>" width="60" height="90"></td>
				<td class="left td3" width="48%">
					<span class="s1"><%=cart.getProduct_name() %></span><br>
					<span class="s2"><%=cart.getAuthor() %></span> | <span class="s2"><%=cart.getPublishing_com() %></span><br>
					<span class="s3"><%=df.format(cart.getBuy_price()) %>원</span> | <span class="s4"><%=df.format(buy_price) %> (<%=cart.getDiscount_rate() %>%)</span>
				</td>
				<td class="center td4" width="8%">
					<input type="number" name="buy_count" value="<%=cart.getBuy_count()%>" id="buy_count"><br>
					<input type="button" name="btn_count" value="변경" id="btn_update">
				</td>
				<td class="center td5" width="9%"><%=df.format(p_sum) %>원</td>
				<td class="center td6" width="12%">4일 이내</td>
				<td class="center td7" width="12%">
					<input type="button" name="btn_buy_one" value="주문하기" id="btn_buy"><br>
					<input type="button" name="btn_delte_one" value="삭제" id="btn_delete">
				</td>
			</tr>
			<%} %>
		</table>
	</div>
	<jsp:include page="../common/shopBottom.jsp"></jsp:include>
</div>

</body>
</html>