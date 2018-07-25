package service.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import dao.bookshop.project.BookOrdersDao;
import dao.bookshop.project.MemberDao;
import dao.bookshop.project.ShoppingCartDao;
import dto.bookshop.project.Book;
import dto.bookshop.project.Orders;
import util.connetion.db.DBconnection;

public class ServiceBookOrders {
	
	public ArrayList<Orders> selectOrderByPage (int currentPage, int pagePerRow, int memberNumber){
		// 상품 주문 정보 리스트로 받는 메소드
		// return data type ArrayList<Orders>, selectOrderBypage 메소드 (int data type currentPage 매개변수, int data type memberNumber 매개변수 생성)
		ArrayList<Orders> ordersList = new  ArrayList<Orders>();
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Connection connection = null;
	
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			ordersList = bookOrdersDao.selectOrderByPage(currentPage, pagePerRow, memberNumber, connection);
			
			connection.commit();
		} catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			if(connection != null) try{connection.close();} catch(SQLException ex){ex.printStackTrace();}
		}	
		return ordersList;
	}
	
	public int selectCount() {
		// 페이징하는 메소드
		// return data type int, selectCount 메소드 (매개변수 없음)
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Connection connection = null;
		int totalRow = 0;
		
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
					
			totalRow = bookOrdersDao.selectCount(connection);
			
			connection.commit();
		} catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			if(connection != null) try{connection.close();} catch(SQLException ex){ex.printStackTrace();}
		}	
			return totalRow;
	}
	
	public ArrayList<Orders> selectOrdersState (int currentPage, int pagePerRow) {
		// 관리자 상품 진행상태 승인 메소드
		// return data type ArrayList<Orders>, selectOrdersState 메소드 (int data type currentPage 매개변수, int data type memberNumber 매개변수 생성)
		ArrayList<Orders> selectOrdersList = new ArrayList<Orders>();
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Connection connection = null;
		
		
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			selectOrdersList = bookOrdersDao.selectOrdersState(currentPage, pagePerRow, connection);
			
			connection.commit();
			
		} catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			if(connection != null)try{connection.close();}catch(SQLException ex){ex.printStackTrace();}
		}	
			return selectOrdersList;
		
	}
	
	public void selectforUpdateBookAmount(int bookNumber, int ordersNumber) {
		// bookNumber, ordersNumber 조회 후 수량 업데이트
		// 리턴값 없는 selectforUpdateBookAmount메소드 (int data type으로 bookNumber, ordersNumber 매개변수 생성)
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Connection connection = null;
		
		
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			bookOrdersDao.selectOrders(ordersNumber, connection);
			
			connection.commit();
			
		} catch(Exception e) {
			
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			
		} finally {
			if(connection != null) try{connection.close(); } catch(SQLException ex){ex.printStackTrace();}
		}	
		
		
		
	}
	public Orders selectOrders (int ordersNumber) {
		// 한 개의 주문 조회하는 메소드
		// return data type Orders, orederSelectUpdate 메소드 (int data type으로  ordersNumber 매개변수 생성)
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Orders orders = new Orders();
		Connection connection = null;
		
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
				
			orders = bookOrdersDao.selectOrders(ordersNumber, connection);
				
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}	e.printStackTrace();
			}finally {
				if(connection != null) try{connection.close();}catch(SQLException ex){ex.printStackTrace();}
			}	
			
			return orders;
			
		}


	public Book seslectBookOrders(int bookNumber) {
		// Book 테이블 정보를 받아오는 메서드 			public Book selectBookOrder(int bookNumber)
		// 18.7.25 최지수
		
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Book book = null;
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);														// 오토커밋 false
			
			book = bookOrdersDao.selectBookOrder(bookNumber, connection);
			
			connection.commit();																	// 위 메서드 동시에 커밋
			
		}catch(Exception e) {
			try {
				connection.rollback();																// 한개라도 처리가 안되면 롤백
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{connection.close();}catch(SQLException ex){ex.printStackTrace();}
		}
		
		return book;
		
	}
	
	public Orders selectOrdersRecontAddress(int memberNumber) {
		// orders 테이블의 최근 주소를 받아오는 메서드	public Orders selectOrdersRecentAddress(int MemberNumber)
		// 18.7.25 최지수
		
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Orders orders = null;
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);														// 오토커밋 false
			
			orders = bookOrdersDao.selectOrdersRecentAddress(memberNumber, connection);
			
			connection.commit();																	// 위 메서드 동시에 커밋
			
		}catch(Exception e) {
			try {
				connection.rollback();																// 한개라도 처리가 안되면 롤백
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{connection.close();}catch(SQLException ex){ex.printStackTrace();}
		}
		
		return orders;
		
	}
	
	
	public Orders updateStateApproval (int ordersNumber) {
		// 주문 정보 조회해서 가장 최신 정보 조회
		// 리턴값 없는 updateStateApproval메소드 (int data type으로 orderNumber매개변수 생성)
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Orders orders = new Orders();
		
		Connection connection = null;
		
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);	
			
			bookOrdersDao.updateStateApproval(ordersNumber, connection);
		
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null) try{connection.close();} catch(SQLException ex){ex.printStackTrace();}
		}	
	
		return orders;
		
	}
	
	public void insertBookOrders(int memberNumber, int memberPoint, Orders orders, int shoppingCartNumber) {
		// 회원포인트업데이트			public void updateMemberPoint(int memberNumber, int memberPoint)
		// orders 테이블에 insert	public void insertBookOrders (Orders orders)
		// 장바구니 삭제				public void deleteShoppingCart(int shoppingCartNumber)
		// 18.7.25 최지수
		
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		MemberDao memberDao = new MemberDao();
		ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
		
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);														// 오토커밋 false
			
			memberDao.updateMemberPoint(memberNumber, memberPoint, connection);
			bookOrdersDao.insertBookOrders(orders, connection);
			
			if(shoppingCartNumber>0){																// 장바구니 번호가 0보다 크다면
				shoppingCartDao.deleteShoppingCart(shoppingCartNumber, connection);					// 장바구니 내 삭제 메서드 호출
			}
			
			connection.commit();																	// 위 메서드 동시에 커밋
			
		}catch(Exception e) {
			try {
				connection.rollback();																// 한개라도 처리가 안되면 롤백
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{connection.close();}catch(SQLException ex){ex.printStackTrace();}
		}
		
	}
}
