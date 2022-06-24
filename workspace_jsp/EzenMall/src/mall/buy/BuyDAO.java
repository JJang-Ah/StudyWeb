package mall.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import mall.cart.CartDTO;
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
	
	// 구매목록 추가 - 트랜젝션 처리
	// 3가지의 작업 - 구매 테이블에 상품 등록, 카트 테이블에서 구매상품을 삭제, 상품 테이블 상품의 재고량을 수정
	public void insertBuyList(List<BuyDTO> buyList, List<CartDTO> cartList) throws SQLException{
		String sql = "insert into buy(buy_id, buyer, product_id, product_name, buy_price, buy_count, product_image, "
				+ "account, delivery_name, delivery_tel, delivery_address) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String sql2 = "delete from cart where cart_Id = ?";
		String sql3 = "select product_count from product where product_id=?";
		String sql4 = "update product set product_count=? where product_id =?";
		
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			// 1번작업 - 구매 테이블 등록
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
			
			// 2번 작업 - 카트 테이블에서 구매상품을 삭제
			for(CartDTO cart : cartList) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, cart.getCart_id());
				pstmt.executeUpdate();
			}
			
			// 3번 작업 - 상품 테이블에서 상품의 재고량 파악 -> 상품 테이블에서 상품의 재고량을 수정 (구매 상품의 개수를 빼서 설정)
			
			for(BuyDTO buy : buyList) {
				// 상품 테이블에서 구매 상품의 재고량을 파악 
				int p_count = 0;
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, buy.getProduct_id());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					p_count = rs.getInt("prorduct_count");
				}
				
				
				// 상품 테이블에서 구매 상품의 재고량을 수정
				pstmt = conn.prepareStatement(sql4);
				pstmt.setInt(1, p_count - buy.getBuy_count());
				pstmt.setInt(2, buy.getProduct_id());
				pstmt.executeUpdate();
				
			}
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch(Exception e ) {
			System.out.println("=> insertBuyList() 에러");
			conn.rollback();
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}
