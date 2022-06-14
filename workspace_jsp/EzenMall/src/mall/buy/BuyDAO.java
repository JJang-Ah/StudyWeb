package mall.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BuyDAO {
	// 싱글톤 패턴
	private BuyDAO() {}
	private BuyDAO instance = new BuyDAO();
	public BuyDAO getInstance() {
		return instance;
	}
	
	// DB 연결 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 구매정보 
	
}
