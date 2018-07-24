package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;

import dao.bookshop.project.BookReviewDao;
import dto.bookshop.project.Bookreview;
import util.connetion.db.DBconnection;

public class ServiceBook {
	
	// 설명 : 책의 리뷰를 데이터베이스에 입력하는 메서드입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 책 리뷰내용이 담긴 Bookreview 클래스객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertBookReview(Bookreview bookReview) {
		
		BookReviewDao bookReviewDao = new BookReviewDao();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			bookReviewDao.insertBookReview(connection, bookReview);
			
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
		
	}
}
