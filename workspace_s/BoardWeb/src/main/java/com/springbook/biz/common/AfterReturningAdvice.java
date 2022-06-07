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
	public void allPointcut() {} // ���� �޼ҵ�, ����Ʈ�� �޼ҵ�
	
	@Pointcut("cxcution(* com.springbook.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@AfterReturning(pointcut="getPointcut()", returning="returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) {
		String method = jp.getSignature().getName();
		
		if(returnObj instanceof MemberDTO) {
			MemberDTO member = (MemberDTO)returnObj;
			if(member.getRole().equals("Admin")) {
				System.out.println(member.getName() + " �α���!");
			}
		}
		System.out.println("[���� ó��] " + method + "() �޼ҵ�, ���ϰ�: " + returnObj.toString());
		//System.out.println("[���� ó��] �����Ͻ� ���� ���� �� ����");
	}

}
