package com.springbook.biz.member.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.springbook.biz.member.MemberDTO;

@Repository("memberDAO")
public class MemberDAOMybatis2 {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
	// 회원 등록
	public void insertMember(MemberDTO dto) {
		System.out.println("===> MemberDAOMybatis2 - insertMember()");
		mybatis.insert("MemberDAO.insertMember", dto);
	}
	
	// 회원 수정
	public void updateMember(MemberDTO dto) {
		System.out.println("===> MemberDAOMybatis2 -  updateMember()");
		mybatis.update("MemberDAO.updateMember", dto);
	}
	
	// 회원 삭제
	public void deleteMember(MemberDTO dto) {
		System.out.println("===> MemberDAOMybatis2 -  deleteMember()");
		mybatis.delete("MemberDAO.deleteMember", dto);
	}

	// 회원정보(1건) 보기
	public MemberDTO getMember(MemberDTO dto) {
		System.out.println("===> MemberDAOMybatis2 -  getMember()");
		return mybatis.selectOne("MemberDAO.getMember", dto);
	}
	
	// 로그인 확인(id와 password 모두 확인)
	public MemberDTO loginMember(MemberDTO dto) {
		System.out.println("===> MemberDAOMybatis2 -  loginMember()");
		return mybatis.selectOne("MemberDAO.loginMember", dto);
	}

	

}
