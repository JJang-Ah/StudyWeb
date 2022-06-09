package com.springbook.biz.common;

import org.aspectj.lang.JoinPoint;

public class AfterThrowingAdvice {
	public void execeptionLog(JoinPoint jp, Exception exceptObj) {
		String method = jp.getSignature().getName();
		
		System.out.println("[예외 처리] " + method +"() 메소드, 예외처리 메시지: "+ exceptObj.toString());
		// System.out.println("[예외 처리] 비지니스 로직 수행 중 예외 발생 동작");
	}
}
