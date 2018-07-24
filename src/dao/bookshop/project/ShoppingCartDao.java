// 28기 이원상 2018. 7. 18(수) ShoppingCartDao.java
package dao.bookshop.project;
import util.connetion.db.DBconnection;
import dto.bookshop.project.MemberAndBookAndShoppingCart;
import dto.bookshop.project.ShoppingCart;
import dto.bookshop.project.Member;
import dto.bookshop.project.Book;
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
			// connection.setAutoCommit(false);	
			// 쿼리실행 결과가 자동으로 DB에 입력(수정)되는 것(commit)을 수동으로 지정 			
			preparedStatement.setInt(1, shoppingCart.getBookNumber());		
			preparedStatement.setInt(2, shoppingCart.getMemberNumber());
			preparedStatement.setInt(3, shoppingCart.getShoppingCartAmount());
			preparedStatement.setInt(4, shoppingCart.getShoppingCartPrice());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(preparedStatement != null) {preparedStatement.close();}
				if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
	}	
	
	/* 2번 메소드
	 * 기능 : 장바구니리스트에 구매할 책의 정보를 삭제시키는 메소드 (DB shoppingcart 테이블에 1개 행 삭제)
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
			// connection.setAutoCommit(false);		
			// 쿼리실행 결과가 자동으로 DB에 입력(수정)되는 것(commit)을 수동으로 지정
			preparedStatement.setInt(1, shoppingCartNumber);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(preparedStatement != null) {preparedStatement.close();}
				if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
	}
	/* 3번 메소드
	 * 기능 : 한명의 회원의 장바구니를 조회하는 메소드 (DB shoppingcart,member,book 테이블에 특정 member_no의 inner join 결과 행 조회)
	 * 매개변수 : int memberNumber(bookView.jsp에서 넘겨받을 값, DB shoppingcart 테이블의 참조키)currentPage(시작페이지), pagePerRow(페이지당 볼 행의 수)
	 * 리턴값 : ShoppingCart,Member,Book클래스의 인스턴스를 가리키는 참조변수를 담은  ArrayList쿨래스의 인스턴스를 가르키는 참조변수를 리턴
	 * ShoppingCart클래스 인스턴스 변수(멤버변수) 접근제한자 private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public ArrayList<MemberAndBookAndShoppingCart> selectShoppingCartListBypage(int memberNumber, int currentPage, int pagePerRow) {
		connection = DBconnection.getConnetion();				// DBconnection클래스의 클래스 메소드, import로 패키지명 생략
		ArrayList<MemberAndBookAndShoppingCart> shoppingCartList = new ArrayList<MemberAndBookAndShoppingCart>();
		try {
			int startRow = (currentPage-1)*pagePerRow;
			sql1 = "select sc.shoppingcart_no,sc.book_no,sc.member_no,sc.shoppingcart_amount,"
					+ "sc.shoppingcart_price,sc.shoppingcart_date,m.member_id,m.member_name,"
					+ "m.member_addr,m.member_point,b.book_name,b.book_author,b.book_price,b.book_point "
					+ "from shoppingcart sc inner join member m on sc.member_no = m.member_no "
					+ "inner join book b on sc.book_no = b.book_no where sc.member_no = ? order by sc.shoppingcart_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql1);
			// connection.setAutoCommit(false);		// 쿼리실행 결과가 자동으로 DB에 입력(수정)되는 것(commit)을 수동으로 지정
			preparedStatement.setInt(1, memberNumber);
			preparedStatement.setInt(2, startRow);
			preparedStatement.setInt(3, pagePerRow);
			System.out.println(preparedStatement+"<--preparedStatement");
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				MemberAndBookAndShoppingCart memberAndBookAndShoppingCart = new MemberAndBookAndShoppingCart();
				Member member = new Member();
				Book book = new Book();
				ShoppingCart shoppingCart = new ShoppingCart();
				shoppingCart.setShoppingCartNumber(resultSet.getInt(1));
				shoppingCart.setBookNumber(resultSet.getInt(2));
				shoppingCart.setMemberNumber(resultSet.getInt(3));
				shoppingCart.setShoppingCartAmount(resultSet.getInt(4));
				shoppingCart.setShoppingCartPrice(resultSet.getInt(5));
				shoppingCart.setShoppingCartDate(resultSet.getString(6));
				member.setMemberNum(resultSet.getInt(3));
				member.setMemberId(resultSet.getString(7));
				member.setMemberName(resultSet.getString(8));
				member.setMemberAddr(resultSet.getString(9));
				member.setMemberPoint(resultSet.getInt(10));
				book.setBookNo(resultSet.getInt(2));
				book.setBookName(resultSet.getString(11));
				book.setBookAuthor(resultSet.getString(12));
				book.setBookPrice(resultSet.getInt(13));
				book.setBookPoint(resultSet.getInt(14));
				memberAndBookAndShoppingCart.setShoppingCart(shoppingCart);
				memberAndBookAndShoppingCart.setMember(member);
				memberAndBookAndShoppingCart.setBook(book);
				shoppingCartList.add(memberAndBookAndShoppingCart);
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
	
	/* 4번 메소드
	 * 기능 : 한명의 회원의 장바구니를 담긴 행을 조회하는 메소드 (shoppingcart테이블에 특정 member_no의 행의 수를 조회)
	 * 매개변수 : int memberNumber(조회할 회원의 기본키), pagePerRow(페이지당 볼 행의 수)
	 * 리턴값 : lastPage(장바구니 Page의 마지막 페이지를 알기위해 쿼리실행 결과값(총행)/페이지당 볼행)를 구해 정수형태로 리턴
	 * ShoppingCart클래스 인스턴스 변수(멤버변수) 접근제한자 private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public int countMemberShoppingCart(int memberNumber, int pagePerRow) {
		connection = DBconnection.getConnetion();				// DBconnection클래스의 클래스 메소드, import로 패키지명 생략
		int latsPage = 0;
		try {
			sql1 = "select count(member_no) as totalRow from shoppingcart where member_no=?";
			preparedStatement = connection.prepareStatement(sql1);
			preparedStatement.setInt(1, memberNumber);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			int totalRow = resultSet.getInt(1);
			latsPage = totalRow/pagePerRow;
			if(totalRow%pagePerRow!=0) {
				latsPage++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {if(resultSet != null) {resultSet.close();}
			if(preparedStatement != null) {preparedStatement.close();}
			if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
		return latsPage;
		
	}
	
	/* 5번 메소드
	 * 기능 : 장바구니리스트에 구매할 책의 정보를 수정시키는 메소드 (DB shoppingcart 테이블에 1개 행 수정)
	 * 매개변수 : shoppingCartNumber,updateShoppingCartAmount,updateShoppingCartPrice(수정될 쇼핑카트 번호, 수량, 가격)
	 * 리턴값 : 없음
	 * ShoppingCart클래스 인스턴스 변수(멤버변수) 접근제한자 private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public void updateShoppingCart(int shoppingCartNumber, int updateShoppingCartAmount, int updateShoppingCartPrice) {
		connection = DBconnection.getConnetion();				// DBconnection클래스의 클래스 메소드, import로 패키지명 생략
		try {
			sql1 = "UPDATE shoppingcart SET shoppingcart_amount=?, shoppingcart_price=? WHERE shoppingcart_no=?";
			preparedStatement = connection.prepareStatement(sql1);
			// connection.setAutoCommit(false);		
			// 쿼리실행 결과가 자동으로 DB에 입력(수정)되는 것(commit)을 수동으로 지정
			preparedStatement.setInt(1, updateShoppingCartAmount);
			preparedStatement.setInt(2, updateShoppingCartPrice);
			preparedStatement.setInt(3, shoppingCartNumber);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(preparedStatement != null) {preparedStatement.close();}
				if(connection != null) {connection.close();}
			} catch (SQLException e) {e.printStackTrace();}
		}
	}	
}