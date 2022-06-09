package com.springbook.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

public class AroundAdvice {
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		String method = pjp.getSignature().getName();
		
		StopWatch sw = new StopWatch();
		
		sw.start();
		Object obj = pjp.proceed();
		sw.stop();
		
		System.out.println(method + "() 메소드의 동작 시작: " + sw.getTotalTimeMillis());
		return obj;
		/*
		System.out.println("[BEFORE] 비지니스 로직 수행 전 동작");
		Object returnObj = pjp.proceed();
		System.out.println("[AFTER] 비지니스 로직 수행 후 동작");
		return returnObj;
		*/
	}
}
