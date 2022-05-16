<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 전체보기</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hammersmith+One&family=Paytone+One&display=swap');
#container { width: 1000px; margin: 0 auto;}
a { text-decoration: none; color: black;}
/* 상단 - 메인, 서브 타이틀 */
.m_title { font-family:'Paytone One', sans-serif; font-size: 3em; text-align: center;}
.s_title { font-family:'Do Hyeon', sans-serif; font-size: 2em; text-align: center; margin-bottom: 20px}
.top_info { text-align: right;}
.s_cnt { float: left; font-weight: bold;}
.s_id, .s_logout, .s_write { font-weight: bold; clear: both;}
.s_logout a { color: #c84557;}
.s_write a { color: #1e94be;}

/* 중단 - 게시판 전체 테이블 */
table { width: 100%; border: 1px solid black; border-collapse: collapse;}
tr { height: 40px;}
th, td { border: 1px solid black;}
th { background: #ced4da;}
td { }
tr:nth-child(2n+1) { background-color: #f8f9fa;}
.center { text-align: center;}
.left { padding-left: 5px;}
.left a:hover { font-weight: bold; color: #32708d;}
.no_board { text-align: center; font-weight: bold;}

/* 하단 - 페이징 영역*/
#paging { text-align: center; margin-top: 20px;}
#pBox { display: inline-block; width: 22px; height: 22px; padding: 5px; margin: 5px;}
#pBox:hover { background: #495057; color: white; font-weight: bold; border-radius: 10px;}
.pBox_c { background: #495057; color: white; font-weight: bold; border-radius: 10px;}
.pBox_b { font-weight: 900;}
</style>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");

String memberId = (String)session.getAttribute("memberId");
if(memberId == null) { // 세션이 null인 경우
	out.print("<script>location='../logon/memberLoginForm.jsp'</script>");
}

// 날짜 형식 클래스
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

// ################ 페이징(paging) 처리 
// 페이징(paging) 처리를 위한 변수 선언
int pageSize = 10; // 1페이지에 10건의 게시글을 표시
String pageNum = request.getParameter("pageNum");
if(pageNum == null) pageNum = "1";

int currentPage = Integer.parseInt(pageNum); // 현재 페이지
int startRow = (currentPage -1) * pageSize + 1; // 현재 페이지의 첫번째 행
int endRow = currentPage * pageSize; 	// 현재 페이지의 마지막 행

// ################

// BoardDAO 클래스 연결
BoardDAO boardDAO = BoardDAO.getInstance();
// 전체글수
int cnt = boardDAO.getBoardCount();
// 게시판 전체 정보를 currentPage의 pageSize 크기만큼 획득
List<BoardDTO> boardList = boardDAO.getBoardList(startRow, pageSize);

// 매 페이지마다 전체 글수에 대한 역순 번호
int number = cnt - ((currentPage-1) * pageSize); 

%>
<div id="container">

	<div class="m_title"><a href="boardList.jsp">Crush 팬 카페</a></div>
	<div class="s_title">전체 게시판</div> <br>
	<div class="top_info">
		<span class="s_cnt">전체글수: <%=cnt %> </span>&ensp;&ensp;
		<span class="s_id"><a href="../member/memberInfoForm.jsp"><%=memberId %>님</a></span>
		&ensp; | &ensp;<span class="s_logout"><a href="../logon/memberLogout.jsp">로그아웃</a></span>
		&ensp; | &ensp;<span class="s_write"><a href="boardWriteForm.jsp">글등록</a></span>
	</div> <br>
	
	<table>
		<tr>
			<th width="8%">번호</th>
			<th width="50%">제목</th>
			<th width="14%">작성자</th>
			<th width="20%">작성일</th>
			<th width="8%">조회수</th>
		</tr>
		<% if(cnt == 0) { %>
			<tr><td colspan="5" class="no_board">등록된 글이 없습니다.</td></tr>
		<%} else {
			for(BoardDTO board : boardList) {
				int num = board.getNum();
			%>
			<tr>
				<td class="center"><%=number-- %></td>
				<td class="left">
					<%
					int width = 0;
					if(board.getRe_level() > 0) { // 댓글이라면
						width = board.getRe_level() * 10;
						out.print("<img src='../images/level.png' width='" + width + "' height='16'>");
						out.print("<img src='../images/re.png' width='16' height='16'>");
					%>
					<%}%>
					<a href="boardContent.jsp?num=<%=num%>&pageNum=<%=pageNum%>"><%=board.getSubject()%></a>
					<%
					if(board.getReadcount() > 10) {
						out.print("<img src='../images/hot.png' width='16' height='16'>");
					}
					%>
				</td>
				<td class="center"><%=board.getWriter() %></td>
				<td class="center"><%=sdf.format(board.getRegDate()) %></td>
				<td class="center"><%=board.getReadcount() %></td>
			</tr>
		<%} } %>
	</table>
	<%-- 페이징 처리 --%>
	<div id="paging">
	<%
	if(cnt > 0) {
		// 전체 페이지수 계산
		int pageCount = cnt / pageSize + (cnt%pageSize==0? 0 : 1);
		int startPage = 1; //시작페이지 번호
		int pageBlock = 10; //페이징의 개수 
		
		// 시작 페이지 설정
		if(currentPage % 10 != 0) startPage = (currentPage/10)*10 +1;
		else startPage = (currentPage/10 -1) * 10 +1;
			
		// 끝 페이지 설정
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		// 맨처음 페이지 이동 처리
		if(startPage > 10) {
			out.print("<a href='boardList.jsp?pageNum=1'><div id='pBox' class='pBox_b' title='첫 페이지'>" + "〈〈" + "</div></a>");
		}
		
		// 이전 페이지 처리
		if(startPage > 10 ) {
			out.print("<a href='boardList.jsp?pageNum=" + (currentPage-10) + "'><div id='pBox' class='pBox_b' title='이전 10페이지'>" + "〈" + "</div></a>");
		}
		// 페이징 블럭 출력 처리
		for(int i=startPage; i<=endPage; i++) {
			if(currentPage == i) { // 선택된 페이지가 현재 페이지일 때
				out.print("<div id='pBox' class='pBox_c'>" + i + "</div>");
			} else {		// 선택된 페이지가 다른 페이지일 떄 -> 이동에 대한 링크 설정
				out.print("<a href='boardList.jsp?pageNum=" + i + "'><div id='pBox'>" + i + "</div></a>");	
			}
		}
		
		// 다음 페이지 처리 
		if(endPage < pageCount) {
			int movePage = currentPage + 10;
			if(movePage > pageCount) movePage=pageCount;
			out.print("<a href='boardList.jsp?pageNum=" + movePage + "'><div id='pBox' class='pBox_b' title='다음 10페이지'>" + "〉" + "</div></a>");
		}
		
		// 맨 끝 페이지 이동처리
		if(endPage < pageCount) {
			out.print("<a href='boardList.jsp?pageNum=" + pageCount + "'><div id='pBox' class='pBox_b' title='끝 페이지'>" + "〉〉" + "</div></a>");
		}
	}
	%>
	</div>
	
</div>
</body>
</html>