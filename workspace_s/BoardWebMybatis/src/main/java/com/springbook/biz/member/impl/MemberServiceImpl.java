package com.springbook.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.member.MemberDTO;
import com.springbook.biz.member.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAOMybatis2 memberDAO;
	
	@Override
	public MemberDTO checkIdMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - checkIdMember()");
		return memberDAO.checkIdMember(dto);
	}

	@Override
	public void insertMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - insertMember()");
		memberDAO.insertMember(dto);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - updateMember()");
		memberDAO.updateMember(dto);
	}

	@Override
	public void deleteMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - deleteMember()");
		memberDAO.deleteMember(dto);
	}

	@Override
	public MemberDTO getMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - getMember()");
		return memberDAO.getMember(dto);
	}

	@Override
	public MemberDTO loginMember(MemberDTO dto) {
		System.out.println("==> MemberServiceImpl - loginMember()");
		return null;
	}
	

}
