/* 2018-07-18 김소희 / BookOrdersDao.java */
package dao.bookshop.project;
import util.connetion.db.DBconnection;
import java.sql.*;
import java.util.ArrayList;

import dto.bookshop.project.Orders;

public class BookOrdersDao {

	
	
	public Orders orederSelectUpdate(int ordersNumber) {
		// 한 개의 주문 조회하는 메소드
		// return data type Orders, orederSelectUpdate 메소드 (int data type으로  ordersNumber 매개변수 생성)
		Orders orders = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT orders_no,book_no,member_no,orders_price,orders_amount, orders_date,orders_addr,orders_state FROM orders WHERE orders_no=?");
			preparedStatement.setInt(1, ordersNumber);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				orders = new Orders();
				orders.setOrdersNumber(resultSet.getInt("orderNumber"));
				orders.setBookNumber(resultSet.getInt("bookNumber"));
				orders.setMemberNumber(resultSet.getInt("memberNumber"));
				orders.setOrdersPrice(resultSet.getInt("ordersPrice"));
				orders.setOrdersAmount(resultSet.getInt("ordersAmount"));
				orders.setOrdersAddress(resultSet.getString("orderAddress"));
				orders.setOrderState(resultSet.getString("orderState"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			// 객체 종료(닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 쿼리연결종료
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
	
		return orders;
		
	}
	
	public ArrayList<Orders> selectBookOrders (int bookNumber){
		// 상품 클릭시 상세정보 나오게
		// return data type ArrayList<Orders>, selectBookOrders 메소드 (int data type으로 매개변수 bookNumber 생성 )
		ArrayList<Orders> ordersList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT orders_no, book_no, member_no, orders_price, orders_amount, orders_date, orders_addr, orders_state FROM orders  WHERE book_no=?");
			preparedStatement.setInt(1, bookNumber);
			
			resultSet = preparedStatement.executeQuery();
			
		while(resultSet.next()) {
			Orders orders = new Orders();
			
			orders.setOrdersNumber(resultSet.getInt("orderNumber"));
			orders.setBookNumber(resultSet.getInt("bookNumber"));
			orders.setOrdersPrice(resultSet.getInt("ordersPrice"));
			orders.setOrdersAmount(resultSet.getInt("ordersAmount"));
			orders.setOrdersDate(resultSet.getString("ordersDate"));
			orders.setOrdersAddress(resultSet.getString("ordersAddress"));
			orders.setOrderState(resultSet.getString("ordersState"));
			
			ordersList.add(orders);
			
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			// 객체 종료(닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 쿼리연결종료
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
		
			
		return ordersList;
		
	}
	
	public int selectCount() {
		// 페이징 하는 메소드
		// return data type int, selectCount 메소드 (매개변수 없음)
		int totalRow = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM orders");	
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				totalRow = resultSet.getInt("COUNT(*)");
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			// 객체 종료(닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 쿼리연결종료
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
		
		
		return totalRow;
		
	}
	
	public ArrayList<Orders> selectOrderByPage (int currentPage, int rowPerPage){
		// return data type ArrayList<Orders>, selectOrderBypage 메소드 (int data type으로 currentPage 매개변수 선언, int data type으로 pagePerRow 매개변수 선언 )
		ArrayList<Orders> ordersList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT orders_no, book_no, member_no, orders_price, orders_amount, orders_date, orders_addr ,orders_state FROM orders ORDER BY orders_no DESC LIMIT ?,?");
			preparedStatement.setInt(1, (currentPage-1)*rowPerPage);
			preparedStatement.setInt(2, rowPerPage);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				Orders orders = new Orders();
				//Orders data type으로 o 변수를 생성하고 new생성자메소드로  생성된 Orders객체의 주소 값을 o 변수에 할당한다	
				orders.setBookNumber(resultSet.getInt("bookNumber"));
				orders.setOrdersPrice(resultSet.getInt("ordersPrice"));
				orders.setOrdersAmount(resultSet.getInt("ordersAmount"));
				orders.setOrdersDate(resultSet.getString("ordersDate"));
				orders.setOrdersAddress(resultSet.getString("ordersAddress"));
				orders.setOrderState(resultSet.getString("ordersState"));
				
				ordersList.add(orders);
			}
			
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			// 객체 종료(닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 쿼리연결종료
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
		
		
		return ordersList;
		
	}
	
}
