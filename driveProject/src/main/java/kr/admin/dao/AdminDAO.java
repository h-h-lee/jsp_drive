package kr.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.admin.vo.AdminVO;
import kr.util.DBUtil;

/**
 * FileName : AdminDAO.java
 * @date :2021. 9. 9.
 * @author: 최유정
 * @description : 1.관리자 로그인DAO
 */
public class AdminDAO {
	
	private static AdminDAO instance = new AdminDAO();
	
	public static AdminDAO getInstance() {
		return instance;
	}
	
	//로그인
	public AdminVO adminLogin(String admin_id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		AdminVO adminVO = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM admin WHERE admin_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, admin_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				adminVO = new AdminVO();
				
				adminVO.setAdmin_num(rs.getInt("admin_num"));
				adminVO.setAdmin_id(rs.getString("admin_id"));
				adminVO.setAdmin_name(rs.getString("admin_name"));
				adminVO.setAdmin_passwd(rs.getString("admin_passwd"));
				adminVO.setAdmin_auth(rs.getInt("admin_auth"));
			}
			
			
		}catch (Exception e) {
			
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return adminVO;
	}
	
	//나의 정보 수정
	public void myPageModify(AdminVO adminVO) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql= null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "UPDATE admin SET admin_name=?, admin_passwd=? WHERE admin_num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adminVO.getAdmin_name());
			pstmt.setString(2, adminVO.getAdmin_passwd());
			pstmt.setInt(3, adminVO.getAdmin_num());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	
	//일반관리자 추가
	public void adminAdd(AdminVO adminVO) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			
			conn = DBUtil.getConnection();
			
			sql = "INSERT INTO admin(admin_num, admin_id, admin_name, admin_passwd, admin_auth ) VALUES (admin_seq.nextVal, ?, ?, ?, ? )";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminVO.getAdmin_id());
			pstmt.setString(2, adminVO.getAdmin_name());
			pstmt.setString(3, adminVO.getAdmin_passwd());
			pstmt.setInt(4, adminVO.getAdmin_auth());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
			
	}
	
	//관리자 전체 리스트
	public List<AdminVO> adminList() throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		AdminVO adminVO = null;
		List<AdminVO> list = null;

		try {
			
			conn = DBUtil.getConnection();
			
			sql = "SELECT * FROM admin ORDER BY admin_num DESC";
			
			pstmt =conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<AdminVO>();
			while(rs.next()) {
				
				adminVO = new AdminVO();
				
				adminVO.setAdmin_num(rs.getInt("admin_num"));
				adminVO.setAdmin_id(rs.getString("admin_id"));
				adminVO.setAdmin_name(rs.getString("admin_name"));
				adminVO.setAdmin_auth(rs.getInt("admin_auth"));
				adminVO.setAdmin_passwd(rs.getString("admin_passwd"));
				
				list.add(adminVO);
			}
			
		}catch (Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}

}













