package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;

import dao.bookshop.project.AdminDao;
import dto.bookshop.project.Admin;
import util.connetion.db.DBconnection;

public class ServiceAdmin {
	
	public Admin loginAdmin(String adminId, String adminPw) {
		
		AdminDao adminDao = new AdminDao();
		Admin admin = new Admin();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			String result = adminDao.loginCheckAdmin(connection, adminId, adminPw);
			
			if(result.equals("로그인성공")){
				admin = adminDao.selectAdminInfor(connection, adminId);
			}else if(result.equals("로그인실패")) {
				admin = null;
			}
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
		
		return admin;
	}
}
