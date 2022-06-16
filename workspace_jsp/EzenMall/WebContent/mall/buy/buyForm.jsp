<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.member.*, mall.cart.*, mall.bank.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 확인폼</title>
<style>
.container { width: 1200px; margin: 0 auto;}

/* 상단1 */
.d1 { width: 40%; padding: 15px; margin: 15px 45px; float: right;}
.d1 .s1 { font-size: 1.1em; font-weight: bold; margin-right: 30px;}
.d1 .s2, .d1 .s3 { display: inline-box; width: 150px; text-align: center; padding: 6px 17px; border: 1px solid #333; font-size: 0.8em; border-radius: 15px; font-weight: bold;}
.d1 .s2 { width: 300px; background: #cd1e2a; color: #fff; z-index: 10; position: relative;}
.d1 .s3 { width: 300px; background: #fff; color: #333; margin-left: 0px; z-index: -10; position: relative;}

/* 상단2 */
.d2 { width: 40%; padding: 15px; margin: 5px 45px; float: left; display: inline-block; text-align: left;}
.d_line { clear: both; width: 90%; border: 1px solid lightgray;}

/* 중단 - 구매정보 확인 (장바구니 또는 상품 상세) */

.d3 .t1 { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; text-size: 0.9em;
			border-left: none; border-right: none; clear: both;}
.d3 .t1 tr { height: 40px;}
.d3 .t1 td, .d3 .t1 th { border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; border-right: none; border-left: none;}
.d3 .t1 th { background: #f1f3f5;}
.d3 .t1 td { }
.d3 .t1 tr:last-child { font-weight: normal;}
.d3 .t1 input[type=number] { width: 80px;}
.left { text-align: left; margin-left: 10px;}
.center { text-align: center;}

</style>
<script>

</script>
</head>
<body>
<%
// buyForm.jsp -> 구매정보 확인폼(구매 여부를 결정하는 폼), buyList.jsp -> 구매 목록 폼 (최종 구매)
request.setCharacterEncoding("utf-8");

String memberId = (String)session.getAttribute("memberId");

if(memberId == null) {
	out.print("<script>alert('로그인을 해주세요.');");
	out.print("location='../logon/memberLoginForm.jsp';</script>");
	return;
}

// cartList.jsp에서 넘어오는 cart_id를  확인, 배열 -> 리스트로
String cart_id_str = request.getParameter("cart_id"); 
String[] cart_id_arr = cart_id_str.split(",");
List<Integer> cart_id_list = new ArrayList<Integer>();
for(String c : cart_id_arr) {
	cart_id_list.add(Integer.parseInt(c));
}


//cart_id 확인
// 카트 확인
System.out.println("카트 배열: " + Arrays.toString(cart_id_arr));
System.out.println("카트 리스트: " + cart_id_list);

// Cart DB 연동 -> cartList에서 넘어오는 정보
CartDAO cartDAO = CartDAO.getInstance();
List<CartDTO> cartList = cartDAO.getCartList(cart_id_list);

// cartList 확인
for(CartDTO c : cartList) {
	
}

// Bank DB 연동
BankDAO bankDAO = BankDAO.getInstance();
List<BankDTO> bankList = bankDAO.getBankList(memberId);

// Member DB 연동
MemberDAO memberDAO = MemberDAO.getInstance();

%>

<div class="container">
	<jsp:include page="../common/shopTop.jsp"></jsp:include>
	<div class="buyForm">
		<div class="d1">
			<span class="s1">EZENMALL 배송</span>
			<span class="s2">당일/하루/일반 배송</span>
			<span class="s3">아침배송</span>
		</div>
		<div class="d2">
			<img src="../../icons/progress02.PNG" width="400" heigh="60">
		</div>
		<hr class="d_line">
		<div class="d3"> <!-- 카트 정보 -->
			<table class="t1">
				<tr>
					<th colspan="2">상품정보</th>
					<th>정가</th>
					<th>판매가</th>
					<th>구매수량</th>
					<th>합계</th>
					<th>배송일</th>
				</tr>
				<%for(CartDTO cart : cartList) {
				%>
				<tr>
					<td width="8"><img src="/images_ezenmall/<%=cart.getProduct_image()%>"></td>
					<td width="50">
						<span><%=cart.getProduct_name() %></span>
						<span><%=cart.getAuthor() %> | <%=cart.getPublishing_com() %></span>
					</td>
					<td width="8"><span><%=cart.getProduct_price() %></span></td>
					<td width="8"><span><%=cart.getBuy_price() %></span></td>
					<td width="8"><span><input type="number" name="buy_count" value="<%=cart.getBuy_count()%>"></span></td>
					<td width="8"><span><%=cart.getBuy_price() * cart.getBuy_count() %></span></td>
					<td width="10"><span><%=cart.getBuy_price() %></span></td>
					
				
				</tr>
				<%} %>
			</table>
		
		</div>
		<div class="d4"> <!-- 구매 총 정보 -->
		
		</div>
		<div class="d5"> <!-- 배송지 정보 -->
		
		</div>
		<div class="d6"> <!-- 주문자 정보 -->
		
		</div>
		
	</div>
	<jsp:include page="../common/shopBottom.jsp"></jsp:include>

</div>

</body>
</html>