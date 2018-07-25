package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.bookshop.project.BookDao;
import dao.bookshop.project.BookReviewDao;
import dto.bookshop.project.BookAndPublisherAndBookCode;
import dto.bookshop.project.BookReview;
import util.connetion.db.DBconnection;

public class ServiceBook {
	
	// 설명 : 책의 리뷰를 데이터베이스에 입력하는 메서드입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 책 리뷰내용이 담긴 Bookreview 클래스객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertBookReview(BookReview bookReview) {
		
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
	/*
	메소드 설명	
	1. 용도 : 전체 책을 검색조건에 맞춰 조회, 검색조건없을시 전체조회(DB book,bookcode,publisher inner join 특정조건 행 조회)
	2. 매개변수 : String beginDate(검색시작날짜), String endDate(검색종료날짜), String searchCategory(검색구분), String searchKeyword(검색단어), int currentPage(현재페이지), int pagePerRow(페이지당 볼 행의 수)
	3. 리턴값 : ArrayList<BookAndPublisherAndBookCode>
	4. BookAndPublisherAndBookCode Class 프로퍼티
		- 접근지정자는 모두 private임.
			Book book, Publisher publisher, BookCode bookCode; 
	5. 2018. 7. 25(수) 이원상
	*/
	public ArrayList<BookAndPublisherAndBookCode> selectBookListSearchByPage(String beginDate, String endDate, String searchKeyword, String searchCategory, int currentPage, int pagePerRow){
		Connection connection = null;
		ArrayList<BookAndPublisherAndBookCode> bookAndPublisherAndBookCodeList = new ArrayList<BookAndPublisherAndBookCode>();
		connection = DBconnection.getConnetion();
		try {
			connection.setAutoCommit(false);
			BookDao bookDao = new BookDao();
			bookAndPublisherAndBookCodeList = bookDao.selectBookListSearchByPage(beginDate, endDate, searchKeyword, searchCategory, currentPage, pagePerRow, connection);
			connection.commit();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				connection.setAutoCommit(true);
				if(connection !=null) {connection.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bookAndPublisherAndBookCodeList;
	}
	
	/*
	메소드 설명	
	1. 용도 : 전체 책을 검색조건에 맞춰 조회, 검색조건없을시 전체조회한 행의 수를 구해 검색조건에 맞는 lastPage를 구하는 메소드(DB book,bookcode,publisher inner join 특정조건 행의 수 조회)
	2. 매개변수 : String beginDate(검색시작날짜), String endDate(검색종료날짜), String searchCategory(검색구분), String searchKeyword(검색단어), int currentPage(현재페이지), int pagePerRow(페이지당 볼 행의 수)
	3. 리턴값 : lastPage(검색조건에 맞게 변하는 lastPage를 구해 정수로 리턴)
	4. BookAndPublisherAndBookCode Class 프로퍼티
		- 접근지정자는 모두 private임.
			Book book, Publisher publisher, BookCode bookCode;
	5. 2018. 7. 25(수) 이원상
	*/
	public int checkBookListLastPage(String beginDate, String endDate, String searchKeyword, String searchCategory, int currentPage, int pagePerRow) {
		Connection connection = null;
		int lastPage = 0;
		connection = DBconnection.getConnetion();
		try {
			connection.setAutoCommit(false);
			BookDao bookDao = new BookDao();
			lastPage = bookDao.checkBookListLastPage(beginDate, endDate, searchKeyword, searchCategory, currentPage, pagePerRow, connection);
			connection.commit();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				connection.setAutoCommit(true);
				if(connection !=null) {connection.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lastPage;
	}
}
