package com.springbook.service;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.entity.MemberDTO;
import com.springbook.repository.BoardRepository;
import com.springbook.repository.MemberRepository;

@Service("memberService")
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private BoardRepository boardRepository;
	
	@Override
	public MemberDTO checkIdMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - checkIdMember()");
		return memberRepository.checkMemberId(dto.getId());
	}

	@Override
	public void insertMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - insertMember()");
		dto.setRegdate(new Date(System.currentTimeMillis()));
		memberRepository.save(dto);
	}

	@Override
	public MemberDTO updateMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - updateMember()");
		return memberRepository.save(dto);
	}

	// 회원탈퇴시에 회원의 모든 글 삭제 -> 트랜잭션 처리
	@Override
	public void deleteMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - deleteMember()");
		System.out.println("==> MemberServiceImpl - 트랜잭션 처리(회원탈퇴+게시글삭제)");
		// 1번 작업 - 회원 삭제
		memberRepository.delete(dto);  
		// 2번 작업 - 회원의 모든 게시글 삭제 - JPQL으로 정의한 메소드 사용
		boardRepository.deleteByBoardWriter(dto.getId()); 
	}

	@Override
	public MemberDTO getMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - getMember()");
		return memberRepository.findById(dto.getId()).get();
	}

	@Override
	public MemberDTO loginMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - loginMember()");
		return memberRepository.findByLogin(dto.getId(), dto.getPassword());
	}
	
}
