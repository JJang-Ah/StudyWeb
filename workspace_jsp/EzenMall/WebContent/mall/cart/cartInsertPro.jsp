<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.cart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 등록 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String buyer = request.getParameter("buyer");
int product_id = Integer.parseInt(request.getParameter("product_id"));
String product_name = request.getParameter("product_name");
int buy_price = Integer.parseInt(request.getParameter("buy_price"));
int buy_count = Integer.parseInt(request.getParameter("buy_count"));
String product_image = request.getParameter("product_image");

CartDTO cart = new CartDTO();
cart.setBuyer(buyer);
cart.setProduct_id(product_id);
cart.setProduct_name(product_name);
cart.setBuy_price(buy_price);
cart.setBuy_count(buy_count);
cart.setProduct_image(product_image);

// 카트 정보확인
System.out.println(cart);

%>
</body>
</html>