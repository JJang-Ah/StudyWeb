package com.springbook.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.entity.BoardDTO;
import com.springbook.service.BoardService;

@Controller
@SessionAttributes("board")
public class BoardController {

	@Autowired
	private BoardService boardService;
			
	//@RequestMapping(value="/insertBoard.do", method=RequestMethod.GET)
	@GetMapping(value="/insertBoard")
	public String insertBoard() {
		System.out.println("=> BoardController - 글등록 화면 이동");
		return "insertBoard";
	}
	
	//@RequestMapping(value="/insertBoard.do", method=RequestMethod.POST)
	@PostMapping(value="/insertBoard")
	public String insertBoard(BoardDTO dto) {
		System.out.println("=> BoardController - 글등록 처리(DB처리)");
		
		if(dto.getTitle().equals("")) return "insertBoard.jsp";
		if(dto.getWriter().equals("")) return "insertBoard.jsp";
		if(dto.getContent().equals("")) return "insertBoard.jsp";
		
		boardService.insertBoard(dto);
		return "redirect:getBoardList";
	}
	
	// SessionAttributes와 ModelAttribute 애노테이션을 사용하여 update할 때 발생하는 null 업데이트를 방지할 수 있음.
	@RequestMapping(value="/updateBoard")
	public String updateBoard(@ModelAttribute("board") BoardDTO dto) {
		System.out.println("=> BoardController - 글수정 처리");
		boardService.updateBoard(dto);
		return "redirect:getBoardList";
	}
	
	@RequestMapping(value="/deleteBoard")
	public String deleteBoard(BoardDTO dto) {
		System.out.println("=> BoardController - 글삭제 처리");
		boardService.deleteBoard(dto);
		return "redirect:getBoardList";
	}
	
	@RequestMapping(value="/getBoard")
	public String getBoard(BoardDTO dto, Model model) {
		System.out.println("=> BoardController - 글상세 조회");
		model.addAttribute("board", boardService.getBoard(dto));
		return "getBoard";
	}	
	
	// 검색 목록 설정
	@ModelAttribute("conditionMap") // RequestMapping 이전에 실행
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "WRITER");
		return conditionMap;
	}
		
	@RequestMapping(value="/getBoardList")
	public String getBoardList(BoardDTO dto, Model model) {
		System.out.println("=> BoardController - 글목록 조회");
		
		// 검색 확인 - searchCondition, searchKeyword가 null일 때의 처리
		if(dto.getSearchCondition() == null) dto.setSearchCondition("TITLE");
		if(dto.getSearchKeyword() == null) dto.setSearchKeyword("");
		
		model.addAttribute("boardList", boardService.getBoardList(dto));
		return "getBoardList";
	}
	
}
