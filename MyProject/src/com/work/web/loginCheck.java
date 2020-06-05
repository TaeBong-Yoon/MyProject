package com.work.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginCheck {

	public static boolean pass(String id, String password) {
		String pass;
		
		Connection conn = DBUtil.getMySQLConnection();
		
		String sql = "SELECT * FROM member WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("password");
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
			if(pass.equals(password)) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
