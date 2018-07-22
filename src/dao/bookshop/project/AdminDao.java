// 2018. 07. 22 공세준

package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.bookshop.project.Admin;

public class AdminDao {
	
	// 설명 : 관리자 로그인후 데이터베이스에서 관리자 정보 조회후 리턴하는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 String 참조타입으로 관리자 id를 받습니다.
	// 리턴 : Admin 클래스타입으로 관리자 정보를 담은 객체의 참조값을 리턴합니다.
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
	
	// 설명 : 관리자 로그인 체크 하는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 String 참조 타입으로 관리자 id와 pw를 받습니다.
	// 리턴 : String 참조타입으로 로그인 성공 실패 여부를 리턴합니다.
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
