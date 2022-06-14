package com.springbook.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.BoardDTO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class BoardController {
	
	@RequestMapping(value="/insertBoard.do")
	public String insertMethod(BoardDTO dto, BoardDAO boardDAO) {
		System.out.println("글등록 처리");
		boardDAO.insertBoard(dto);
		return "getBoardList.do";
	}
	
	@RequestMapping(value="/updateBoard.do")
	public String updateBoard(BoardDTO dto, BoardDAO boardDAO) {
		System.out.println("글수정 처리");
		boardDAO.updateBoard(dto);
		return "getBoardList.do";
	}
	
	@RequestMapping(value="/deleteBoard.do")
	public String deleteBoard(BoardDTO dto, BoardDAO boardDAO) {
		System.out.println("글삭제 처리");
		boardDAO.deleteBoard(dto);
		return "getBoardList.do";
	}
	
	@RequestMapping(value="/getBoard.do")
	public String getBoard(BoardDTO dto, BoardDAO boardDAO, Model model) {
		System.out.println("글상세 조회");
		model.addAttribute("board", boardDAO.getBoard(dto));
		return "getBoard.jsp";
	}
	
	@RequestMapping(value="/getBoardList.do")
	public String getBoardList(BoardDTO dto, BoardDAO boardDAO, Model model) {
		System.out.println("글목록 조회");
		model.addAttribute("boardList", boardDAO.getBoardList(dto));
		return "getBoardList.jsp";
	}

}
