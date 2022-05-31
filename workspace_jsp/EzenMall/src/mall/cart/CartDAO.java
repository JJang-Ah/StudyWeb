package mall.cart;
import java.sql.*;
public class CartDAO {
	// 싱글톤 패턴
	private CartDAO() { }
	private static CartDAO cartDAO = new CartDAO();
	public static CartDAO getInstance() {
		return cartDAO;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 장바구니 등록
	
	// 장바구니 목록 확인
	
	// 장바구니 수정
	
	// 장바구니 삭제
	
	
}
