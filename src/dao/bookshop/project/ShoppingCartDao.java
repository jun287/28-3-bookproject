// 28기 이원상 2018. 7. 18(수) ShoppingCartDao.java
package dao.bookshop.project;
import util.connetion.db.DBconnection;
import dto.bookshop.project.ShoppingCart;
import java.sql.*;
import java.util.*;

public class ShoppingCartDao {						
	Connection connection;							// 인스턴스 변수 선언
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	String sql1;
	String sql2;
	
	public ShoppingCartDao() {						// ShoppingCartDao클래스 인수없는 생성자 메소드 생성
		this.connection = null;						// 인스턴스 변수 초기화
		this.preparedStatement = null;
		this.resultSet = null;						// this - 만들어질 인스턴스의 인스턴스 변수를 가르킴
		this.sql1 = null;							// 참조변수의 초기값 null
		this.sql2 = null;							// 참조변수의 초기값 null
	}
	
	/* 1번 메소드
	 * 기능 : 장바구니리스트에 구매할 책의 정보를 담는 메소드 (DB shoppingcart 테이블에 1개 행 입력)
	 * 매개변수 : ShoppingCart클래스의 인스턴스 참조값
	 * 리턴값 : 없음
	 * ShoppingCart클래스 인스턴스 변수(멤버변수) 접근제한자 private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public void insertShoppingCart(ShoppingCart shoppingCart) {
		connection = DBconnection.getConnetion();				// DBconnection클래스의 클래스 메소드, import로 패키지명 생략
		try {
			sql1 = "INSERT INTO shoppingcart (book_no, member_no, shoppingcart_amount, shoppingcart_price, shoppingcart_date) VALUES (?, ?, ?, ?, NOW())";
			preparedStatement = connection.prepareStatement(sql1);
			connection.setAutoCommit(false);		// 쿼리실행 결과가 자동으로 DB에 입력(수정)되는 것(commit)을 수동으로 지정 			
			preparedStatement.setInt(1, shoppingCart.getBookNumber());		
			preparedStatement.setInt(2, shoppingCart.getMemberNumber());
			preparedStatement.setInt(3, shoppingCart.getShoppingCartAmount());
			preparedStatement.setInt(4, shoppingCart.getShoppingCartPrice());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(resultSet != null) {resultSet.close();}
				if(preparedStatement != null) {preparedStatement.close();}
				if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
	}	
	
	/* 2번 메소드
	 * 기능 : 장바구니리스트에 구매할 책의 정보를 삭제시키는 메소드 (DB shoppingcart 테이블에 1개 행 삭제)
	 *  회원이 장바구니 리스트에서 삭제버튼을 눌렀을때 삭제되는 메소드임.
	 * 매개변수 : int shoppingCartNumber(shoppingCartList에서 넘겨받을 값, DB shoppingcart 테이블의 기본키)
	 * 리턴값 : 없음
	 * ShoppingCart클래스 인스턴스 변수(멤버변수) 접근제한자 private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public void deleteShoppingCart(int shoppingCartNumber) {
		connection = DBconnection.getConnetion();				// DBconnection클래스의 클래스 메소드, import로 패키지명 생략
		try {
			sql1 = "DELETE FROM shoppingcart WHERE shoppingcart_no=?";
			preparedStatement = connection.prepareStatement(sql1); 			
			preparedStatement.setInt(1, shoppingCartNumber);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(resultSet != null) {resultSet.close();}
				if(preparedStatement != null) {preparedStatement.close();}
				if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	/* 3번 메소드(2번 메소드 오버로딩)
	 * 기능 : 장바구니리스트에 구매할 책의 정보를 삭제시키는 메소드 (DB shoppingcart 테이블에 1개 행 삭제)
	 *  회원이 주문을 완료했을때 장바구니 리스트에서 삭제시키는 메소드
	 * 매개변수 : ShoppingCart클래스의 인스턴스 참조값
	 * 리턴값 : 없음
	*/
	public void deleteShoppingCart(ShoppingCart shoppingCart) {
		connection = DBconnection.getConnetion();				// DBconnection클래스의 클래스 메소드, import로 패키지명 생략
		try {
			sql1 = "DELETE FROM shoppingcart WHERE shoppingcart_no=?";
			preparedStatement = connection.prepareStatement(sql1); 			
			connection.setAutoCommit(false);		// 쿼리실행 결과가 자동으로 DB에 입력(수정)되는 것(commit)을 수동으로 지정
			preparedStatement.setInt(1, shoppingCart.getShoppingCartNumber());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(resultSet != null) {resultSet.close();}
				if(preparedStatement != null) {preparedStatement.close();}
				if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	/* 4번 메소드
	 * 기능 : 한명의 회원의 장바구니를 조회하는 메소드 (DB shoppingcart 테이블에 특정 member_no의 행 조회)
	 * 매개변수 : int memberNumber(bookView.jsp에서 넘겨받을 값, DB shoppingcart 테이블의 참조키)
	 * 리턴값 : ShoppingCart클래스의 인스턴스를 가리키는 참조변수를 담은  ArrayList쿨래스의 인스턴스를 가르키는 참조변수를 리턴
	 * ShoppingCart클래스 인스턴스 변수(멤버변수) 접근제한자 private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public ArrayList<ShoppingCart> selectShoppingCartListBypage(int memberNumber, int currentPage, int pagePerRow) {
		connection = DBconnection.getConnetion();				// DBconnection클래스의 클래스 메소드, import로 패키지명 생략
		ArrayList<ShoppingCart> shoppingCartList = new ArrayList<ShoppingCart>();
		try {
			int startRow = (currentPage-1)*pagePerRow;
			sql1 = "select shoppingcart_no,book_no,member_no,shoppingcart_amount,shoppingcart_price,shoppingcart_date from shoppingcart where member_no = ? order by shoppingcart_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql1); 			
			// connection.setAutoCommit(false);		// 쿼리실행 결과가 자동으로 DB에 입력(수정)되는 것(commit)을 수동으로 지정
			preparedStatement.setInt(1, memberNumber);
			preparedStatement.setInt(2, startRow);
			preparedStatement.setInt(3, pagePerRow);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				ShoppingCart shoppingCart = new ShoppingCart();
				shoppingCart.setShoppingCartNumber(resultSet.getInt(1));
				shoppingCart.setBookNumber(resultSet.getInt(2));
				shoppingCart.setMemberNumber(resultSet.getInt(3));
				shoppingCart.setShoppingCartAmount(resultSet.getInt(4));
				shoppingCart.setShoppingCartPrice(resultSet.getInt(5));
				shoppingCart.setShoppingCartDate(resultSet.getString(6));
				shoppingCartList.add(shoppingCart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(resultSet != null) {resultSet.close();}
				if(preparedStatement != null) {preparedStatement.close();}
				if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
		return shoppingCartList;
	}
}
