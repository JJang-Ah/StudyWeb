package manager.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;

public class ProductDAO {
	// Singleton Parttern
	private ProductDAO() { }
	
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	//DB 연결, 질의를 위한 객체 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 상품 등록 메소드
	public void insertProduct(ProductDTO product) {
		String sql = "insert into product(product_kind, product_name, product_price, product_count"
				+ ", author, publishing_com, publishing_date, product_image, product_content, discount_rate) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getProduct_kind());
			pstmt.setString(2,  product.getProduct_name());
			pstmt.setInt(3, product.getProduct_price());
			pstmt.setInt(4, product.getProduct_count());
			pstmt.setString(5, product.getAuthor());
			pstmt.setString(6, product.getPublishing_com());
			pstmt.setString(7, product.getPublishing_date());
			pstmt.setString(8, product.getProduct_image());
			pstmt.setString(9, product.getProduct_content());
			pstmt.setInt(10, product.getDiscount_rate());
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("insertProduct 메소드: " + e.getMessage());
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 전체 상품 수 조회 메소드
	public int getProductCount() {
		String sql = "select count(*) from product";
		int cnt = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);	
		} catch(Exception e) {
			System.out.println("getProductCount 메소드: " + e.getMessage());
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return cnt;
	}
	
	// 전체 상품 조회 메소드
	public List<ProductDTO> getProductList() {
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		ProductDTO product = null;
		String sql = "select * from product";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				product = new ProductDTO();
				// product_content를 제외한 11개 필드의 정보를 담아 list로 넘겨준다.
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_kind(rs.getString("product_kind"));
				product.setProduct_name(rs.getNString("product_name"));
				product.setProduct_price(rs.getInt("product_price"));
				product.setProduct_count(rs.getInt("product_count"));
				product.setAuthor(rs.getString("author"));
				product.setPublishing_com(rs.getString("publishing_com"));
				product.setPublisging_date(rs.getString("publishing_date"));
				product.setProduct_image(rs.getString("product_image"));
				product.setDiscount_rate(rs.getInt("discount_rate"));
				product.setReg_date(rs.getTimestamp("reg_date"));
				productList.add(product);
			}
			
		} catch(Exception e) {
			System.out.println("getProductList 메소드: " + e.getMessage());
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return productList;
	}
	
	// 상품 상세보기(1건) 메소드
	public ProductDTO getProduct(int product_id) {
		ProductDTO product = new ProductDTO();
		String sql = "select * from product where product_id = ?";
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			// product상품에 대한 12가지의 필드의 정보를 담는다.
			product.setProduct_id(rs.getInt("product_id"));
			product.setProduct_kind(rs.getString("product_kind"));
			product.setProduct_name(rs.getNString("product_name"));
			product.setProduct_price(rs.getInt("product_price"));
			product.setProduct_count(rs.getInt("product_count"));
			product.setAuthor(rs.getString("author"));
			product.setPublishing_com(rs.getString("publishing_com"));
			product.setPublisging_date(rs.getString("publishing_date"));
			product.setProduct_image(rs.getString("product_image"));
			product.setProduct_content(rs.getString("product_content"));
			product.setDiscount_rate(rs.getInt("discount_rate"));
			product.setReg_date(rs.getTimestamp("reg_date"));
			
		} catch(Exception e) {
			System.out.println("getProduct 메소드: " + e.getMessage());
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return product;
	}
	
	
}
