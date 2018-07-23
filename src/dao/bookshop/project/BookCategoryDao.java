package dao.bookshop.project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.bookshop.project.BookCode;

import java.sql.PreparedStatement;

import util.connetion.db.DBconnection;

public class BookCategoryDao {
	
	//카테고리 추가하는 메서드
	//매개변수에 카테고리 이름을 받아서 저장한다.
	public void insertBookCategory(String category) {
		Connection connection=null;
		PreparedStatement statement=null;

		//
		String sql="insert into bookcode(bookcode_name) values(?)";
		try {
			//db연결
			connection=DBconnection.getConnetion();
			
			//쿼리실행준비
			statement=connection.prepareStatement(sql);
			statement.setString(1, category);
			//쿼리실행
			statement.executeUpdate();
		
		}catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			//객체반납
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
			
		}
		
	}
	
	//db에 저장되어 있는 카테고리를 전부 조회하는 메소드
	public ArrayList<BookCode> selectBookCategory(){
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		ArrayList<BookCode> list=new ArrayList<BookCode>();
		String sql="select bookcode_no,bookcode_name from bookcode";
		try {
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql);
			resultSet=statement.executeQuery();
			
			while(resultSet.next()) {
				BookCode bookCode=new BookCode();
				bookCode.setBookCodeNo(resultSet.getInt("bookcode_no"));
				bookCode.setBookCodeName(resultSet.getString("bookcode_name"));
				
				list.add(bookCode);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return list;
	}

	//특정 no에 대한 조회하는 메서드 
	//매개변수에 no에 값을 대입하여 조회한다
	public BookCode selectBookCategorytupdateFrom(int no) {
		System.out.println("selectupdateFrom");
		
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="select bookcode_no,bookcode_name from bookcode where bookcode_no=?";
		
		BookCode bookCode=new BookCode();
		
		try {
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql);
			statement.setInt(1, no);
			
			resultSet=statement.executeQuery();
			
			if(resultSet.next()) {
			
				bookCode.setBookCodeNo(resultSet.getInt("bookcode_no"));
				bookCode.setBookCodeName(resultSet.getString("bookcode_name"));
			
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return bookCode;
	}

	//카테고리 수정
	//조회할 no값과 수정한 카테고리이름을 매개변수에 대입한다.
	public void updateBookCategory(int no,String categoryName) {
		System.out.println("updateBookCategory");
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		String sql="Update bookcode set bookcode_name=? where bookcode_no=?";
		
		try {
			connection=DBconnection.getConnetion();
			
			statement=connection.prepareStatement(sql);
			statement.setString(1, categoryName);
			statement.setInt(2, no);
		
			statement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}

	//카테고리 삭제
	//삭제할 no값을 매개변수에 대입
	public void deleteBookCategory(int no) {
		System.out.println("deleteBookCategory");
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		String sql="delete from bookcode where bookcode_no=?";
		
		try {
			connection=DBconnection.getConnetion();
			
			statement=connection.prepareStatement(sql);
			statement.setInt(1, no);
			
			statement.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
}