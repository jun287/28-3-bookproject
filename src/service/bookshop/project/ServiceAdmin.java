// 2018. 07. 22 공세준

package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;

import dao.bookshop.project.AdminDao;
import dto.bookshop.project.Admin;
import util.connetion.db.DBconnection;

public class ServiceAdmin {
	
	// 설명 : 관리자 로그인 체크후 관리자의 정보를 리턴하는 메서드 입니다.
	// 매개변수 : String 참조 타입으로 관리자 id와 pw를 받습니다.
	// 리턴 : Admin 클래스 타입으로 관리자의 정보가 담긴 객체의 참조값을 리턴합니다.
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
