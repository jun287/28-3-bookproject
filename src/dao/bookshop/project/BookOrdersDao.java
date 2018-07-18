/* 2018-07-18 ����� / BookOrdersDao.java */
package dao.bookshop.project;
import util.connetion.db.DBconnection;
import java.sql.*;
import java.util.ArrayList;

import dto.bookshop.project.Orders;

public class BookOrdersDao {

	
	
	public Orders orederSelectUpdate(int ordersNumber) {
		// �� ���� �ֹ� ��ȸ�ϴ� �޼ҵ�
		// return data type Orders, orederSelectUpdate �޼ҵ� (int data type���� �Ű����� ordersNumber ���� )
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
			
        	// ��ü ����(�ݴ� ���� �߿�)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// ������������
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB��������
			
		}
	
		return orders;
		
	}
	
	public ArrayList<Orders> selectBookOrders (int bookNumber){
		// ��ǰ Ŭ���� ������ ������
		// return data type ArrayList<Orders>, selectBookOrders �޼ҵ� (int data type���� �Ű����� bookNumber ���� )
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
			
        	// ��ü ����(�ݴ� ���� �߿�)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// ������������
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB��������
			
		}
		
			
		return ordersList;
		
	}
	
	public int selectCount() {
		// ����¡ �ϴ� �޼ҵ�
		// return data type int, selectCount �޼ҵ� (�Ű����� ����)
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
			
        	// ��ü ����(�ݴ� ���� �߿�)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// ������������
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}	// DB��������
			
		}
		
		
		return totalRow;
		
	}
	
	public ArrayList<Orders> selectOrderByPage (int currentPage, int rowPerPage){
		// return data type ArrayList<Orders>, selectOrderBypage �޼ҵ� (int data type���� currentPage �Ű����� ����, int data type���� pagePerRow �Ű����� ���� )
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
				//Orders data type���� o ������ �����ϰ� new�����ڸ޼ҵ��  ������ Orders��ü�� �ּ� ���� o ������ �Ҵ��Ѵ�
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
			
        	// ��ü ����(�ݴ� ���� �߿�)
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// ������������
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	// DB��������
			
		}
		
		
		return ordersList;
		
	}
	
}
