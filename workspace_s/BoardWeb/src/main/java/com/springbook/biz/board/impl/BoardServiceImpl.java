package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.board.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	// DI, 의존성 주입...
	@Autowired
	private BoardDAO boardDAO;
	
	
	@Override
	@Transactional("txManager")
	public void insertBoard(BoardDTO dto) {
		// 예외 발생 - AfterThrowing 테스트
//		if(dto.getWriter().equals("홍길동")) {
//			throw new IllegalArgumentException("홍길동은 글등록을 할 수 없습니다.");
//		}
		
		boardDAO.insertBoard(dto);	
		
		/*
		// 트랜잭션 테스트
		dto.setSeq(100);
		boardDAO.insertBoard(dto);
		
		// 트랜잭션 처리 되지 않을 경우 위 코드만 실행, 아래 코드는 실행이 안됨(seq가 주키이므로 같은 번호를 중복해서 사용할 수 없음)
		dto.setSeq(100);
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
	public BoardDTO getBoard(BoardDTO dto) {
		return boardDAO.getBoard(dto);		
	}
	
}
