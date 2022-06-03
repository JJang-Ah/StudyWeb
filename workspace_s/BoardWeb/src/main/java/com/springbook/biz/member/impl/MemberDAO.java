package com.springbook.biz.member.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Component;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.member.MemberDTO;

@Component("memberDAO")
public class MemberDAO {

	// DB ����, ���� ����
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// SQL��
	private final String MEMBER_INSERT = "insert into member values(?, ?, ?, ?)";
	private final String MEMBER_UPDATE = "update member set name=?, role=? where id=? and password=?";
	private final String MEMBER_DELETE = "delete member where id=? and password=?";
	private final String MEMBER_GET = "select * from member where id=? and password=?";
	
	// ȸ�� ���
	public void insertMember(MemberDTO dto) {
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(MEMBER_INSERT);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getRole());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// ȸ�� ����
	public void updateMember(MemberDTO dto) {
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(MEMBER_UPDATE);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getRole());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getPassword());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// ȸ�� ����
	public void deleteMember(MemberDTO dto) {
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(MEMBER_DELETE);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPassword());
			pstmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// ȸ�� ����(1��) ����
	public MemberDTO getMember(MemberDTO dto) {
		System.out.println("=> getMember() �޼ҵ� ���� ");
		MemberDTO member = new MemberDTO();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(MEMBER_GET);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setRole(rs.getString("role"));
			}
				
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return member;
	}
	
}
