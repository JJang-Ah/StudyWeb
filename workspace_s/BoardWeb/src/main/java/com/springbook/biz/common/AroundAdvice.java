package com.springbook.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundAdvice {

	@Around("PointcutCommon.getPointcut()")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable{
		String method = pjp.getSignature().getName();
		StopWatch sw = new StopWatch();
		
		sw.start();
		Object obj = pjp.proceed();
		sw.stop();
		System.out.println("method() 메소드의 동작 시작: " + sw.getTotalTimeMillis() + "(ms)");
		return obj;
		
//		System.out.println("[BEFORE] 비지니스 로직 수행 전 동작");
//		Object returnobj = pjp.proceed();
//		
//		System.out.println("[AFTER] 비지니스 로직 수행 후 동작");
//		return returnobj;
	}

}
