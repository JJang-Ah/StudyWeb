package com.springbook.biz.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {

	public static void main(String[] args) {
		// 1. String �����̳ʸ� �����Ͽ� ���������� ã��
		AbstractApplicationContext container = new GenericXmlApplicationContext("boardContext.xml"); //boardContext.xml������ �д� �۾�
		
		// 2. boardService ����ü�� ����
		BoardService boardService = (BoardService)container.getBean("boardService");
		
		// 3. ��ü�� �����Ͽ� ���̺� ����
		
		// 3-1. �۵�� �׽�Ʈ
		BoardDTO dto = new BoardDTO();
		dto.setTitle("�۵�� 1");
		dto.setWriter("ĸƾ6");
		dto.setContent("�۵�� �׽�Ʈ ���Դϴ�. 1");
		
		// 3-2. ����ü ���� �׽�Ʈ
		List<BoardDTO> boardList = boardService.getBoardList(dto);
		for(BoardDTO board : boardList) {
			System.out.println(board);
		}
		
		// 3-3. �ۻ�(1��) ���� �׽�Ʈ
		dto.setSeq(2);
		BoardDTO board = boardService.getBoard(dto);
		
		// 3-4. �ۼ��� �׽�Ʈ
		dto.setSeq(2);
		dto.setTitle("������ �۵��  1");
		dto.setContent("������ �۵�� �׽�Ʈ�Դϴ�. 1");
		boardService.updateBoard(dto);
		
		// 3-5. �ۻ��� �׽�Ʈ
		dto.setSeq(1);
		boardService.deleteBoard(dto);
		
		// 4. Spring �����̳� ����
		container.close();
		
	}
}
