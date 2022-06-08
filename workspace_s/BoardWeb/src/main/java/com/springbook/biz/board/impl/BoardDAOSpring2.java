package com.springbook.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.common.JDBCUtil;

// spring���� �����ϴ� DB ����, ���� Ŭ����
//@Repository("boardDAO")
public class BoardDAOSpring2 extends JdbcDaoSupport{

	//SQL�� 
	private final String BOARD_INSERT = "insert into board(seq, title, writer, content) values(board_seq.nextval,?,?,?)";
	private final String BOARD_LIST = "select * from board order by seq desc";
	private final String BOARD_GET = "select * from board where seq=?";
	private final String BOARD_UPDATE = "=update board set title=?, content=? where weq=? ";
	private final String BOARD_DELETE = "delete board where seq=?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// �۵��

	public void insertBoard(BoardDTO dto) {
		System.out.println("=> Spring JDBC2�� insertBoard() ����");
		jdbcTemplate.update(BOARD_INSERT, dto.getTitle(), dto.getWriter(), dto.getContent());
	}
	// �ۼ���
	public void updateBoard(BoardDTO dto) {
		System.out.println("=> Spring JDBC2�� updateBoard() ����");
		jdbcTemplate.update(BOARD_UPDATE, dto.getTitle(), dto.getContent(), dto.getSeq());
	}
	
	
	// �ۻ���
	public void deleteBoard(BoardDTO dto) {
		System.out.println("=> Spring JDBC2�� deleteBoard() ����");
		jdbcTemplate.update(BOARD_DELETE, dto.getSeq());
	}
	// ����ü ����
	public List<BoardDTO> getBoardList() {
		System.out.println("=> Spring JDBC2�� getBoardList() ����");
		return jdbcTemplate.query(BOARD_LIST, new BoardRowMapper());
	}
	
	// �ۻ� ����(1��)
	public BoardDTO getBoard(BoardDTO dto) {
		System.out.println("=> Spring JDBC2�� getBoard() ����");
		Object[] args = {dto.getSeq()};
		return jdbcTemplate.queryForObject(BOARD_GET, args, new BoardRowMapper());
	}
	
	// RowMapper Ŭ���� ���� - ���ϰ��� �ڹٰ�ü�� �����ϴ� Ŭ����
	private class BoardRowMapper implements RowMapper<BoardDTO>{

		@Override
		public BoardDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardDTO board = new BoardDTO();
			board.setSeq(rs.getInt("seq"));
			board.setTitle(rs.getString("title"));
			board.setWriter(rs.getString("writer"));
			board.setContent(rs.getString("content"));
			board.setRegdate(rs.getTimestamp("regdate"));
			board.setCnt(rs.getInt("cnt"));
			
			return board;
		}
				
	}
	
}
