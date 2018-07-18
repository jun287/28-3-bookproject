package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dto.bookshop.project.Orders;
import util.connetion.db.DBconnection;

public class ExOrders {

	public void insertBookOrder(Orders o) {
		// orders테이블에 주문정보를 추가하는 메서드
		// 매개변수 : Orders클래스와 연결할수 있는 참조값
		// 리턴값 없음
		
		Connection conn = null;			
		PreparedStatement pstmt = null;
		
		try{
			
			conn = DBconnection.getConnetion();
			
			pstmt = conn.prepareStatement("INSERT INTO orders (book_no, member_no, orders_price, orders_amount, orders_date, orders_addr, orders_state) VALUES (?, ?, ?, ?, NOW(), ?, '주문완료')");
			pstmt.setInt(1, o.getBookNumber());
			pstmt.setInt(2, o.getMemberNumber());
			pstmt.setInt(3, o.getOrdersPrice());
			pstmt.setInt(4, o.getOrdersAmount());
			pstmt.setString(5, o.getOrdersAddress());
			
			System.out.println(o.getOrdersAddress());
			
			pstmt.executeUpdate();
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			if(pstmt!=null) try{ pstmt.close(); } catch (SQLException e) {}	
			if(conn!=null) try{ conn.close(); } catch (SQLException e) {}	
			
		}
	}
}
