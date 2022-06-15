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
	out.print("<script>alert('로그인을 해주세요');location='../logon/memberLoginForm.jsp';</script>");
}

int cart_id = Integer.parseInt(request.getParameter("cart_id"));

// Cart DB 연동 -> cartList에서 넘어오는 정보
CartDAO cartDAO = CartDAO.getInstance();

// cartList 정보1개
CartDTO cart = cartDAO.getCart(cart_id);

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