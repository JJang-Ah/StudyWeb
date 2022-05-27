package product.upload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.JDBCUtil;


public class FileUploadDAO {

	// Singleton Pattern(싱글톤 패턴) - 클래스의 인스턴스 하나만 생성하는 방법
	private FileUploadDAO() { }
	
	private static FileUploadDAO uploadDAO = new FileUploadDAO();
	
	public static FileUploadDAO getInstance() {
		return uploadDAO;
	}
	
	// DB 연결, 질의 객체 선언
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 추가 메소드
	public void insertProduct(FileUploadDTO file) {
		String sql = "insert into fileUpload values(?, ?, ?, ?, ?, ?, ?)";
		
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, file.getWriter());
			pstmt.setString(1, file.getSubject());
			pstmt.setString(1, file.getUploadFile1());
			pstmt.setString(1, file.getUploadFile2());
			pstmt.setString(1, file.getUploadFile3());
			pstmt.setString(1, file.getUploadFile4());
			pstmt.setString(1, file.getUploadFile5());
			pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}
