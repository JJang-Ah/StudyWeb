<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.member.*, mall.cart.*, mall.bank.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 확인폼</title>
<style>
.container { width:1200px; margin: 0 auto; }
/* 중단 - 구매정보 확인 (장바구니 또는 상품상세) */
.d3 .t1 { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; font-size: 0.9em; }
.d3 .t1 tr { height: 40px; }
.d3 .t1 td { padding: 7px 0; }
.d3 .t1 td { padding-left: 10px; border-top: 1px solid gray; }
.d3 .t1 th { padding-right: 45px; border-top: 1px solid gray;}
.d3 .t1 td:nth-child(1) { padding-left: 10px; }
.d3 .t1 td:nth-child(2) { padding-left: 30px; }
.d3 .t1 input[type=number] { width:60px; }
/* number 화살표 항상 보이는 효과*/
.d3 input[type="number"]::-webkit-inner-spin-button, 
.d3 input[type="number"]::-webkit-outer-spin-button { -webkit-appearance:"Always Show Up/Down Arrows"; opacity: 1; }
.d3 .s1 { color:#ee252d; font-weight: bold; font-size: 1.1em; margin-bottom: 10px; display: inline-block; }
.d3 a {text-decoration: none; color: #adb5db; }
.d3 .s2 { color:#2e751b; font-size: 1.05em; }
.d3 .s3 { color:#1e94be; font-weight: bold; }
.d3 .s4 { color:#ee561e; font-weight: bold; }
.d3 .s6 { color:#ea97b7; font-weight: bold; }
/* 중단 - d4, 총 구매정보 */
.d4 { margin-top: 20px;}
.d4 .t2 { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; font-size: 0.9em; }
.d4 .t2 tr { height:50px; }
.d4 .t2 td { padding: 7px 0; }
.d4 .t2 th { background: #e15f56; font-size: 1.1em; color: #fff; text-shadow: 1px 1px 1px gray; }
.d4 .t2 td { text-align: center; background: #f7f8f6; }
.d4 .s1 { color: #c84557; font-size: 1.1em; font-weight: bold; }
.d4 .s2 { color: #32708d; font-size: 1.1em; font-weight: bold; }
.d4 .s3 { color: #99424f; font-size: 1.1em; font-weight: bold; }
/* 중단 - d5, 배송정보 */
.d5 { margin-top: 20px;}
.d5 .t3 { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; font-size: 0.9em; }
.d5 .t3 tr { height: 60px; }
.d5 .t3 td { padding: 7px 0; }
.d5 .t3 th:nth-child(1) { background: #e15f56; font-size: 1.1em; color: #fff; text-shadow: 1px 1px 1px gray; }
.d5 .t3 td { text-align:left ; background: #f7f8f6; padding-left: 20px;}
.d5 .d3 input { margin: 5px 0; height: 20px; }
.d5 .t3 .add1, .d5 .t3 .add2 { width: 400px; }
.d5 .t3 span { color: #707fa0; font-weight: bold; margin-right: 20px; }
.d5 .t3 #btn_address { background: #63647f; border: 1px solid #63647f; color: #fff; border-radius: 3px; width: 100px; 
height: 30px; font-size: 0.95em; }
/* 중단 - d6, 주문자 정보 */
.d6 { margin-top: 20px;}
.d6 .t4 { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; font-size: 0.9em; }
.d6 .t4 tr { height: 60px; }
.d6 .t4 td { padding: 7px 0; }
.d6 .t4 th:nth-of-type(1) { background: #705e7b; font-size: 1.1em; color: #fff; text-shadow: 1px 1px 1px gray; }
.d6 .t4 td { text-align:left ; background: #f7f8f6; padding-left: 20px;}
.d6 .d3 input { margin: 5px 0; height: 20px; }
.d6 .t4 .add1, .d6 .t4 .add2 { width: 500px; }
.d6 .t4 span { color: #707fa0; font-weight: bold; margin-right: 20px; }
.d6 .t4 #btn_address { background: #63647f; border: 1px solid #63647f; color: #fff; border-radius: 3px; width: 100px; 
height: 30px; font-size: 0.95em; }
.d6 .account { width: 250px; height: 25px;}
#btn_delete_bank, #btn_regist_bank { width: 80px; height: 25px; color: #fff;}
#btn_delete_bank { background: #c84557; border: 1px solid #c84557; margin-left: 60px;}
#btn_regist_bank { background: #2f9e77; border: 1px solid #2f9e77;}


/* 중단 - d7, 최종결제 버튼 */
.d7 { margin-top: 20px;}
.d7 .t5 { width: 90%; border: 1px solid gray; border-collapse: collapse; margin: 0 auto; font-size: 0.9em; }
.d7 .t5 tr { height:60px; }
.d7 .t5 td { padding: 7px 0; }
.d7 .t5 th:nth-of-type(1) { background: #e15f56; font-size: 1.1em; color: #fff; text-shadow: 1px 1px 1px gray; }
.d7 .s1 { color: #c84557; font-size: 1.1em; font-weight: bold; }
.d7 .s2 { color: #32708d; font-size: 1.1em; font-weight: bold; }
.d7 .s3 { color: #99424f; font-size: 1.1em; font-weight: bold; }
.d7 .t5 #btn_buy { background: #a9ce7d; border:none; color: #fff; border-radius: 3px; width: 150px; 
height: 50px; font-size: 1.15em; }
.d7 .t5 #btn_buy:hover { background: #eb78cd; cursor: pointer; }
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script>
	document.addEventListener("DOMContentLoaded", function() {
		let form = document.buyForm;
		let cart_id = form.cart_id.value;
		// 구매 수량 제한 효과 (1~100)	
 		let buy_counts = document.querySelectorAll(".buy_count");
		for(let buy_count of buy_counts) {
			buy_count.addEventListener("keyup", function() {
				if(buy_count.value < 1) {
					buy_count.value = 1;
				} else if(buy_count.value > 100){
					buy_count.value = 100;
				} 
			});
		} 
	
		
		// 주소 찾기 버튼 - 다음 라이브러리 활용
		let btn_address = document.getElementById("btn_address");
		btn_address.addEventListener("click", function() {
			new daum.Postcode({
				oncomplete:function(data) {
					form.delivery_address1.value = data.address;
				}
			}).open();
		})
		
		// 카드 삭제 버튼
		let card_id = document.getElementById("cart_id");
		let btn_delete_bank = document.getElementById("btn_delete_bank");
		btn_delete_bank.addEventListener("click", function() {
			let account = document.querySelector(".account").options[account.selectedIndex].value;
			let value = account.options[account.selectedIndex].value;
			let card_no = value.substring(0, 19);
			account.remove(account.selectedIndex);
			location = "../bank/bankDeletePro.jsp?cart_id=" + card_id+ "&card_no=" + card_no;
			
		})
		
		// 카드 등록 버튼
		let btn_regist_bank = document.getElementById("btn_regist_bank");
		let cart_no = document.querySelector(".card_no").value;
		let cart_com = document.querySelector(".card_com").value;
		let member_id = document.querySelector(".member_id").value;
		let member_name = document.querySelector(".member_name").value;
		btn_regist_bank.addEventListener("click", function() {
			location = "../bank/bankInsertPro.jsp?cart_id="+cart_id+"&card_no="+card_no+"&card_com="+card_com+"&member_id="+member_id;
		})
		
		// 최종 결제 버튼
		
	});
</script>
</head>
<body>
<%
// buyForm.jsp -> 구매정보 확인폼(구매 여부를 결정하는 폼), buyList.jsp -> 구매 목록 폼(최종 구매 확인 폼)
request.setCharacterEncoding("utf-8");
DecimalFormat df = new DecimalFormat("#,###,###");

String memberId = (String)session.getAttribute("memberId");
if(memberId == null) {
	out.print("<script>alert('로그인을 해주세요.'); location='../logon/memberLoginForm.jsp';");
	out.print("</script>");
	return;
} 

// 2. shopMain.jsp, shopContent.jsp에서 buyForm.jsp로 넘어오는 경우
// - product_id 를 확인하여 처리


// 1. cartList.jsp에서 buyForm.jsp로 넘어오는 경우
// - cart_id를 확인, 배열로 저장 -> 리스트로 저장
String cart_id_str = request.getParameter("cart_id");
String[] cart_id_arr = cart_id_str.split(",");
List<Integer> cart_id_list = new ArrayList<Integer>();
for(String c : cart_id_arr) {
	cart_id_list.add(Integer.parseInt(c));
}
//회원 DB 연결, 질의 -> 주소 정보 활용
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO member = memberDAO.getMember(memberId); // 멤버아이디 정보 확인
String address = member.getAddress();
String local = address.substring(0, 2); // ex) 서울, 주소에 첫번째에서 두번째 자리의 문자열을 가져옴; 

//카트 아이디 확인
/* System.out.println("카트:" + Arrays.toString(cart_id_arr));
System.out.println("카트 리스트:" + cart_id_list); */

//Cart DB 연동 - cartList에서 넘어오는 정보 받기 -> 1개 또는 여러개(전체)
CartDAO cartDAO = CartDAO.getInstance();
List<CartDTO> cartList = cartDAO.getCartList(cart_id_list);

//cartList 확인
/*
for(CartDTO c : cartList) {
	System.out.println(c);
}
*/
//장바구니 상품 종류 개수
int cartListCount = cartDAO.getCartListCount(memberId);

//Bank DB 연동, 은행 계좌 정보 확인
BankDAO bankDAO = BankDAO.getInstance();
List<BankDTO> bankList = bankDAO.getBankList(memberId);



//배송 날짜 계산과 포맷
//규칙1. 서울: 다음날 배송, 경기: 2일안에 배송, 지방: 3일 안에 배송, 제주도 지역: 5일만에 배송
//규칙2. 토요일, 일요일은 제외.
//현재 날짜의 시간, 주소 판단, 요일 판단
//월화수목금 /토일
int d = 0; // 날짜 더하는 변수
Calendar c = Calendar.getInstance();	// 현재시간을 가져오는 Calendar 인스턴스 생성
int week = c.get(Calendar.DAY_OF_WEEK); // 일~토요일(1~7)까지 현재 요일을 해당하는 숫자로 표현   

switch(local) {
case "서울" : 
	if(week >=2 && week <= 5) ++d;
	else if(week == 6 || week == 7) d += 3;
	else if(week == 1) d += 2;
	break;
case "경기" : 
	if(week >=2 && week <=4) d += 2; 
	else if(week >= 5 && week <=7) d += 4;
	else if(week == 1) d += 3;
	break;
case "제주" :
	d +=7;
	break;
default : // 지방
	if(week == 2 || week == 3) d +=3;
	else if(week >=4 && week <=5) d +=5;
	else if(week == 1) d +=4;
	break;
}

//추가된 일수를 더한 날짜
c.add(Calendar.DATE, d); 
int month = c.get(Calendar.MONTH); // 1월~12월(0~11)까지 현재 월을 해당하는 숫자로 표현
int date = c.get(Calendar.DATE);
int w = c.get(Calendar.DAY_OF_WEEK); // 1~7로 표현
String[] weekday = { "" ,"일", "월", "화", "수", "목", "금", "토" }; // Calendar 라이브러리를 사용하기 위한 배열 선언

//배송일 확인
String d_day = month+1 + "월 "+ date + "일 "+"("+ weekday[w]+ ")";

// 총 상품 금액, 총 할인금액, 총 구매금액, 구매 상품 종류, 구매 상품 개수
int tot1 = 0, tot2 = 0, tot3 = 0, cnt1 = 0, cnt2 = 0;

%>

<div class="container">	
	<jsp:include page="../common/shopTop.jsp"></jsp:include>
	<div class="buy_form">
		<div class="d1">
			<span class="s1">EZENMALL 배송</span>
			<span class="s2">당일/하루/일반 배송</span>
			<span class="s3">아침배송</span>		
		</div>
		<hr class="d_line">
		<form action="buyList.jsp" method="post" name="buyForm">
		<!-- cart_id, buy_count, account, delivery_name, delivery_tel, delivery_address -->
		<input type="hidden" name="cart_id" id="cart_id" value="<%=cart_id_str%>">
		
		<div class="d3"> <!-- 카트 정보 -->
			<table class="t1">
				<tr>
					<th colspan="2">상품 정보</th>
					<th>정가</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
					<th>배송일</th>
				</tr>
				<%for(CartDTO cart : cartList) { 
					int p_sum1 = cart.getProduct_price() * cart.getBuy_count(); // 정가금액
					int p_sum3 = cart.getBuy_price() * cart.getBuy_count(); 	// 판매가 합계 금액
					int p_sum2 = p_sum1 - p_sum3; // 할인 합계 금액
					tot1 += p_sum1;
					tot2 += p_sum2;
					tot3 += p_sum3;
					++cnt1;
					cnt2 += cart.getBuy_count();
 				%>
				<tr>
					<td width="10%">
						<a href="../shopping/shopContent.jsp?product_id=<%=cart.getProduct_id()%>"><img src="/images_ezenmall/<%=cart.getProduct_image()%>" width="60" height="90"></a>
					</td>
					<td width="40%">
						<span class="s1"><a href="../shopping/shopContent.jsp?product_id=<%=cart.getProduct_id()%>"><%=cart.getProduct_name() %></a></span><br>
						<span class="s2"><%=cart.getAuthor() %> | <%=cart.getPublishing_com() %></span>
					</td>
					<td width="10%"><span class="s3"><%=df.format(cart.getProduct_price()) %>원</span></td>
					<td width="10%"><span class="s4"><%=df.format(cart.getBuy_price()) %>원</span></td>
					<td width="10%"><span class="s5"><input type="number" name="buy_count" class="buy_count" value="<%=cart.getBuy_count() %>" max="100" min="1"></span></td>
					<td width="10%"><span class="s6"><%=df.format(p_sum3) %>원</span></td>
					<td width="10%"><span class="s7"><%=d_day%></span></td>
				</tr>
				<%} %>
			</table>
		</div>
		<div class="d4"> <!-- 구매 총 정보 -->
			<table class="t2">
				<tr>
					<th width="33.3%">총 상품금액</th>
					<th width="33.4%">총 할인금액</th>
					<th width="33.3%">총 구매금액</th>
				</tr>
				<tr>
					<td><span class="s1"><%=df.format(tot1) %></span></td>
					<td><span class="s2"><%=df.format(tot2) %></span></td>
					<td><span class="s3"><%=df.format(tot3) %></span></td>
				</tr>
				<tr>
					<td colspan="3">
						<span class="s4"> 구매 상품 종류: <%=cnt1 %>종</span> &ensp;|&ensp; <span class="s5">구매 상품 개수: <%=cnt2 %>개</span>
					</td>					
				</tr>
			
			</table>
		</div>
		<div class="d5"> <!-- 배송지 정보 : 변경 가능하도록 -->
			<table class="t3">
				<tr><th colspan="2">배송 정보</th></tr>
				<tr>
					<th width="20%">수령인</th>
					<td width="80%"><input type="text" name="delivery_name" value="<%=member.getName()%>"></td>
				</tr>
				<tr>
					<th>배송지 연락처</th>
					<td><input type="text" name="delivery_tel" value="<%=member.getTel()%>"></td>
				</tr>
				<tr>
					<th>배송지 주소</th>
					<td>
						<input type="button" value="주소 찾기" id="btn_address"><br>
						<span>기본 주소 </span><input type="text" name="delivery_address1" class="add1" placeholder="주소 찾기 버튼을 클릭하여 검색하시오."><br>
						<span>상세 주소  </span><input type="text" name="delivery_address2" class="add2" placeholder="상세 찾기는 직접 입력하시오.">
					</td>
				</tr>
			</table>
		</div>
		<div class="d6"> <!-- 주문자 정보 : 결제 정보 포함 -->
			<table class="t4">
				<tr><th colspan="2">주문자 정보</th></tr>
				<tr>
					<th width="20%">주문자 이름</th>
					<td width="80%" colspan="2"><%=member.getName() %></td>
				</tr>
				<tr>
					<th>주문자 연락처</th>
					<td colspan="2"><span><%=member.getTel()%></span></td>
				</tr>
				<tr>
					<th>주문자 주소</th>
					<td colspan="2"><span><%=member.getAddress() %></span></td>
				</tr>
				<tr>
					<th>결제 카드</th>
					<td width="28%">
						<select name="account" class="account">
						<%if(bankList.size() == 0)  {%>
							<option value="0">등록 카드 없음</option>	
						<%} else { 
						for(BankDTO bank : bankList) { 
							String account = bank.getCard_no() + " " + bank.getCard_com();
						%>
							<option value="<%=account%>"><%=account %></option>
						<%} } %>
						</select>
					</td>
					<td>
						<input type="button" value="카드 삭제" id="btn_delete_bank">
						<input type="button" value="카드 등록" id="btn_regist_bank">
					</td>
				</tr>
				<tr class="tr_card">
					<th>카드 등록</th>
					<td colspan="2">
						<input type="hidden" class="member_id" value="<%=member.getId() %>">
						<input type="hidden" class="member_name" value="<%=member.getName() %>">
						<input type="text" class="card_no" placeholder="카드번호 입력">
						<input type="text" class="card_com" placeholder="발행은행 입력">
						<input type="button" value="카드 등록" id="btn_regist_bank">
					</td>
				</tr>
			</table>
		</div>
		<div class="d7"> <!-- 결제  -->
			<table class="t5">
				<tr>
					<th>상품 도착 예정일</th>
					<th>총 구매 금액</th>
					<th>결제</th>
				</tr>
				<tr>
					<th><span><%=d_day %></span></th>
					<th><span><%=df.format(tot3) %></span></th>
					<th><input type="button" value="최종결제" id="btn_buy"></th>
				</tr>
			</table>
		</div>
		</form>
	</div>
	<hr>
	<jsp:include page="../common/shopBottom.jsp"></jsp:include>
</div>

</body>
</html>