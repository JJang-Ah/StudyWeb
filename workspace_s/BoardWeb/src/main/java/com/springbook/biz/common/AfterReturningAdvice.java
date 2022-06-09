package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;

import com.springbook.biz.member.MemberDTO;

// @Service
// @Aspect
public class AfterReturningAdvice {
	public void afterLog(JoinPoint jp, Object returnObj) {

		// @AfterReturning("getPointcut()")
		String method = jp.getSignature().getName();
		
		if(returnObj instanceof MemberDTO) {
			MemberDTO member = (MemberDTO)returnObj;
			if(member.getRole().equals("Admin")) {
				System.out.println(member.getName()+ "로그인!");
			}
		}
		
		System.out.println("[사후 처리]" + method + "() 메소드, 리턴값: " + returnObj.toString());
		// System.out.println("[사후 처리] 비지니스 로직 수행 후 동작");
	}
}
