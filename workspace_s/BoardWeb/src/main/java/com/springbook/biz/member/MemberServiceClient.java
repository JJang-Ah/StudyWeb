package com.springbook.biz.member;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MemberServiceClient {

	public static void main(String[] args) {
		// 1. Spring �����̳ʸ� ����
		AbstractApplicationContext container = new GenericXmlApplicationContext("boardContext.xml");
		
		// 2. MemberService ��ü�� ã��
		MemberService memberService = (MemberService)container.getBean("memberService");
		
		// 3-1. ȸ�� ���
		MemberDTO member = new MemberDTO();
		member.setId("bbb2222");
		member.setPassword("1234");
		member.setName("������");
		member.setRole("�Ϲݻ����");
		memberService.insertMember(member);
		
		// 3-2. ȸ�� ���� Ȯ��(1��)
		member.setId("admin");
		member.setPassword("1234");
		MemberDTO m = memberService.getMember(member);
		System.out.println(m);
		
		// 3-3. ȸ�� ���� ����
		member.setId("aaa1111");
		member.setPassword("1234");
		member.setName("ä��ȭ");
		member.setRole("������");
		memberService.updateMember(member);
		
		// 3-4. ȸ�� ���� ����
		member.setId("bbb2222");
		member.setPassword("1234");
		memberService.deleteMember(member);
		
		// 4. Spring �����̳� ����
		container.close();
	}

}