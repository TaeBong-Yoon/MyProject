package com.work.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	//0-로그인 성공
	//1-비밀번호가 틀린경우
	//2-아이디가 없는경우
	
	//로그인시 값 확인
	public static int checkRequest(String id, String password) {
		String dbpass;
		int result = 1;
		try {
			Connection conn = DBUtil.getMySQLConnection();
			String sql = "SELECT password FROM member WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpass = rs.getString("password");
				if (dbpass.equals(password)) {
					result = 0;
				} else {
					result = 1;
				}
			} else {
				result = 2;
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//회원가입시 아이디 중복체크
	public static boolean checkID(String id) {
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
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
