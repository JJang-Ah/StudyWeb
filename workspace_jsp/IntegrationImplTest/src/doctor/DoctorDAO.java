package doctor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtil;

public class DoctorDAO {
	// 싱글톤 패턴
	private DoctorDAO() {}
	private static DoctorDAO doctorDAO = new DoctorDAO();	
	public static DoctorDAO getInstance( ) {
		return doctorDAO;
	}
	//DB 연결 설정
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 의사 목록
	public List<DoctorDTO> getDoctorList() {
		String sql = "select * from doctor order by name";
		List<DoctorDTO> doctorList = new ArrayList<DoctorDTO>();
		DoctorDTO doctor = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				doctor = new DoctorDTO();
				doctor.setId(rs.getString("id"));
				doctor.setPassword(rs.getString("password"));
				doctor.setName(rs.getString("name"));
				doctor.setSnum(rs.getString("snum"));
				doctor.setMajor(rs.getString("major"));
				doctor.setTel(rs.getString("tel"));
				doctor.setAddress(rs.getString("address"));
				doctor.setEmail(rs.getString("email"));
				doctorList.add(doctor);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return doctorList;
	}
	// 의사 명수
	public int getDoctorCount() {
		String sql = "select count(*) from doctor";
		int cnt = 0;
		try {
			conn=JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return cnt;
	}
	
	// 의사 등록
	public int insertDoctor(DoctorDTO doctor) {
		String sql = "insert into doctor values(?, ?, ?, ?, ?, ?, ?, ?)";
		int cnt = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doctor.getId());
			pstmt.setString(2, doctor.getPassword());
			pstmt.setString(3, doctor.getName());
			pstmt.setString(4, doctor.getSnum());
			pstmt.setString(5, doctor.getMajor());
			pstmt.setString(6, doctor.getTel());
			pstmt.setString(7, doctor.getAddress());
			pstmt.setString(8, doctor.getEmail());
			cnt = pstmt.executeUpdate();
			rs = pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return cnt;
	}
	
	// 의사 상세보기
	public DoctorDTO getDoctor(String id) {
		String sql ="select * from doctor where id=?";
		DoctorDTO doctor = new DoctorDTO();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				doctor.setId(id);
				doctor.setName(rs.getString("name"));
				doctor.setSnum(rs.getString("snum"));
				doctor.setMajor(rs.getString("major"));
				doctor.setTel(rs.getString("tel"));
				doctor.setAddress(rs.getString("address"));
				doctor.setEmail(rs.getString("email"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return doctor;
	}
	// 회원 수정
	public int updateDoctor(DoctorDTO doctor) {
		String sql ="update doctor set name=?, snum=?, major=?, tel=?, address=?, email=?, where id=?";
		int cnt = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, doctor.getName());
			pstmt.setString(2, doctor.getSnum());
			pstmt.setString(3, doctor.getMajor());
			pstmt.setString(4, doctor.getTel());
			pstmt.setString(5, doctor.getAddress());
			pstmt.setString(6, doctor.getEmail());
			pstmt.setString(7, doctor.getId());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return cnt;
	}

	public int deleteDoctor(String id, String password) {
		String sql = "delete from doctor where id=? and password=?";
		int cnt = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.executeQuery();
		} catch(Exception e) {
			// 트랜잭션 처리시에 예외가 발생했을 때 롤백
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return cnt;
	}
}
