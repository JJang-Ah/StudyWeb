package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeAdvice {
	public void beforeLog(JoinPoint jp) {

		// @Before("allPointcut()")
		String method = jp.getSignature().getName(); // 핵심관심사의 메소드의 이름을 알아냄
		Object[] args = jp.getArgs(); 				 // 포인트컷 메소드의 매개변수를 알아냄	
		
		System.out.println("[사전 처리]"+ method + "() 메소드, 매개변수 정보: "+ args[0].toString());
		//System.out.println("[사전 처리] 비지니스 로직 수행 전 동작");
	}

	
}
