package dao.bookshop.project;

import java.sql.*;
import dto.bookshop.project.Book;
import util.connetion.db.DBconnection;

public class BookDao {
	Connection connection;							
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	String sql1;
	String sql2;
	
{
	}

public void insertBook(Book book ) {
	DBconnection.getConnetion();				
	if(book.getBook_amount()>0) {
		book.setBook_out("재고있음");
	}else {
		book.setBook_out("재고없음");
	}
	
	try {
		sql1 = "INSERT INTO book (bookcode_no, publisher_no, book_name, book_author, book_price, book_point, book_amount, book_out, book_date) VALUES (?,?,?,?,?,?,?,?, NOW())";
		
		connection.prepareStatement(sql1);
				 			
		
		preparedStatement.setInt(1, book.getBook_no());		
		preparedStatement.setInt(2, book.getPublisher_no());
		preparedStatement.setString(3, book.getBook_name());
		preparedStatement.setString(4, book.getBook_author());
		preparedStatement.setInt(5, book.getBook_price());
		preparedStatement.setInt(6, book.getBook_point());
		preparedStatement.setInt(7, book.getBook_amount());
		preparedStatement.setString(8, book.getBook_out());
		resultSet = preparedStatement.executeQuery();
		preparedStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {if(resultSet != null) {resultSet.close();}
			if(preparedStatement != null) {preparedStatement.close();}
			if(connection != null) {connection.close();}
		} catch (SQLException e) {e.printStackTrace();}
	}
}
}