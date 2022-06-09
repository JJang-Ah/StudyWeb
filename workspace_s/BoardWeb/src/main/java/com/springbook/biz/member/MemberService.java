package com.springbook.biz.member;

public interface MemberService {
	void insertMemeber(MemberDTO dto);
	void updateMember(MemberDTO dto);
	void deleteMember(MemberDTO dto);
	MemberDTO getMemeber(MemberDTO dto);
	
}
