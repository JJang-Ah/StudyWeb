package com.springbook.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardDTO;

@Repository("boardDAO")
public class BoardDAOMybatis2 {
	
	@Autowired
	private SqlSessionTemplate mybatis;
			
	// 글등록
	public void insertBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOMybais2 - insertBoard()");
		mybatis.insert("BoardDAO.insertBoard", dto);
	}
	
	// 글수정
	public void updateBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOMybais2 - updateBoard()");
		mybatis.update("BoardDAO.updateBoard", dto);
	}
	
	// 글삭제
	public void deleteBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOMybais2 - deleteBoard()");
		mybatis.delete("BoardDAO.deleteBoard", dto);
	}
	
	// 글전체 보기 -> 검색 기능 추가
	public List<BoardDTO> getBoardList(BoardDTO dto) {
		System.out.println("===> BoardDAOMybais2 - getBoardList()");
		return mybatis.selectList("BoardDAO.getBoardList", dto);
	}
	
	// 조회수 증가 -> 글상세보기에서 동작
	public void updateBoardCnt(BoardDTO dto) {
		System.out.println("===> BoardDAOMybais2 - updateBoardCnt()");
		mybatis.update("BoardDAO.updateBoardCnt", dto);
	}
	
	// 글상세 보기(1건)
	public BoardDTO getBoard(BoardDTO dto) {
		System.out.println("===> BoardDAOMybais2 - getBoard()");
		return mybatis.selectOne("BoardDAO.getBoard", dto);
	}
	
	// 글삭제 - 회원탈퇴시에 회원의 모든 글 삭제
	public void deleteBoardById(BoardDTO dto) {
		System.out.println("===> BoardDAOMybais2 - deleteBoardById()");
		mybatis.delete("BoardDAO.deleteBoardById", dto);
	}

}
