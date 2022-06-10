package com.springbook.biz.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {

	public static void main(String[] args) {
		// 1. Spring 컨테이너를 구동하여 설정파일(xml)을 찾는 행위 -> look up
		AbstractApplicationContext container = new GenericXmlApplicationContext("boardContext.xml");
		
		// 2. boardservice 구현체를 생성(bean을 찾아 세팅하는 것)
		BoardService boardService = (BoardService)container.getBean("boardService");
		
		// 3. 객체를 생성하여 테이블에 삽입
		// 3.1 글등록 테스트
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle("글등록 8");
		dto.setWriter("네이마르");
		dto.setContent("글등록 테스트 중입니다. 8");
		boardService.insertBoard(dto);
		
		
		// 3.2 글전체 보기 테스트
		List<BoardDTO> boardList = boardService.getBoardList(dto);	
		for(BoardDTO board : boardList) {
			System.out.println(board);
		}
		
		// 3.3 글상세(1건) 보기 테스트
//		dto.setSeq(1);
//		BoardDTO board = boardService.getBoard(dto);
//		System.out.println(board);
		
		// 3.4 글 수정 테스트
//		dto.setSeq(2);
//		dto.setTitle("스프링 글등록 2");
//		dto.setContent("스프링 글등록 테스트 중입니다. 2");
//		boardService.updateBoard(dto);
		
		// 3.5 글 삭제 테스트
		/*
		dto.setSeq(1);
		boardService.deleteBoard(dto);
		*/
		// 4. Spring 컨테이너 종료
		container.close();
	}

}
