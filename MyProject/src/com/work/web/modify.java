package com.work.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class modify {

	public static void modifyUserInfo(String id) {
		Connection conn = DBUtil.getMySQLConnection();
		
		String sql = "SELECT id FROM member";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("id").equals(id)) {
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteUserInfo(String id) {
		Connection conn = DBUtil.getMySQLConnection();
		
		String sql = "SELECT id FROM member";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("id").equals(id)) {
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
