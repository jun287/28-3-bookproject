// 2018. 7. 25(수) 이원상 ServiceShoppingCart.java
package service.bookshop.project;
import dao.bookshop.project.*;
import dto.bookshop.project.*;
import java.sql.Connection;
import java.sql.SQLException;

import dto.bookshop.project.ShoppingCart;
import util.connetion.db.DBconnection;

public class ServiceShoppingCart {
	Connection connection=DBconnection.getConnetion();
	
	public void insertShoppingCart(ShoppingCart shoppingCart){
		try {
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
}
