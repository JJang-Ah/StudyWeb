<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="manager.product.*" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정 처리</title>
<script>
</script>
</head>
<body>
<% request.setCharacterEncoding("utf-8");

// 등록 폼에서 받은 입력정보 획득
// 파일 업로드 폼은 request로 작업하지 못한다. -> cos.jar 라이브러리의 MultipartRequest 클래스를 사용한다.
// request, 업로드되는 폴더, 파일의 최대크기, encType, 파일명 중복정책
String realFolder = "C:/Users/tw5hy/바탕 화면/이젠 아카데미/images_ezenmall";
int maxSize = 1024 * 1024 * 5; // 5Mb
String encType = "utf-8";
String fileName = "";

MultipartRequest multi = null;

try {
	multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	Enumeration<?> files = multi.getFileNames(); // 넘어오는 파일들의 name들을 받는다.
	while(files.hasMoreElements()) {
		String name = (String)files.nextElement();
		fileName = multi.getFilesystemName(name);
	}
} catch(Exception e) {
	System.out.println("productUpdatePro.jsp 파일: " + e.getMessage());
	e.printStackTrace();
} 


// pageNum 획득
String pageNum = multi.getParameter("pageNum");

// 폼에서 넘어오는 11개의 필드 값을 획득 - 제외(reg_date)
int product_id = Integer.parseInt(multi.getParameter("product_id"));
String product_kind = multi.getParameter("product_kind");
String product_name = multi.getParameter("product_name");
int product_price = Integer.parseInt(multi.getParameter("product_price")); // 넘어오는 값은 String으로 오기때문
int product_count = Integer.parseInt(multi.getParameter("product_count"));
String author = multi.getParameter("author");
String publishing_com = multi.getParameter("publishing_com");
String publishing_date = multi.getParameter("publishing_date");
//String product_image = multi.getParameter("product_image"); // 이름을 얻을 수 없다.
String product_content = multi.getParameter("product_content");
int discount_rate = Integer.parseInt(multi.getParameter("discount_rate"));

// ProductDTO 객체 생성하여 setter 메소드를 사용하여 값을 설정한다.
ProductDTO product = new ProductDTO();
product.setProduct_id(product_id);
product.setProduct_kind(product_kind);
product.setProduct_name(product_name);
product.setProduct_price(product_price);
product.setProduct_count(product_count);
product.setAuthor(author);
product.setPublishing_com(publishing_com);
product.setPublisging_date(publishing_date);
product.setProduct_image(fileName); // 업로드한 파일의 실제 이름 ( 원본이름 아님 )
product.setProduct_content(product_content);
product.setDiscount_rate(discount_rate);

// System.out.println("product 객체: " + product);

// DB 연결, product 테이블에 상품 추가 처리
ProductDAO productDAO = ProductDAO.getInstance();
productDAO.updateProduct(product);
response.sendRedirect("productList.jsp?pageNum=" + pageNum);
%>


</body>
</html>