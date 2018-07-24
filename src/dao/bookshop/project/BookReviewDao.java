package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dto.bookshop.project.Bookreview;

public class BookReviewDao {
	
	// 설명 : 책의 리뷰를 데이터베이스에 입력하는 메서드입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 책 리뷰내용이 담긴 Bookreview 클래스객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertBookReview(Connection connection, Bookreview bookReview) {
		
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
}
