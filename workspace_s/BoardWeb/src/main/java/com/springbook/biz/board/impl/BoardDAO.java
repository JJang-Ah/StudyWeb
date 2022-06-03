package com.springbook.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.common.JDBCUtil;

@Component("boardDAO")
public class BoardDAO {

	// DB ���� ��ü, ���� ��ü
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//SQL�� 
	private final String BOARD_INSERT = "insert into board(seq, title, writer, content) values(board_seq.nextval,?,?,?)";
	private final String BOARD_LIST = "select * from board order by seq desc";
	private final String BOARD_GET = "select * from board where seq=?";
	private final String BOARD_UPDATE = "=update board set title=?, content=? where weq=? ";
	private final String BOARD_DELETE = "delete board where seq=?";
	// �۵��
	public void insertBoard(BoardDTO dto) {
		System.out.println("=> JDBC�� insertBoard() ����");
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(BOARD_INSERT);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	// ����ü ����
	public List<BoardDTO> getBoardList() {
		System.out.println("=> JDBC�� getBoardList() ����");

		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(BOARD_LIST);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getTimestamp("regdate"));
				board.setCnt(rs.getInt("cnt"));
				boardList.add(board);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	// �ۻ� ����(1��)
	public BoardDTO getBoard(BoardDTO dto) {
		System.out.println("=> JDBC�� getBoard() ����");

		BoardDTO board = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(BOARD_GET);
			pstmt.setInt(1, dto.getSeq());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board = new BoardDTO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getTimestamp("regdate"));
				board.setCnt(rs.getInt("cnt"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return board;
	}
	// �ۼ���
	public void updateBoard(BoardDTO dto) {
		System.out.println("=> JDBC�� updateBoard() ����");

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(BOARD_UPDATE);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getSeq());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	
	// �ۻ���
	public void deleteBoard(BoardDTO dto) {
		System.out.println("=> JDBC�� deleteBoard() ����");

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(BOARD_DELETE);
			pstmt.setInt(1, dto.getSeq());
			pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}
