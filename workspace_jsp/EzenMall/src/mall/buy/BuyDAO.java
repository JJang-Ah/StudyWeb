package mall.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import util.JDBCUtil;

public class BuyDAO {
	// 싱글톤 패턴
	private BuyDAO() {}
	private static BuyDAO instance = new BuyDAO();
	public static BuyDAO getInstance() {
		return instance;
	}
	
	// DB 연결 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 구매목록 추가
	public void insertBuyList(List<BuyDTO> buyList) {
		String sql = "insert into buy(buy_id, buyer, product_id, product_name, buy_price, buy_count, product_image, "
				+ "account, delivery_name, delivery_tel, delivery_address) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = JDBCUtil.getConnection();
			for(BuyDTO buy : buyList) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, buy.getBuy_id());
				pstmt.setString(2, buy.getBuyer());
				pstmt.setInt(3, buy.getProduct_id());
				pstmt.setString(4, buy.getProduct_name());
				pstmt.setInt(5, buy.getBuy_price());
				pstmt.setInt(6, buy.getBuy_count());
				pstmt.setString(7, buy.getProduct_image());
				pstmt.setString(8, buy.getAccount());
				pstmt.setString(9, buy.getDelivery_name());
				pstmt.setString(10, buy.getDelivery_tel());
				pstmt.setString(11, buy.getDelivery_address());
				pstmt.executeUpdate();
			}
			
			
		} catch(Exception e ) {
			System.out.println("=> insertBuyList() 에러");
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}
