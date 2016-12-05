package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {

	// 数据库初始化
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/webshop";
	private static final String USER = "root";
	private static final String PASSWORD = "gyw419927";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rst = null;

	// 数据库连接
	public Connection getConn() {
		try {
			// 加载驱动
			Class.forName(DRIVER);
			// 尝试连接
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 增、删、改初始化
	public int exceUpdate(String sql, Object... param) {
		int num = 0;
		try {
			// 得到连接
			conn = getConn();
			// 发送sql语句
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < param.length; i++) {
				pstmt.setObject(i + 1, param[i]);
			}
			// 执行增、删、改操作
			num = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return num;
	}

	// 查询初始化
	public ResultSet exceQuery(String sql, Object... param) {
		try {
			// 得到连接
			conn = getConn();
			// 发送sql语句
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < param.length; i++) {
				pstmt.setObject(i + 1, param[i]);
			}
			// 执行查询操作
			rst = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rst;
	}

	public void closeAll() {
		// TODO Auto-generated method stub
		try {
			if (rst != null) {
				rst.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
