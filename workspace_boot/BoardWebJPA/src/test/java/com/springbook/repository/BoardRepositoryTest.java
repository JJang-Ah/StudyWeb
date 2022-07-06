package com.springbook.repository;

import java.util.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import com.springbook.entity.BoardDTO;

//@SpringBootTest
//@TestPropertySource(locations="classpath:application.properties")
public class BoardRepositoryTest {
	
	@Autowired
	BoardRepository boardRepository;

	
	//@Test
	//@DisplayName("게시판 새글 저장 테스트")
	public void createBoardTest() {
		
		BoardDTO board = null;
		for(int i=0; i<5; i++) {
			board = new BoardDTO();
			board.setTitle("이상한 변호사 우영우(" + i + ")");
			board.setWriter("ccc3333");
			board.setContent(i + " 자페를 가진 변호사 이야기");
			board.setRegdate(new Date(System.currentTimeMillis()));
			BoardDTO savedBoard = boardRepository.save(board);
			System.out.println(savedBoard.toString());
		}
		
		/*
		String[] wsg = {"윤은혜", "나비", "이보람", "코타", "박진주", "조현아", 
			"쏠", "소연", "엄지윤", "권진아", "흰", "정지소"	};
		
		for(int i=0; i<12; i++) {
			BoardDTO board = new BoardDTO();
			board.setTitle("WSG 워너비 : " + (i+1) + "번째 멤버");
			board.setWriter(wsg[i]);
			board.setContent("WSG 워너비의 롤모델 그룹 중 하나가 씨야라고 유팔봉이 직접 언급했다.");
			board.setRegdate(new Date(System.currentTimeMillis()));
			BoardDTO savedBoard = boardRepository.save(board);
			System.out.println(savedBoard.toString());
		}
		*/
	}
	
	//@Test
	//@DisplayName("게시판 조회 테스트")
	/*
	public void findByWriterTest() {
		List<BoardDTO> boardList = boardRepository.findByWriter("정지연");
		for(BoardDTO board : boardList) {
			System.out.println(board);
		}
	}
	*/
	
}
