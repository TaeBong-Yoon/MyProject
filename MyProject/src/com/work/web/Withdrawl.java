package com.work.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Withdrawl {

//	public static void modifyUserInfo(String id) {
//		Connection conn = DBUtil.getMySQLConnection();
//		
//		String sql = "SELECT id FROM member";
//		
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				if(rs.getString("id").equals(id)) {
//				}
//			}
//		}catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}

	public static boolean deleteUserInfo(String id, String password) {
		boolean result = false;
		String dbpass = "";
		System.out.println("requeset id :" + id + " , " + password);
		try {
			
			System.out.println("1:"+id);
			
			Connection conn = DBUtil.getMySQLConnection();
			String sql = "SELECT password FROM member WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println("2:"+id);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpass = rs.getString("password");
				System.out.println("dbpass : "+dbpass);
				if (dbpass.equals(password)) {
					String delsql = "DELETE FROM member WHERE id=?";
					pstmt = conn.prepareStatement(delsql);
					System.out.println("id : "+id);
					pstmt.setString(1, id);
					pstmt.executeUpdate();//https://ammff.tistory.com/96
					result = true;
				}
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
