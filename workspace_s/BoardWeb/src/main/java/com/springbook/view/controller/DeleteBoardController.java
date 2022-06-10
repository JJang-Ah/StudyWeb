package com.springbook.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.board.impl.BoardDAO;

public class DeleteBoardController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("글삭제 처리");
		int seq = Integer.parseInt(request.getParameter("seq"));
		// 2. 
		BoardDTO dto = new BoardDTO();
		dto.setSeq(seq);
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.deleteBoard(dto);
		
		return "getBoardList.do";
	}
	
	

}
