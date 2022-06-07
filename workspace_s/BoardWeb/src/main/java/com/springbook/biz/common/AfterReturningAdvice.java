package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.springbook.biz.member.MemberDTO;

@Service
@Aspect
public class AfterReturningAdvice {
	
	@Pointcut("excution(* com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {} // 참조 메소드, 포인트컷 메소드
	
	@Pointcut("cxcution(* com.springbook.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@AfterReturning(pointcut="getPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) {
		String method = jp.getSignature().getName();
		
		if(returnObj instanceof MemberDTO) {
			MemberDTO member = (MemberDTO)returnObj;
			if(member.getRole().equals("Admin")) {
				System.out.println(member.getName() + " 로그인!");
			}
		}
		System.out.println("[사후 처리] " + method + "() 메소드, 리턴값: " + returnObj.toString());
		//System.out.println("[사후 처리] 비지니스 로직 수행 후 동작");
	}

}
