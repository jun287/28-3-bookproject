package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.bookshop.project.Admin;

public class AdminDao {
	
	
	public Admin selectAdminInfor(Connection connection, String adminId) {
		
		Admin admin = new Admin();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT * FROM admin WHERE admin_id=?");
			preparedStatement.setString(1, adminId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				admin.setAdminNo(resultSet.getInt("admin_no"));
				admin.setAdminId(resultSet.getString("admin_id"));
				admin.setAdminPw(resultSet.getString("admin_pw"));
				admin.setAdminName(resultSet.getString("admin_name"));
				admin.setAdminDate(resultSet.getString("admin_date"));
			}
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		
		return admin;
	}
	
	public String loginCheckAdmin(Connection connection, String adminId, String adminPw) {
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String result ="";
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT * FROM admin WHERE admin_id=? and admin_pw=?");
			preparedStatement.setString(1, adminId);
			preparedStatement.setString(2, adminPw);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				result = "로그인성공";
			}else {
				result = "로그인실패";
			}
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}finally {
			if(preparedStatement != null)try{
				preparedStatement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
			if(resultSet != null)try{
				resultSet.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
		return result;
	}
}
