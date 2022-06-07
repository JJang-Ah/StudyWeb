package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;


@Service
@Aspect
public class BeforeAdvice {
	@Pointcut("excution(* com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {} // 참조 메소드, 포인트컷 메소드
	
	@Pointcut("cxcution(* com.springbook.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@Before("allPointcut()")
	public void beforeLog(JoinPoint jp) {
		String method = jp.getSignature().getName(); // 비지니스 메소드의 이름을 알 수 있다.
		Object[] args = jp.getArgs(); // 비지니스 메소드의 매개변수의 이름
		
		System.out.println("[사전 처리] " + method + "() 메소드, 매개변수 정보: " + args[0].toString());
		//System.out.println("[사전 처리] 비지니스 로직 수행 전 동작");
	}

}
