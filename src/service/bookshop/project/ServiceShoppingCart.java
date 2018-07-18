package service.bookshop.project;
import java.sql.*;

import dao.bookshop.project.ShoppingCartDao;
import dto.bookshop.project.ShoppingCart;

public class ServiceShoppingCart {
	Connection connection;			
	public void insertShoppingCart(ShoppingCart shoppingCart) {
		try {
			ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
			shoppingCartDao.insertShoppingCart(shoppingCart);
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

	}
		
}
