package dao.bookshop.project;

import java.sql.*;
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
	DBconnection.getConnetion();				
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
}