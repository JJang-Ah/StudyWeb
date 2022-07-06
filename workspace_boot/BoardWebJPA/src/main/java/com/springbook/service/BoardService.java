package com.springbook.service;

import java.util.List;

import com.springbook.entity.BoardDTO;

public interface BoardService {
	
	void insertBoard(BoardDTO dto);
	void updateBoard(BoardDTO dto);
	void deleteBoard(BoardDTO dto);
	List<BoardDTO> getBoardList(BoardDTO dto);
	BoardDTO getBoard(BoardDTO dto);
}
