// 2018. 7. 25(수) 이원상 ServiceShoppingCart.java
package service.bookshop.project;
import dao.bookshop.project.*;
import dto.bookshop.project.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import util.connetion.db.DBconnection;

public class ServiceShoppingCart {
	Connection connection=null;
	
	public void insertShoppingCart(ShoppingCart shoppingCart){
		try {
			connection=DBconnection.getConnetion();
			connection.setAutoCommit(false);
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			shoppingCartDao.insertShoppingCart(shoppingCart, connection);
			connection.commit();
		}catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				connection.setAutoCommit(true);
				if(connection !=null) {connection.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	public void deleteShoppingCart(int shoppingCartNumber) {
		try {
			connection=DBconnection.getConnetion();
			connection.setAutoCommit(false);
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			shoppingCartDao.deleteShoppingCart(shoppingCartNumber, connection);;
			connection.commit();
		}catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				connection.setAutoCommit(true);
				if(connection !=null) {connection.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<MemberAndBookAndShoppingCart> selectShoppingCartListBypage(int memberNumber, int currentPage, int pagePerRow){
		ArrayList<MemberAndBookAndShoppingCart> selectShoppingCartList = new ArrayList<MemberAndBookAndShoppingCart>();
		try {
			connection=DBconnection.getConnetion();
			connection.setAutoCommit(false);
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			selectShoppingCartList = shoppingCartDao.selectShoppingCartListBypage(memberNumber, currentPage, pagePerRow, connection);
			connection.commit();
			boolean check = connection.isClosed();
			System.out.println(connection+"<--connection");
			System.out.println(check);			
		}catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				connection.setAutoCommit(true);
				if(connection !=null) {connection.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return selectShoppingCartList;
	}
	
	public int countMemberShoppingCart(int memberNumber, int pagePerRow) {
		int lastPage = 0;
		try {
			connection=DBconnection.getConnetion();
			connection.setAutoCommit(false);
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			lastPage = shoppingCartDao.countMemberShoppingCart(memberNumber, pagePerRow, connection);
			connection.commit();
			boolean check = connection.isClosed();
			System.out.println(connection+"<--connection");
			System.out.println(check);
		}catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				connection.setAutoCommit(true);
				if(connection !=null) {connection.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lastPage;
	}
	
	public void updateShoppingCart(int shoppingCartNumber, int updateShoppingCartAmount, int updateShoppingCartPrice) {
		try {
			connection=DBconnection.getConnetion();
			connection.setAutoCommit(false);
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			shoppingCartDao.updateShoppingCart(shoppingCartNumber, updateShoppingCartAmount, updateShoppingCartPrice, connection);;
			connection.commit();
		}catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				connection.setAutoCommit(true);
				if(connection !=null) {connection.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
