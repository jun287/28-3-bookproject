package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.bookshop.project.BookReview;
import util.connetion.db.DBconnection;

public class BookReviewDao {
	
	// 설명 : 책의 리뷰를 데이터베이스에 입력하는 메서드입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 책 리뷰내용이 담긴 Bookreview 클래스객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertBookReview(Connection connection, BookReview bookReview) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("INSERT INTO bookreview(book_no, member_no, bookreview_content) VALUES (?,?,?)");
			preparedStatement.setInt(1, bookReview.getBookNo());
			preparedStatement.setInt(2, bookReview.getMemberNo());
			preparedStatement.setString(3, bookReview.getBookReviewContent());
			
			preparedStatement.executeUpdate();
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			if(preparedStatement != null)try{
				preparedStatement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}

		}
		
	}

	public ArrayList<BookReview> selectBookReview(){
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="select bookreview_no,book_no,member_no,bookreview_content from bookreview";
		ArrayList<BookReview> list=new ArrayList<BookReview>();
		try{
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql);
			resultSet=statement.executeQuery();
			
			while(resultSet.next()) {
				BookReview bookReview=new BookReview();
				bookReview.setBookReviewNo(resultSet.getInt("bookreview_no"));
				bookReview.setBookNo(resultSet.getInt("book_no"));
				bookReview.setMemberNo(resultSet.getInt("member_no"));
				bookReview.setBookReviewContent(resultSet.getString("bookreview_content"));
				
				list.add(bookReview);
			}
			
		}catch(Exception e) {
			
		}finally {
			
		}
		
		return list;
	}
}
