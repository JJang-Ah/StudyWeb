package com.springbook.service;

import com.springbook.entity.MemberDTO;

public interface MemberService {
	
	MemberDTO checkIdMember(MemberDTO dto);
	void insertMember(MemberDTO dto);
	MemberDTO updateMember(MemberDTO dto);
	void deleteMember(MemberDTO dto);
	MemberDTO getMember(MemberDTO dto);
	MemberDTO loginMember(MemberDTO dto);

}
