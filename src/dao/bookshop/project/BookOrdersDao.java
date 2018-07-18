package dao.bookshop.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.bookshop.project.Orders;

public class BookOrdersDao {
	/*orders_no
	 * book_no
	 * member_no
	 * orders_price
	 * orders_amount
	 * orders_date
	 * orders_addr
	 * orders_state
	 * */
	public ArrayList<Orders> bookOrders (String orders){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Orders> list = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
            String jdbcDriver = "jdbc:mysql://localhost:3306/5mysqlcrud?useUnicode=true&characterEncoding=euckr"; //데이터베이스 명
            String dbUser = "root";        
            String dbPass = "java0000";        

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(conn + "<--conn");
	          
			pstmt = conn.prepareStatement("SELECT orders.orders_no, orders.orders_price, orders.orders_amount, orders.orders_date, orders.orders_addr FROM orders, member, book WHERE orders.orders_no = member.member_no AND orders.orders_no = book.book_no AND orders.book_no=?");
			pstmt.setString(1, orders);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Orders o = new Orders();
				
				o.setOrdersNumber(rs.getInt("orderNumber"));
				o.setBookNumber(rs.getInt("bookNumber"));
				o.setOrdersPrice(rs.getInt("ordersPrice"));
				o.setOrderAmount(rs.getInt("ordersAmount"));
				o.setOrdersDate(rs.getString("ordersDate"));
				o.setOrdersAddress(rs.getString("ordersAddress"));
				o.setOrderState(rs.getString("ordersState"));
				
				list.add(o);
			}
			
			
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		
		
			return list;
		
	}
	
	

}
