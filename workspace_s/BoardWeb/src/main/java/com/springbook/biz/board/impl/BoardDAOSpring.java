package com.springbook.biz.board.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.springbook.biz.board.BoardDTO;

// spring에서 제공하는  DB연결, 질의 클래스
// @Repository("boardDAO")
public class BoardDAOSpring extends JdbcDaoSupport {
		
		// SQL문
		private final String BOARD_INSERT = "insert into board(seq, title, writer, content) values(board_seq.nextval, ?, ?, ?)";
		private final String BOARD_LIST = "select * from board order by seq desc";
		private final String BOARD_GET = "select * from board where seq = ?";
		private final String BOARD_UPDATE = "update board set title=?, content=? where seq=?";
		private final String BOARD_DELETE = "delete board where seq=? ";
	
		@Autowired
		// JDBC에서 dataSource와 같음
		public void setSuperDataSource(DataSource dataSource) {
			super.setDataSource(dataSource);
		}
		
		// 글등록
		public void insertBoard(BoardDTO dto) {
			System.out.println("=> Spring JDBC로 insertBoard() 실행");
			// preparestatement에서 insert하는 방법과 같은 의미
			this.getJdbcTemplate().update(BOARD_INSERT, dto.getTitle(), dto.getWriter());
		
		}
			
		// 글수정
		public void updateBoard(BoardDTO dto) {
			System.out.println("=> Spring JDBC로 updateBoard() 실행");
			// preparestatement에서 update하는 방법과 같은 의미
			this.getJdbcTemplate().update(BOARD_UPDATE, dto.getTitle(), dto.getContent(), dto.getSeq());
		}
		
		// 글삭제
		public void deleteBoard(BoardDTO dto) {
			System.out.println("=> Spring JDBC로 deleteBoard() 실행");
			// preparestatement에서 delete하는 방법과 같은 의미
			this.getJdbcTemplate().update(BOARD_DELETE, dto.getSeq());
			
		}
		
		// 글전체 보기
		public List<BoardDTO> getBoardList() {
			System.out.println("=> Spring JDBC로 getBoardList() 실행");
			// List<BoardDTO> boardList = new ArrayList<BoardDTO>();	
			return this.getJdbcTemplate().query(BOARD_LIST, new BoardRowMapper());
		}
			
		// 글상세 보기(1건)
		public BoardDTO getBoard(BoardDTO dto) {
			System.out.println("=> Spring JDBC로 getBoard() 실행");	
			Object[] args = { dto.getSeq() };
			return this.getJdbcTemplate().queryForObject(BOARD_GET, args, new BoardRowMapper());
		}
		
		// RowMapper 클래스 생성- 리턴값을 자바객체와 맵핑하는 클래스
		private class BoardRowMapper implements RowMapper<BoardDTO> {
			@Override
			public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardDTO board = new BoardDTO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regdate"));
				board.setCnt(rs.getInt("cnt"));
				return board;
			}
			
		}
				
		
}
