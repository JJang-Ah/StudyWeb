<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="manager.product.*, java.util.*"%>
<%-- 쇼핑몰 메인 페이지: 상품이 나열되는 페이지 --%>
<%-- 상품의 분류별 전체 보기 --%>
<style>
.t_kind { margin-top: 30px;}
/* 상품 분류 */
.d_kind1 { text-align: right; margin-bottom: 5px; margin-left: 20px;}
.d_kind1 .s_kind1 { display: inline-block; float: left;}
.d_kind1 .s_kind11 { font-size: 1.1em; color: navy;}
.d_kind1 .s_kind2 select { margin-right: 40px; width: 150px; height: 25px;}
.d_kind2 { margin-left: 20px; margin-bottom: 10px; clear: both;}


/* 상품 분류별 노출 */
.d_kind3 { text-align: center; float: left; font-size: 0.9em;}
.d_kind3 a { text-decoration: none; color: #000;}
.c_product { position: relative; display: inline-block; width: 250px; height: 350px; padding: 10px; margin: 10px; border: 1px solid gray;}
.c_product div { margin-bottom: 5px;}
.c_product .c_p2, .c_product .c_p4 { font-weight: bold;}
.c_product .c_p3 { font-size: 0.9em; color: #adb5bd;}
.c_product .c_p2, .c_product .c_p3 { white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
.c_product .c_p2:hover, .c_product .c_p3:hover { white-space: nowrap; overflow: visible; text-overflow: inherit;}
.c_product .s_p_discount { color: red;}

/* 상품 hover 효과 */
/* .c_product:hover .c_product { visible: visible; position: absolute; width: 250px; height: 350px; border: 1px solid gray;} */

/* hover 했을 때 화면 구성 */
.c_product figcaption {
  position: absolute;
  /* 이미지 위에 올라가야하기 때문에 position:absolute, top:0, left:0 */
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.8);
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


/* 하단 - 페이징 영역*/
#paging { text-align: center; margin-top: 20px;}
#paging a { color: #000;}
#pBox { display: inline-block; width: 22px; height: 22px; padding: 5px; margin: 5px;}
#pBox:hover { background: #f1617d; color: white; font-weight: bold; border-radius: 50%;}
.pBox_c { background: #f1617d; color: white; font-weight: 900; border-radius: 50%;}
.pBox_b { font-weight: 900;}

.main_end { margin: 50px 0 40px 0;}

</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	let product_kind = document.getElementById("product_kind");
	
	// 상품 분휴 선택에 대한 change 이벤트 처리
	product_kind.addEventListener("change", function(event) {
		// product_kind를 가지고 shopAll.jsp로 이동
		location = 'shopAll.jsp?product_kind=' + product_kind.value + '#t_kind';
		
	})
	
})
</script>
<%
request.setCharacterEncoding("utf-8");

DecimalFormat df = new DecimalFormat("###,###,###");
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


//################ 페이징(paging) 처리 
//페이징(paging) 처리를 위한 변수 선언
int pageSize = 12; // 1페이지에 12건의 게시글을 표시
String pageNum = request.getParameter("pageNum");
if(pageNum == null) pageNum = "1";

int currentPage = Integer.parseInt(pageNum); // 현재 페이지
int startRow = (currentPage -1) * pageSize + 1; // 현재 페이지의 첫번째 행
int endRow = currentPage * pageSize;    // 현재 페이지의 마지막 행

//################


ProductDAO productDAO = ProductDAO.getInstance();

// 분류별 상품에 대한 페이징 처리
List<ProductDTO> productList = productDAO.getProductList(startRow, pageSize, product_kind);
int cnt = productDAO.getProductCount(product_kind);


%>
<%-- 분류별 상품을 4개씩 3단으로 처리 --%>
<div class="t_kind">
	<div class="d_kind1">
		<span class="s_kind1"><b class="s_kind11"><%=product_kindName %></b> 분야 상품 목록</span>
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
	<div class="d_kind2">상품수: 총 <b class="s_kind21"><%=cnt %></b>건</div>
	<div class="d_kind3">
		<%for(ProductDTO product: productList) { %>
		<div class="c_product">		
			<a href="shopContent.jsp?product_id=<%=product.getProduct_id()%>">
				<div class="c_p1"><img src="../../../../images_ezenmall/<%=product.getProduct_image()%>" width="200" height="280"></div>
				<div class="c_p2"><span title="<%=product.getProduct_name()%>"><%=product.getProduct_name() %></span></div>
				<div class="c_p3"><span title="<%=product.getAuthor()%>"><%=product.getAuthor() %></span> | <span title="<%=product.getPublishing_com()%>"><%=product.getPublishing_com() %></span></div>
				<div class="c_p4"><span title="<%=product.getProduct_price()%>"><%=df.format(product.getProduct_price()) %>원</span>
				 | <span>(<span class="s_p_discount"><%=product.getDiscount_rate() %>%할인</span>)</span></div>
			</a>
			<figcaption>
				<a href="#"><div class="buy">구매</div></a>
				<a href="shopContent.jsp?product_id=<%=product.getProduct_id() %>"><div class="info">상세</div></a>	
			</figcaption>
			
		</div><% } %>
		
		 
	   <%-- 페이징 처리 --%>
	   <div id="paging">
	   <%
	   if(cnt > 0) {
	      // 전체 페이지수 계산
	      int pageCount = cnt / pageSize + (cnt%pageSize==0? 0 : 1);
	      int startPage = 1; //시작페이지 번호
	      int pageBlock = 3; //페이징의 개수 
	      
	      // 시작 페이지 설정
	      if(currentPage % 3 != 0) startPage = (currentPage/3)*3 +1;
	      else startPage = (currentPage/3 -1) * 3 +1;
	         
	      // 끝 페이지 설정
	      int endPage = startPage + pageBlock - 1;
	      if(endPage > pageCount) endPage = pageCount;
	      
	      // 맨처음 페이지 이동 처리
	      if(startPage > 3) {
	         out.print("<a href='shopAll.jsp?pageNum=1&product_kind="+product_kind+"'><div id='pBox' class='pBox_b' title='첫 페이지'>"+"〈〈"+"</div></a>");
	      }
	      
	      // 이전 페이지 처리
	      if(startPage > 3 ) {
	         out.print("<a href='shopAll.jsp?pageNum="+(currentPage-3)+"&product_kind="+product_kind+"'><div id='pBox' class='pBox_b' title='이전 3페이지'>"+"〈"+"</div></a>");
	      }
	      // 페이징 블럭 출력 처리
	      for(int i=startPage; i<=endPage; i++) {
	         if(currentPage == i) { // 선택된 페이지가 현재 페이지일 때
	            out.print("<div id='pBox' class='pBox_c'>"+i+"</div>");
	         } else {      // 선택된 페이지가 다른 페이지일 떄 -> 이동에 대한 링크 설정
	            out.print("<a href='shopAll.jsp?pageNum=" + i+"&product_kind="+product_kind +"'><div id='pBox'>" + i + "</div></a>");   
	         }
	      }
	      
	      // 다음 페이지 처리 
	      if(endPage < pageCount) {
	         int movePage = currentPage + 3;
	         if(movePage > pageCount) movePage=pageCount;
	         out.print("<a href='shopAll.jsp?pageNum="+movePage+"&product_kind="+product_kind+"'><div id='pBox' class='pBox_b' title='다음 3페이지'>"+"〉"+"</div></a>");
	      }
	      
	      // 맨 끝 페이지 이동처리
	      if(endPage < pageCount) {
	         out.print("<a href='shopAll.jsp?pageNum="+pageCount+"&product_kind="+product_kind+"'><div id='pBox' class='pBox_b' title='끝 페이지'>"+"〉〉"+"</div></a>");
	      }
	   }
	   %>
	   </div>
   
	</div>
</div>

