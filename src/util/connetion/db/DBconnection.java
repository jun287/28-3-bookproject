package util.connetion.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	
	public static Connection getConnetion() {
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "java0000";
			
		Connection connection= null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return connection;
	}
}
