/* 2018-07-18 源����� / BookOrdersDao.java */
package dao.bookshop.project;
import util.connetion.db.DBconnection;
import java.sql.*;
import java.util.ArrayList;

import dto.bookshop.project.Orders;

public class BookOrdersDao {

	
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
	
	public Orders orederSelectUpdate(int ordersNumber) {
		// �� 媛��� 二쇰Ц 議고������ 硫�����
		// return data type Orders, orederSelectUpdate 硫����� (int data type�쇰�  ordersNumber 留ㅺ�蹂��� ����)
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
			
			// 媛�泥� 醫�猷�(�ル�� ���� 以���)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 荑쇰━�곌껐醫�猷�
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB�곌껐醫�猷�
			
		}
	
		return orders;
		
	}
	
	public ArrayList<Orders> selectBookOrders (int bookNumber){
		// ���� �대┃�� ���몄��蹂� ���ㅺ�
		// return data type ArrayList<Orders>, selectBookOrders 硫����� (int data type�쇰� 留ㅺ�蹂��� bookNumber ���� )
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
			
			// 媛�泥� 醫�猷�(�ル�� ���� 以���)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 荑쇰━�곌껐醫�猷�
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB�곌껐醫�猷�
			
		}
		
			
		return ordersList;
		
	}
	
	public int selectCount() {
		// ���댁� ���� 硫�����
		// return data type int, selectCount 硫����� (留ㅺ�蹂��� ����)
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
			
			// 媛�泥� 醫�猷�(�ル�� ���� 以���)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 荑쇰━�곌껐醫�猷�
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB�곌껐醫�猷�
			
		}
		
		
		return totalRow;
		
	}
	
	public ArrayList<Orders> selectOrderByPage (int currentPage, int rowPerPage){
		// return data type ArrayList<Orders>, selectOrderBypage 硫����� (int data type�쇰� currentPage 留ㅺ�蹂��� ����, int data type�쇰� pagePerRow 留ㅺ�蹂��� ���� )
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
				//Orders data type�쇰� o 蹂���瑜� ���깊��怨� new���깆��硫�����濡�  ���깅�� Orders媛�泥댁�� 二쇱�� 媛��� o 蹂����� ���뱁����	
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
			
			// 媛�泥� 醫�猷�(�ル�� ���� 以���)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// 荑쇰━�곌껐醫�猷�
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// DB�곌껐醫�猷�
			
		}
		
		
		return ordersList;
		
	}
	
}
