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
		Context envCtx = (Context)initCtx.lookup("java:comp/env"); // 라이브러리 설정(환경)을 찾는다.
		DataSource ds = (DataSource)envCtx.lookup("jdbc/db02");
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
