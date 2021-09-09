package kr.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			}
			
			
			
			
		}catch (Exception e) {
			
		}finally {
			
		}
		return adminVO;
	}

}
