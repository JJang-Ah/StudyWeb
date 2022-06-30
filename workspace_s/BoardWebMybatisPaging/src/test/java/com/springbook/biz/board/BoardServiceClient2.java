package com.springbook.biz.board;

import java.util.List;

import com.springbook.biz.board.impl.BoardDAOMybatis;

public class BoardServiceClient2 {
	
	public static void main(String[] args) {
		BoardDAOMybatis boardDAO = new BoardDAOMybatis();
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle("Mybatis 제목");
		dto.setWriter("글쓴 사람");
		dto.setContent("Mybatis 내용");
		boardDAO.insertBoard(dto);
		
		dto.setSearchCondition("TITLE");
		dto.setSearchKeyword("");
		List<BoardDTO> boardList = boardDAO.getBoardList(dto);
		
		for(BoardDTO board : boardList) {
			System.out.println("---> " + board);
		}
	}

}
