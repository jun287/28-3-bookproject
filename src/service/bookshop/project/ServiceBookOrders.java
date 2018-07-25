package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;

import dao.bookshop.project.BookOrdersDao;
import dao.bookshop.project.MemberDao;
import dao.bookshop.project.ShoppingCartDao;
import dto.bookshop.project.Orders;
import util.connetion.db.DBconnection;

public class ServiceBookOrders {
	
	
	public Orders updateStateApproval (int ordersNumber) {
		// 주문 정보 조회해서 가장 최신 정보 조회
		BookOrdersDao bookOrdersDao = new BookOrdersDao();
		Orders orders = new Orders();
		
		Connection connection = null;
		
	try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);	
			
			bookOrdersDao.updateStateApproval(ordersNumber);
		
			connection.commit();
			
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
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
