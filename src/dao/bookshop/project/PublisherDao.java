package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.connetion.db.DBconnection;

public class PublisherDao {

	//출판사 등록하는 메서드
	//매개변수에 Publisher dto에 있는 데이터를 대입한다.
	public void insertPublisher(String publisherName,String publishersite) {
		System.out.println("insertPublisher");
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		String sql="insert into publisher(publischer_name,publischer_website) values(?,?)";
	
		try {
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql);
			statement.setString(1, publisherName);
			statement.setString(2, publishersite);
			
			statement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}

	//출판사 리스트를 보여주는메서드
	public void selectPublisher() {
		System.out.println("selectPublisher");
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		try {
			connection=DBconnection.getConnetion();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}
	}
}
