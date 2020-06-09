package com.work.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.exceptions.MySQLDataException;

public class DBUtil {
	
	public static Connection getMySQLConnection() {
		Connection con = null;
		//https://developmentnotepad.tistory.com/entry/JDBC-%EC%82%AC%EC%9A%A9-%EC%8B%9C-%EB%B0%9C%EC%83%9D%ED%95%98%EB%8A%94-%EC%98%A4%EB%A5%98
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8";
			String user = "root";
			String password = "111111";
			con = DriverManager.getConnection(url,user,password);
		} catch(ClassNotFoundException e) {
			System.out.println("MySQL 드라이버가 없음.<br />");
		} catch(MySQLDataException e) {
			System.out.println("데이터베이스가 없음.<br />");
		} catch(SQLException e) {
			System.out.println("사용자 계정 또는 비밀번호 불일치.<br />");
		}
		return con;
	}
	public static void close(Connection con) {
		try {
			if(con != null) {
				con.close();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null) {
				stmt.close();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt != null) {
				pstmt.close();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}