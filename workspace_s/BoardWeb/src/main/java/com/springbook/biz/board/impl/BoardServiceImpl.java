package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.board.BoardService;
import com.springbook.biz.common.LogAdvice;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired // ��Ī�Ǵ� ���� �Ѱ��϶� 
	private BoardDAO boardDAO;
	
	@Override
	@Transactional("txManager")
	public void insertBoard(BoardDTO dto) {
		// ���� �߻� - AFterTrowing �׽�Ʈ
		if(dto.getWriter().equals("ȫ�浿")) {
			throw new IllegalArgumentException("ȫ�浿�� ���� ����� �� �����ϴ�.");
		}
		boardDAO.insertBoard(dto);
		
		// Ʈ������ �׽�Ʈ
//		dto.setSeq(100);
//		boardDAO.insertBoard(dto);
//
//		dto.setSeq(100);
//		boardDAO.insertBoard(dto);
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
