package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;

// DAO, Data Access Object, DBBean
public class BoardDAO {

	// 싱글톤
	// 디폴트생성자를 private로 막음 - 외부에서 new로 못만듦
	private BoardDAO() { }
	private static BoardDAO boardDAO = new BoardDAO();	
	public static BoardDAO getInstance( ) {
		return boardDAO;
	}
	
	// DB 연결, 질의에 사용할 객체 선언
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 게시판 글 등록 메소드 (원글)
	public void insertBoard(BoardDTO board) { // 리턴 타입 없음
		// 작업1 : board에서 가장 큰 글의 번호를 구함 -> 이 번호로 그룹화 할 아이디 값을 결정한다.
		String sql1 = "SELECT MAX(num) FROM board";
		// 작업2 : 같은 그룹의 아이디(ref)이고, 글 순서(re_step)가  크다면 글순서(re_step)을 1증가함.
		String sql2 = "UPDATE board SET re_step = re_step+1 WHERE ref =? AND re_step > ?";
		// 작업3 : 최종으로 원글 또는 댓글을 추가한다.
		String sql3 = "INSERT INTO board(writer, subject, content, ref, re_step, re_level) VALUES(?,?,?,?,?,?)";
		
		int num = board.getNum();
		int ref = board.getRef();
		int re_step = board.getRe_step();
		int re_level = board.getRe_level();
		int number = 0;
		
		try {
		 	conn = JDBCUtil.getConnection();
		    
		 	// 작업1 - 글 번호의 최댓값 획득
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			if (rs.next()) 
				number = rs.getInt(1) + 1; // 최대값이 있다면 최대값+1 
			else number = 1;               // 최대값이 없다면 1로 설정
			
			// 작업2 - 댓글과 원글에 대한 처리
			// 댓글이라면 댓글 그룹, 댓글순서, 댓글 깊이를 수정
			if (num != 0) { 
				// 댓글이라면
				// 작업2 - 댓글에 대한 처리 
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step += 1;
				re_level += 1;
			} else { 
				// 댓글이 아니라면 -> 원글이라면
				ref = number;
				re_step = 0;
				re_level = 0;
			}
	
			// 작업3 - 글 등록 처리
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, re_step);
			pstmt.setInt(6, re_level);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 게시판 글보기(전체) 메소드
	// 변경 -> boardList.jsp 페이지에서 한 페이지 당 10건의 데이터를 출력하도록 함.
	public List<BoardDTO> getBoardList(int start, int size) {
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		BoardDTO board = null;
		String sql = "SELECT * FROM board ORDER BY ref DESC, re_step asc limit ?, ?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start-1); // limit는 0번부터 시작하므로 1을 빼줌.
			pstmt.setInt(2, size);	// size는 개수(크기)
			rs = pstmt.executeQuery();
			
			// 1단계: 글번호, 제목, 작성자, 작성일, 조회수의 5가지 정보를 BoardDTO에 저장
			// 2단계: board를 boardList에 저장
			while(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setRegDate(rs.getTimestamp("regDate"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				boardList.add(board);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	// 글(1건) 상세 보기 메소드
	public BoardDTO getBoard(int num) {
		BoardDTO board = new BoardDTO();
		
		String sql1 = "UPDATE board SET readcount=readcount+1 WHERE num = ?"; // 조회수 증가 쿼리
		String sql2 = "SELECT * FROM board WHERE num = ?"; 
		
		try {
			conn = JDBCUtil.getConnection();
			
			// 조회수 증가
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			// 글 상세보기
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regDate"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));	
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return board;
	}
	
	// 게시판 글수정 폼에서 글보기 메소드
	public BoardDTO getBoardUpdateForm(int num) {
		BoardDTO board = new BoardDTO();
		String sql = "SELECT * FROM board WHERE num = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 글 수정 폼에서 수정하는 2가지 정보
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
			}
			 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return board;	
	}
	
	// 게시판 글수정 메소드
	public void updateBoard(BoardDTO board) {
		String sql = "update board SET subject=?, content=? where num = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNum());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 게시판 글삭제 메소드
	public int deleteBoard(int num, String writer, String pwd) throws Exception{
		String sql1 = "SELECT pwd FROM member WHERE id = ?";
		String sql2 = "DELETE FROM board WHERE num = ?";
		int cnt = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			
			// member 테이블에서 writer 에 해당하는 dbPwd를 구함
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			
			// pwd와 dbPwd가 일치할 때 num에 해당하는 글을 삭제
			if (rs.next()) {
				// 아이디가 있을 때 실행문
				String dbPwd = rs.getString("pwd");
				
				if(pwd.contentEquals(dbPwd)) {
					// 비밀번호도 일치한다면 삭제
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, num);
					cnt = pstmt.executeUpdate();
				}
			} 		
		} catch(Exception e) {
			// 트랜잭션 처리시에 예외가 발생했을 때 롤백
			conn.rollback();
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return cnt;
	}
	
	// 전체 글수 획득 
	public int getBoardCount() {
		String sql = "select count(*) from board";
		int cnt = 0;
		try {
			conn=JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return cnt;
	}
}
