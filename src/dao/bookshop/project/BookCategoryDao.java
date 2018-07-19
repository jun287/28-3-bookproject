package dao.bookshop.project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.bookshop.project.BookCode;

import java.sql.PreparedStatement;

import util.connetion.db.DBconnection;

public class BookCategoryDao {
	
	//ī�װ� �߰��ϴ� �޼���
	//�Ű������� ī�װ� �̸��� �޾Ƽ� �����Ѵ�.
	public void insertBookCategory(String category) {
		Connection connection=null;
		PreparedStatement statement=null;

		//
		String sql="insert into bookcode(bookcode_name) values(?)";
		try {
			//db����
			connection=DBconnection.getConnetion();
			
			//���������غ�
			statement=connection.prepareStatement(sql);
			statement.setString(1, category);
			//��������
			statement.executeUpdate();
		
		}catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			//��ü�ݳ�
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
			
		}
		
	}
	
	//db�� ����Ǿ� �ִ� ī�װ��� ���� ��ȸ�ϴ� �޼ҵ�
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
				bookCode.setBookcode_name(resultSet.getString("bookcode_name"));
				
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
}