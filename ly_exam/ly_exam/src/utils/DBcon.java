package utils;

import java.sql.*;

public class DBcon {

	private String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/exam?autoReconnect=true&useUnicode=true&characterEncoding=gbk&mysqlEncoding=utf8";
	String username = "root";
	String password = "";
	private Connection conn = null;

	/**
	 * 创建数据库的链接
	 * 
	 * */
	private Connection getConnection() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public ResultSet doQuery(String sql, Object[] params) {

		ResultSet rs = null;
		conn = this.getConnection();
	//	System.out.println(sql);

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}
	
	
	
	
	
	
	
	
	
	public int doUpdate(String sql, Object[] params) {

		int res=0;
		conn = this.getConnection();

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}
	
	public void close(){
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
}
