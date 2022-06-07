package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.board.BoardService;
import com.springbook.biz.common.LogAdvice;

@Component("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired // 대칭되는 빈이 한개일때 
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardDTO dto) {
		// 예외 발생
		if(dto.getWriter().equals("홍길동")) {
			throw new IllegalArgumentException("홍길동은 글을 등록할 수 없습니다.");
		}
		boardDAO.insertBoard(dto);
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
		return boardDAO.getBoardList();
	}

	@Override
	public BoardDTO getBoard(BoardDTO dto) {
		return boardDAO.getBoard(dto);
	}


}
