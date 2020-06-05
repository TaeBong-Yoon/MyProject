package com.work.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginCheck {

	public static int pass(String id, String password) {
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
				return 1;
			} else if(!password.equals(pass)){
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 2;
	}
	
	public static boolean check(String id) {
		Connection conn = DBUtil.getMySQLConnection();
		
		String sql = "SELECT id FROM member";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("id").equals(id)) {
					return true;
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
}
