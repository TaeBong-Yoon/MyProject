package com.work.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.net.httpserver.Authenticator.Result;

public class MemberDAO {

	// 0-로그인 성공
	// 1-비밀번호가 틀린경우
	// 2-아이디가 없는경우

	// 로그인시 값 확인
	public static int checkRequest(String id, String password) {
		
		Connection conn = DBUtil.getMySQLConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT password FROM member WHERE id=?";
		String dbpass;
		int result = 1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

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
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원가입시 아이디 중복체크
	public static boolean checkID(String id) {
		
		Connection conn = DBUtil.getMySQLConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT id FROM member";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("id").equals(id)) {
					return true;
				}
			}
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// 아이디 찾기
	public static String findID(String name, String phone) {
		
		Connection conn = DBUtil.getMySQLConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT id FROM member WHERE name=? AND phone=?";
		String result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("id");
			}
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 비밀번호 찾기
	public static String findPW(String id, String name) {

		Connection conn = DBUtil.getMySQLConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String sql = "SELECT password FROM member WHERE id=? AND name=?";

		String result = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getString("password");
			}
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// modifyForm - name 정보
	public static String nameViewForModify(String id) {
		
		Connection conn = DBUtil.getMySQLConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT name FROM member WHERE id=?";
		String name = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				name = rs.getString("name");
			}
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}

	// modify_OK - 회원정보 수정
	public static boolean modifyUserInfo(String id, String password, int age, String phone) {
		
		Connection conn = DBUtil.getMySQLConnection();
		PreparedStatement pstmt = null;

		String sql = "UPDATE member SET password=?, age=?, phone=? WHERE id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setInt(2, age);
			pstmt.setString(3, phone);
			pstmt.setString(4, id);
			int a = pstmt.executeUpdate();

			if (a == 1) {
				return true;
			}
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// 회원 삭제
	public static boolean deleteUserInfo(String id, String password) {
		
		Connection conn = DBUtil.getMySQLConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT password FROM member WHERE id=?";
		
		boolean result = false;
		String dbpass = "";
		System.out.println("requeset id :" + id + " , " + password);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpass = rs.getString("password");
				if (dbpass.equals(password)) {
					String delsql = "DELETE FROM member WHERE id=?";
					pstmt = conn.prepareStatement(delsql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = true;
				}
			}
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
