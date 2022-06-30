package com.springbook.biz.advice;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.sql.Timestamp;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterAdvice {
	
	@After("PointcutCommon.allPointcut()")
	public void afterLog(JoinPoint jp) {
		String method = jp.getSignature().getName();
		System.out.println("[사후 처리] " + method + "() 메소드 수행 후 처리");
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		System.out.println("접근시간: " + now.toString());
						
		// 비지니스 메소드에 접근 시간을 파일로 기록
		String file = "c:/logs/boardweb.log";
		PrintWriter pw = null;
		
		try {
			pw = new PrintWriter(new FileWriter(file, true));
			pw.write("접근시간: " + now + ", 실행 메소드: " + method + "()\n");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pw.close();
		}
	}

}
