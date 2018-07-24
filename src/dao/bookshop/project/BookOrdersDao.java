/* 2018-07-18 김소희 / BookOrdersDao.java */
package dao.bookshop.project;
import util.connetion.db.DBconnection;
import java.sql.*;
import java.util.ArrayList;

import dto.bookshop.project.Orders;

public class BookOrdersDao {
	
	public void selectforUpdateBookPoint (int bookNumber, int ordersNumber) {
		// 책넘버 주문넘버 조회 후 포인트 업데이트
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT book.book_amount, orders.orders_amount FROM orders INNER JOIN book ON orders.book_no=book.book_no WHERE orders.orders_no=? AND book.book_no=?");
			preparedStatement.setInt(1, ordersNumber);
			preparedStatement.setInt(2, bookNumber);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int bookAmount = resultSet.getInt("book_amount");
				int ordersAmount = resultSet.getInt("orders_amount");
				preparedStatement2 =connection.prepareStatement("UPDATE book SET book_amount=? WHERE book_no=?");
				preparedStatement2.setInt(1, (bookAmount-ordersAmount));
				preparedStatement2.setInt(2, bookNumber);
				
			}
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
			
		} finally {
			// 객체 종료 (닫는 순서 중요)
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체 종료
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// DB연결종료
		}
		
	}
	
	public  void updateStateApproval (int ordersNumber) {
		// 상품 진행 상태 바꿔주는 메소드
		// 리턴값 없는 updateStateApproval메소드 (int data type으로 orderNumber매개변수 생성)
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("UPDATE orders SET orders_state='배송완료' WHERE orders_no=?");
			preparedStatement.setInt(1, ordersNumber);
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
			
		} finally {
			// 객체 종료 (닫는 순서 중요)
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체 종료
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// DB연결종료
		}
		
		
	}
	
	public ArrayList<Orders> selectOrdersState (int currentPage, int pagePerRow){
		// 관리자 상품 진행상태 승인 메소드
		// return data type ArrayList<Orders>, selectOrdersState 메소드 (int data type currentPage 매개변수, int data type memberNumber 매개변수 )
		ArrayList<Orders> selectOrdersList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT orders_no, book_no, member_no, orders_price, orders_amount, orders_date, orders_addr ,orders_state FROM orders ORDER BY orders_no DESC LIMIT ?,?");
			preparedStatement.setInt(1, (currentPage-1)*pagePerRow);
			preparedStatement.setInt(2, pagePerRow);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				Orders orders = new Orders();
				//Orders data type으로 orders 변수를 생성하고 new생성자메소드로  생성된 Orders객체의 주소 값을 orders 변수에 할당한다	
				orders.setOrdersNumber(resultSet.getInt("orders_no"));
				orders.setBookNumber(resultSet.getInt("book_no"));
				orders.setOrdersPrice(resultSet.getInt("orders_price"));
				orders.setOrdersAmount(resultSet.getInt("orders_amount"));
				orders.setOrdersDate(resultSet.getString("orders_date"));
				orders.setOrdersAddress(resultSet.getString("orders_addr"));
				orders.setOrderState(resultSet.getString("orders_state"));
				
				selectOrdersList.add(orders);
			}
			
					
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		} finally {
			
			// 객체 종료 (닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체 종료
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
		
		return selectOrdersList;
		
	}
	
	public Orders selectOrdersRecentAddress(int MemberNumber) {
		// 주문정보를 조회하여 가장 최신의 정보를 조회하는 메서드
		// return data type Orders, selectOrdersRecentAddress 메소드 (int data type으로 MemberNumber매개변수 선언)
		// Orders클래스 return하여 조회된 값 세팅 및 불러오기
		// 매개변수는 회원번호를 받아서 주문정보를 조회한다
		Orders orders = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT orders_no,book_no,member_no,orders_price,orders_amount, orders_date,orders_addr,orders_state FROM orders WHERE member_no=? AND orders_no=(SELECT max(orders_no) FROM orders WHERE member_no=?)");
			preparedStatement.setInt(1, MemberNumber);
			preparedStatement.setInt(2, MemberNumber);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				orders = new Orders();
				orders.setOrdersNumber(resultSet.getInt("orders_no"));
				orders.setBookNumber(resultSet.getInt("orders_no"));
				orders.setMemberNumber(resultSet.getInt("member_no"));
				orders.setOrdersPrice(resultSet.getInt("orders_price"));
				orders.setOrdersAmount(resultSet.getInt("orders_amount"));
				orders.setOrdersAddress(resultSet.getString("orders_addr"));
				orders.setOrderState(resultSet.getString("orders_state"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		} finally {
			// 객체 종료 (닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체 종료
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
	
		return orders;
		
	}
	
	public void insertBookOrders (Orders orders) {
		// orders테이블에 주문정보를 추가하는 메서드
		// 리턴값 없는 insertBookOrders 메소드 (Orders data type orders 매개변수 생성)
		Connection connection = null;			
		PreparedStatement  preparedStatement= null;
		
		try{
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("INSERT INTO orders (book_no, member_no, orders_price, orders_amount, orders_date, orders_addr, orders_state) VALUES (?, ?, ?, ?, NOW(), ?, '주문완료')");
			preparedStatement.setInt(1, orders.getBookNumber());
			preparedStatement.setInt(2, orders.getMemberNumber());
			preparedStatement.setInt(3, orders.getOrdersPrice());
			preparedStatement.setInt(4, orders.getOrdersAmount());
			preparedStatement.setString(5, orders.getOrdersAddress());
			System.out.println(orders.getOrdersAddress());
			
			preparedStatement.executeUpdate();
			
		
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		}finally {
			// 객체 종료 (닫는 순서 중요)
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체 종료
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
	}
	
	public Orders selectOrders(int ordersNumber) {
		// 한 개의 주문 조회하는 메소드
		// return data type Orders, orederSelectUpdate 메소드 (int data type으로  ordersNumber 매개변수 생성
		Orders orders = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT orders_no, book_no, member_no, orders_price, orders_amount, orders_date, orders_addr, orders_state FROM orders WHERE orders_no=?");
			preparedStatement.setInt(1, ordersNumber);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				orders = new Orders();
				orders.setOrdersNumber(resultSet.getInt("orders_no"));
				orders.setBookNumber(resultSet.getInt("book_no"));
				orders.setMemberNumber(resultSet.getInt("member_no"));
				orders.setOrdersPrice(resultSet.getInt("orders_price"));
				orders.setOrdersAmount(resultSet.getInt("orders_amount"));
				orders.setOrdersAddress(resultSet.getString("orders_addr"));
				orders.setOrderState(resultSet.getString("orders_state"));
				orders.setOrdersDate(resultSet.getString("orders_date"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		} finally {
			// 객체 종료(닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체 종료
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
	
		return orders;
		
	}
	

	public int selectCount() {
		// 페이징하는 메소드
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
			System.out.println("예외발생");
			e.printStackTrace();
		} finally {
			// 객체종료 (닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체종료
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
		
		
		return totalRow;
		
	}
	
	public ArrayList<Orders> selectOrderByPage (int currentPage, int pagePerRow, int memberNumber){
		// 상품 주문 정보 리스트로 받는 메소드
		// return data type ArrayList<Orders>, selectOrderBypage 메소드 (int data type currentPage 매개변수, int data type memberNumber)
		ArrayList<Orders> ordersList = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT orders_no, book_no, member_no, orders_price, orders_amount, orders_date, orders_addr ,orders_state FROM orders WHERE member_no=? ORDER BY orders_no DESC LIMIT ?,?");
			preparedStatement.setInt(1, memberNumber);
			preparedStatement.setInt(2, (currentPage-1)*pagePerRow);
			preparedStatement.setInt(3, pagePerRow);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				Orders orders = new Orders();
				//Orders data type으로 orders 변수를 생성하고 new생성자메소드로  생성된 Orders객체의 주소 값을 orders 변수에 할당한다	
				orders.setOrdersNumber(resultSet.getInt("orders_no"));
				orders.setBookNumber(resultSet.getInt("book_no"));
				orders.setOrdersPrice(resultSet.getInt("orders_price"));
				orders.setOrdersAmount(resultSet.getInt("orders_amount"));
				orders.setOrdersDate(resultSet.getString("orders_date"));
				orders.setOrdersAddress(resultSet.getString("orders_addr"));
				orders.setOrderState(resultSet.getString("orders_state"));
				
				ordersList.add(orders);
			}
			
					
		} catch (SQLException e) {
			System.out.println("예외발생");
			e.printStackTrace();
		} finally {
			
			// 객체 종료 (닫는 순서 중요)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 객체 종료
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// DB연결종료
			
		}
		
		
		return ordersList;

	}
	
}
