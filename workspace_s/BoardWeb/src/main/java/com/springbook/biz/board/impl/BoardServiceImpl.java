package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.board.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	@Transactional("txManager")
	public void insertBoard(BoardDTO dto) {
		// 예외 발생 - AfterThrowing 테스트
//		if(dto.getWriter().equals("홍길동")) {
//			throw new IllegalArgumentException("홍길동은 글을 등록할 수 없습니다.");
//		}
		
		boardDAO.insertBoard(dto);
		
		// 트랜잭션 테스트
		/*
		dto.setSeq(101);
		boardDAO.insertBoard(dto);
		dto.setSeq(102);
		boardDAO.insertBoard(dto);
		*/
	}

	@Override
	public void updateBoard(BoardDTO dto) {
		boardDAO.updateBoard(dto);
	}

	@Override
	public void deleteBoard(BoardDTO dto) {
		boardDAO.deleteBoard(dto);
	}
	
	@Override
	public List<BoardDTO> getBoardList(BoardDTO dto) {
		return boardDAO.getBoardList(dto);
	}
	
	@Override
	public void updateBoardCnt(BoardDTO dto) {
		boardDAO.updateBoardCnt(dto);
	}

	@Override
	public BoardDTO getBoard(BoardDTO dto) {
		updateBoardCnt(dto);
		return boardDAO.getBoard(dto);
	}

}
