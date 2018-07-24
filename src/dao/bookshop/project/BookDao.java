package dao.bookshop.project;

import java.sql.*;
import java.util.ArrayList;

import dto.bookshop.project.Book;
import util.connetion.db.DBconnection;

public class BookDao {
	Connection connection;							
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	String sql1;
	
	
{
	}

public void insertBook(Book book) {
	connection = DBconnection.getConnetion();
	
	if(book.getBookAmount()>0) {
		book.setBookOut("재고있음");
	}else {
		book.setBookOut("재고없음");
	}

	try {
		sql1 = "INSERT INTO book (bookcode_no, publisher_no, book_name, book_author, book_price, book_point, book_amount, book_out, book_date) VALUES (?,?,?,?,?,?,?,?, NOW())";
		
		preparedStatement = connection.prepareStatement(sql1);
				 			
		preparedStatement.setInt(1, book.getBookCodeNo());		
		preparedStatement.setInt(2, book.getPublisherNo());
		preparedStatement.setString(3, book.getBookName());
		preparedStatement.setString(4, book.getBookAuthor());
		preparedStatement.setInt(5, book.getBookPrice());
		preparedStatement.setInt(6, book.getBookPoint());
		preparedStatement.setInt(7, book.getBookAmount());
		preparedStatement.setString(8, book.getBookOut());
		
		preparedStatement.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {preparedStatement.close();} catch (SQLException e) {e.printStackTrace();}
		try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		
	}
}

//db에 있는 book데이터들을 조회한다.
public Book selectBook(int bookNo){
	System.out.println("selectBook");
	
	Connection connection=null;
	PreparedStatement statement=null;
	ResultSet resultSet=null;
	
	Book book=new Book();
	String sql="SELECT book_no,bookcode_no,publisher_no,book_name,book_author,book_price,book_point,book_amount,book_out,book_date FROM book where book_no=?";
	
	try {
		connection=DBconnection.getConnetion();
		
		statement=connection.prepareStatement(sql);
		statement.setInt(1, bookNo);
		resultSet=statement.executeQuery();
		
		while(resultSet.next()) {
			book.setBookNo(resultSet.getInt("book_no"));
			book.setBookCodeNo(resultSet.getInt("bookcode_no"));
			book.setPublisherNo(resultSet.getInt("publisher_no"));
			book.setBookName(resultSet.getString("book_name"));
			book.setBookAuthor(resultSet.getString("book_author"));
			book.setBookPrice(resultSet.getInt("book_price"));
			book.setBookPoint(resultSet.getInt("book_point"));
			book.setBookAmount(resultSet.getInt("book_amount"));
			book.setBookOut(resultSet.getString("book_out"));
			book.setBookDate(resultSet.getString("book_date"));
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		
	}
	return book;
}
}