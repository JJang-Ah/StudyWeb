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
	public void allPointcut() {} // ���� �޼ҵ�, ����Ʈ�� �޼ҵ�
	
	@Pointcut("cxcution(* com.springbook.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@Before("allPointcut()")
	public void beforeLog(JoinPoint jp) {
		String method = jp.getSignature().getName(); // �����Ͻ� �޼ҵ��� �̸��� �� �� �ִ�.
		Object[] args = jp.getArgs(); // �����Ͻ� �޼ҵ��� �Ű������� �̸�
		
		System.out.println("[���� ó��] " + method + "() �޼ҵ�, �Ű����� ����: " + args[0].toString());
		//System.out.println("[���� ó��] �����Ͻ� ���� ���� �� ����");
	}

}
