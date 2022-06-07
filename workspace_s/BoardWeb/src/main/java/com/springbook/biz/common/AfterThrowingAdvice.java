package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//@Service
//@Aspect
public class AfterThrowingAdvice {
	@Pointcut("excution(* com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {} // 참조 메소드, 포인트컷 메소드
	
	@Pointcut("cxcution(* com.springbook.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@AfterThrowing(pointcut="allPoingcut", throwing="exceptObj")
	public void exceptionLog(JoinPoint jp, Exception exceptObj) {
		String method = jp.getSignature().getName();
		
		System.out.println("[예외 처리] " + method + "() 메소드, 예외 처리 메시지: " + exceptObj.getMessage());
		
		
		// System.out.println("[예외 처리] 비지니스 로직 수행 중 예외 발생");
	}

}
