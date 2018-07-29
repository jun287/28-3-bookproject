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

	public ArrayList<BookReview> selectBookReview(int bookNo,int currentPage,int row){
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="select bookreview_no,book_no,member_no,bookreview_content from bookreview where book_no=?  order by bookreview_no desc limit ?,? ";
		ArrayList<BookReview> list=new ArrayList<BookReview>();
		try{
			connection=DBconnection.getConnetion();
			int start=(currentPage-1)*row;
			statement=connection.prepareStatement(sql);
			statement.setInt(1, bookNo);
			statement.setInt(2, start);
			statement.setInt(3, row);
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
			try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return list;
	}

	public BookReview updateBookReviewForm(int bookReivewNo) {
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="select bookreview_no,book_no,member_no,bookreview_content from bookreview where bookreview_no=?";
		
		BookReview bookReview =new BookReview();
		try {
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql);
			statement.setInt(1, bookReivewNo);
			
			resultSet=statement.executeQuery();
			if(resultSet.next()) {
				bookReview.setBookReviewNo(resultSet.getInt("bookreview_no"));
				bookReview.setBookNo(resultSet.getInt("book_no"));
				bookReview.setMemberNo(resultSet.getInt("member_no"));
				bookReview.setBookReviewContent(resultSet.getString("bookreview_content"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return bookReview;
	}

	public void updateBookReivew(BookReview bookReview) {
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="update bookreview set bookreview_content=?  where bookreview_no=?";
		
	
		try {
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql);
			statement.setString(1, bookReview.getBookReviewContent());
			statement.setInt(2, bookReview.getBookReviewNo());
			
			statement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	public void deleteReview(int bookReviewNo,String memberId) {
		Connection connection=null;
		PreparedStatement statement=null;
		PreparedStatement statement1=null;
		ResultSet resultSet=null;
		
		String sql="delete from bookreview where bookreview_no=? and member_no=? ";
		String sql1="select * from member where member_id=?";
		
	
		try {
			
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql1);
			statement.setString(1, memberId);
			
			resultSet=statement.executeQuery();
			
			if(resultSet.next()) {
				statement1=connection.prepareStatement(sql);
				
				statement1.setInt(1, bookReviewNo);
				statement1.setInt(2, resultSet.getInt("member_no"));
		
				statement1.executeUpdate();
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement1.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}

	public int paging(int StartRow) {
		
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultset=null;
		
		//employee table에 있는 갯수를 조회하여라
		String sql="select count(*) from bookreview";
		
		int total=0;
		
		try {
			
			//db연결
			connection=DBconnection.getConnetion();
			
			//쿼리 실행 준비
			statement=connection.prepareStatement(sql);
			//쿼리 실행
			resultset=statement.executeQuery();
			
			//총 몇페이지인지로 할건지 total변수를 선언하고 값을 0으로 초기화한다
			
			
			//쿼리 실행해서 조회한 결과 가있으면 실행문을 실행
			if(resultset.next()){
				// 총갯수에 출력할 갯수를 나눠서 0이면 total에 나눈 값을 대입하고 아니면 나눈값에 1을 더해서 대입한다
				if(resultset.getInt("count(*)")%StartRow==0){
					total=resultset.getInt("count(*)")/StartRow;
				}else{
					total=(resultset.getInt("count(*)")/StartRow)+1;
				}
			}
		
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {resultset.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return total;
	}
	
	
}
