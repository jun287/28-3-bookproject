package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.bookshop.project.Publisher;
import util.connetion.db.DBconnection;

public class PublisherDao {

	//출판사 등록하는 메서드
	//매개변수에 Publisher dto에 있는 데이터를 대입한다.
	public void insertPublisher(String publisherName,String publishersite) {
		System.out.println("insertPublisher");
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		String sql="insert into publisher(publisher_name,publisher_website) values(?,?)";
	
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
	public ArrayList<Publisher> selectPublisher() {
		System.out.println("selectPublisher");
		
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		String sql="select publisher_no,publisher_name,publisher_website from publisher";
		ArrayList<Publisher> list=new ArrayList<Publisher>();
		try {
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql);
			
			resultSet=statement.executeQuery();
			while(resultSet.next()) {
				Publisher publisher=new Publisher();
				
				publisher.setPublischerNo(resultSet.getInt("publisher_no"));
				publisher.setPublischerName(resultSet.getString("publisher_name"));
				publisher.setPublischerWebsite(resultSet.getString("publisher_website"));
				
				list.add(publisher);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return list;
	}

	
}
