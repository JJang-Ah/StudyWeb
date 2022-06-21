package com.springbook.biz.board.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.RowMapper;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.util.SqlSessionFactoryBean;

public class BoardDAOMybatis {

	private SqlSession mybatis;
	
	public BoardDAOMybatis() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	// 글등록
	public void insertBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOSpring2 - insertBoard()");
		mybatis.insert("BoardDAO.insertBoard", dto); // (namespace).(id)
		mybatis.commit();
	}
	
	// 글수정
	public void updateBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOSpring2 - updateBoard()");
		mybatis.update("BoardDAO.updateBoard", dto);
		mybatis.commit();
	}
	
	// 글삭제
	public void deleteBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOSpring2 - deleteBoard()");
		mybatis.delete("BoardDAO.deleteBoard", dto);
		mybatis.commit();
	}
	
	// 글전체 보기 -> 검색 기능 추가
	public List<BoardDTO> getBoardList(BoardDTO dto) {
		System.out.println("===> BoardDAOSpring2 - getBoardList()");
		return mybatis.selectList("BoardDAO.getBoardList", dto);
	}
	
	// 조회수 증가 -> 글상세보기에서 동작
	public void updateBoardCnt(BoardDTO dto) {
		System.out.println("===> BoardDAOSpring2 - updateBoardCnt()");
		mybatis.update("BoardDAO.updateBoardCnt", dto);
	}
	
	// 글상세 보기(1건)
	public BoardDTO getBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOSpring2 - getBoard()");
		updateBoardCnt(dto);
		return mybatis.selectOne("BoardDAO.getBoard");
	}
	
	
}
