package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

	private static Connection conn = null;
	private DBConn() {}
	
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String user ="scott";
		String password = "tiger";
		if(conn == null) {
			String className = "oracle.jdbc.driver.OracleDriver";
		
			synchronized (DBConn.class) { //동기화 해야되는 객체를 잡은것이다.
				try {
					Class.forName(className);
					conn = DriverManager.getConnection(url,user,password);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//Connection 객체 생성
			
			
		}//if
		return conn;
		}
	public static Connection getConnection(String url, String user, String password) {
		
	if(conn == null) {
		String className = "oracle.jdbc.driver.OracleDriver";
	
		synchronized (DBConn.class) { //동기화 해야되는 객체를 잡은것이다.
			try {
				Class.forName(className);
				conn = DriverManager.getConnection(url,user,password);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//Connection 객체 생성
		
		
	}//if
	return conn;
	}
	public static void close() {
		try {
			if(conn!=null && !conn.isClosed()
					) {conn.close();}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			conn = null;
		}
		
	}

}
