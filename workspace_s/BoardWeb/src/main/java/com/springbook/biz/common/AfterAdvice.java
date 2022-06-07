package com.springbook.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterAdvice {

	@Pointcut("excution(* com.springbook.biz..*Impl.*(..))")
	public void allPointcut() {} // ���� �޼ҵ�, ����Ʈ�� �޼ҵ�
	
	@Pointcut("cxcution(* com.springbook.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@After("allPointcut()")
	public void afterLog() {
		System.out.println("");
	}
}
