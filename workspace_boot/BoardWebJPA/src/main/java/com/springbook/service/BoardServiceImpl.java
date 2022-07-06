package com.springbook.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.springbook.entity.BoardDTO;
import com.springbook.repository.BoardRepository;

@Service("boardService")
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	@Override
	public void insertBoard(BoardDTO dto) {
		System.out.println("==> BoardServiceImpl - insertBoard()");
		dto.setRegdate(new Date(System.currentTimeMillis()));
		boardRepository.save(dto);
	}

	@Override
	public void updateBoard(BoardDTO dto) {
		System.out.println("==> BoardServiceImpl - updateBoard()");		
		boardRepository.save(dto);
	}

	@Override
	public void deleteBoard(BoardDTO dto) {
		System.out.println("==> BoardServiceImpl - deleteBoard()");
		//boardRepository.deleteById(dto.getSeq()); // 1번 방법: OK
		boardRepository.delete(dto); // 2번 방법: OK
	}
	
	@Override
	public List<BoardDTO> getBoardList(BoardDTO dto) {
		System.out.println("==> BoardServiceImpl - getBoardList()");
		return boardRepository.findAll(Sort.by("seq").descending());
	}
	
	@Override
	public BoardDTO getBoard(BoardDTO dto) {
		System.out.println("==> BoardServiceImpl - getBoard()");
		
		// 1번 방법 - JpaRepository에서 제공하는 기본 메소드 사용: OK
		/*
		dto = boardRepository.findById(dto.getSeq()).get();
		dto.setCnt(dto.getCnt()+1);
		boardRepository.save(dto);
		*/
		
		// 2번 방법 - JPQL을 사용: OK
		boardRepository.updateBoardCnt(dto.getSeq());
		return boardRepository.findById(dto.getSeq()).get();
	}
	
}
