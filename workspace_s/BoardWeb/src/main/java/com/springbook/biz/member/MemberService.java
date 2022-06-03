package com.springbook.biz.member;


public interface MemberService {

	public void insertMember(MemberDTO dto);
	public void updateMember(MemberDTO dto);
	public void deleteMember(MemberDTO dto);
	public MemberDTO getMember(MemberDTO dto);
	
}
