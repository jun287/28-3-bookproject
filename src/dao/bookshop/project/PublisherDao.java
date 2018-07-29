package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import dto.bookshop.project.Publisher;
import util.connetion.db.DBconnection;

public class PublisherDao {
	
	public ArrayList<Publisher> selectPublisher(Connection connection) {
		System.out.println("selectPublisher");
		
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="select publisher_no,publisher_name,publisher_website from publisher";
		ArrayList<Publisher> list = new ArrayList<Publisher>();
		
		try {

			statement=connection.prepareStatement(sql);
			
			resultSet=statement.executeQuery();
			
			while(resultSet.next()) {
				Publisher publisher=new Publisher();
				publisher.setPublisherNo(resultSet.getInt("publisher_no"));
				publisher.setPublisherName(resultSet.getString("publisher_name"));
				publisher.setPublisherWebsite(resultSet.getString("publisher_website"));
				
				list.add(publisher);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet!=null) {
					resultSet.close();
				}
			}
			
			catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(statement!=null) {
					statement.close();
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return list;
	}

	//출판사 등록하는 메서드
	//매개변수에 Publisher dto에 있는 데이터를 대입한다.
	public void insertPublisher(String publisherName,String publishersite, Connection connection) {
		System.out.println("insertPublisher");
		
		
		PreparedStatement statement=null;
		
		String sql="insert into publisher(publisher_name,publisher_website) values(?,?)";
	
		try {
			statement=connection.prepareStatement(sql);
			statement.setString(1, publisherName);
			statement.setString(2, publishersite);
			
			statement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(statement!=null) {statement.close();}				
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//no를 이용하여 특정 출판사 정보 조회
	public Publisher selectPublisherNo(int no,Connection connection) {
		System.out.println("selectPublisherNo");
		
		
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="select publisher_no,publisher_name,publisher_website from publisher where publisher_no=?";
		Publisher publisher=new Publisher();
		
		try {

			statement=connection.prepareStatement(sql);
			statement.setInt(1, no);
			
			resultSet=statement.executeQuery();
			
			if(resultSet.next()) {
				publisher.setPublisherNo(resultSet.getInt("publisher_no"));
				publisher.setPublisherName(resultSet.getString("publisher_name"));
				publisher.setPublisherWebsite(resultSet.getString("publisher_website"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet!=null) {
					resultSet.close();
				}
			}
			
			catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(statement!=null) {
					statement.close();
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return publisher;
	}
	public void updatePublisher(int no,String publishername, String publisherwebsite, Connection connection) {
		System.out.println("updatePublisher");
		
		
		PreparedStatement statement=null;
		
		String sql="Update publisher set publisher_name=? ,publisher_website=? where publisher_no=?";
		
		try {
			
			
			statement=connection.prepareStatement(sql);
			statement.setString(1, publishername);
			statement.setString(2, publisherwebsite);
			statement.setInt(3, no);
		
			statement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
				
			try {
				if(statement!=null) {
					statement.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void deletePublisher(int no,Connection connection) {
		
		
		PreparedStatement statement=null;
		PreparedStatement statement1=null;
		
		String sql="delete from book where publisher_no=?";
		String sql1="delete from publisher where publisher_no=?";
		try {
			
			
			statement=connection.prepareStatement(sql);
			statement.setInt(1, no);
			
		
			statement.executeUpdate();
			
			statement1=connection.prepareStatement(sql1);
			statement1.setInt(1, no);
			
			
			statement1.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
			try {
				if(statement!=null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public int selectCount(Connection connection) {
		
		int totalRow = 0;
		
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		try {
			
			statement = connection.prepareStatement("SELECT COUNT(*) FROM publisher");
			resultSet = statement.executeQuery();
			if(resultSet.next()) {
				totalRow = resultSet.getInt("COUNT(*)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet!=null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}try {
				if(statement!=null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return totalRow;
	}
	public ArrayList<Publisher> selectByPagePublisher(int currentpage, int pagePerRow, Connection connection){
		
		ArrayList<Publisher> list = new ArrayList<Publisher>();
		
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		String sql = null;
		
		try {
			
			
			
			 	int startRow = (currentpage-1)*pagePerRow;
				sql = "SELECT publisher_no, publisher_name, publisher_website FROM publisher ORDER BY publisher_no LIMIT ?,?";
				statement = connection.prepareStatement(sql);
				statement.setInt(1, (startRow));
				statement.setInt(2, pagePerRow);
				
							
				
				resultSet = statement.executeQuery();
				
				while(resultSet.next()) {
					
					Publisher publisher = new Publisher();
					publisher.setPublisherNo(resultSet.getInt(1));
					publisher.setPublisherName(resultSet.getString(2));
					publisher.setPublisherWebsite(resultSet.getString(3));
					
					list.add(publisher);
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet!=null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}try {
				if(statement!=null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
		
	}
	
}


