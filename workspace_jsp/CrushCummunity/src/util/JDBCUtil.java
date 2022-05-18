package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class JDBCUtil {
	
	// 1~2 단계 - Connection Pool 사용
	public static Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env"); // 로컬 리소스 라이브러리 설정(환경)을 찾는다.	

//		java:comp/env는 웹어플의 구성된 엔트리와 리소스들이 배치되어있는 부분.
//		그래서 이것에 접근을 하여 web.xml의 <resource-env-ref>에 설정한 jdbc/mysql과 매핑되는 리소스를 가져온다. 
		DataSource ds = (DataSource)envCtx.lookup("jdbc/db01"); // web.xml, context.xml에 설정되어있는 name값
		return ds.getConnection();
	}
	
	// Connection, PreparedStatement 닫는 메소드 - insert, update, delete 작업
	public static void close(Connection conn, PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	// Connection, PReparedStatement, ResultSet 객체를 닫는 메소드 - select 작업
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
