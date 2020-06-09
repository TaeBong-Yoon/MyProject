package com.work.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Withdrawl {

	//회원 삭제 - MemberDAO로 옮길수 있도록 노력!
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
				if (dbpass.equals(password)) {
					String delsql = "DELETE FROM member WHERE id=?";
					pstmt = conn.prepareStatement(delsql);
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
