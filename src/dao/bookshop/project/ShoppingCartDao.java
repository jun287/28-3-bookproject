// 28�� �̿��� 2018. 7. 18(��) ShoppingCartDao.java
package dao.bookshop.project;
import util.connetion.db.DBconnection;
import dto.bookshop.project.MemberAndBookAndShoppingCart;
import dto.bookshop.project.ShoppingCart;
import dto.bookshop.project.Member;
import dto.bookshop.project.Book;
import java.sql.*;
import java.util.*;

public class ShoppingCartDao {						
	Connection connection;							// �ν��Ͻ� ���� ����
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	String sql1;
	String sql2;
	
	public ShoppingCartDao() {						// ShoppingCartDaoŬ���� �μ����� ������ �޼ҵ� ����
		this.connection = null;						// �ν��Ͻ� ���� �ʱ�ȭ
		this.preparedStatement = null;
		this.resultSet = null;						// this - ������� �ν��Ͻ��� �ν��Ͻ� ������ ����Ŵ
		this.sql1 = null;							// ���������� �ʱⰪ null
		this.sql2 = null;							// ���������� �ʱⰪ null
	}
	
	/* 1�� �޼ҵ�
	 * ��� : ��ٱ��ϸ���Ʈ�� ������ å�� ������ ��� �޼ҵ� (DB shoppingcart ���̺� 1�� �� �Է�)
	 * �Ű����� : ShoppingCartŬ������ �ν��Ͻ� ������
	 * ���ϰ� : ����
	 * ShoppingCartŬ���� �ν��Ͻ� ����(�������) ���������� private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public void insertShoppingCart(ShoppingCart shoppingCart) {
		connection = DBconnection.getConnetion();				// DBconnectionŬ������ Ŭ���� �޼ҵ�, import�� ��Ű���� ����
		try {
			sql1 = "INSERT INTO shoppingcart (book_no, member_no, shoppingcart_amount, shoppingcart_price, shoppingcart_date) VALUES (?, ?, ?, ?, NOW())";
			preparedStatement = connection.prepareStatement(sql1);
			connection.setAutoCommit(false);		// �������� ����� �ڵ����� DB�� �Է�(����)�Ǵ� ��(commit)�� �������� ���� 			
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
	
	/* 2�� �޼ҵ�
	 * ��� : ��ٱ��ϸ���Ʈ�� ������ å�� ������ ������Ű�� �޼ҵ� (DB shoppingcart ���̺� 1�� �� ����)
	 *  ȸ���� ��ٱ��� ����Ʈ���� ������ư�� �������� �����Ǵ� �޼ҵ���.
	 * �Ű����� : int shoppingCartNumber(shoppingCartList���� �Ѱܹ��� ��, DB shoppingcart ���̺��� �⺻Ű)
	 * ���ϰ� : ����
	 * ShoppingCartŬ���� �ν��Ͻ� ����(�������) ���������� private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public void deleteShoppingCart(int shoppingCartNumber) {
		connection = DBconnection.getConnetion();				// DBconnectionŬ������ Ŭ���� �޼ҵ�, import�� ��Ű���� ����
		try {
			sql1 = "DELETE FROM shoppingcart WHERE shoppingcart_no=?";
			preparedStatement = connection.prepareStatement(sql1);
			connection.setAutoCommit(false);		// �������� ����� �ڵ����� DB�� �Է�(����)�Ǵ� ��(commit)�� �������� ����
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
	
/*	 3�� �޼ҵ�(2�� �޼ҵ� �����ε�)
	 * ��� : ��ٱ��ϸ���Ʈ�� ������ å�� ������ ������Ű�� �޼ҵ� (DB shoppingcart ���̺� 1�� �� ����)
	 *  ȸ���� �ֹ��� �Ϸ������� ��ٱ��� ����Ʈ���� ������Ű�� �޼ҵ�
	 * �Ű����� : ShoppingCartŬ������ �ν��Ͻ� ������
	 * ���ϰ� : ����
	
	public void deleteShoppingCart(ShoppingCart shoppingCart) {
		connection = DBconnection.getConnetion();				// DBconnectionŬ������ Ŭ���� �޼ҵ�, import�� ��Ű���� ����
		try {
			sql1 = "DELETE FROM shoppingcart WHERE shoppingcart_no=?";
			preparedStatement = connection.prepareStatement(sql1); 			
			connection.setAutoCommit(false);		// �������� ����� �ڵ����� DB�� �Է�(����)�Ǵ� ��(commit)�� �������� ����
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
	}*/
	
	
	/* 4�� �޼ҵ�
	 * ��� : �Ѹ��� ȸ���� ��ٱ��ϸ� ��ȸ�ϴ� �޼ҵ� (DB shoppingcart,member,book ���̺� Ư�� member_no�� inner join ��� �� ��ȸ)
	 * �Ű����� : int memberNumber(bookView.jsp���� �Ѱܹ��� ��, DB shoppingcart ���̺��� ����Ű)currentPage(����������), pagePerRow(�������� �� ���� ��)
	 * ���ϰ� : ShoppingCart,Member,BookŬ������ �ν��Ͻ��� ����Ű�� ���������� ����  ArrayList�𷡽��� �ν��Ͻ��� ����Ű�� ���������� ����
	 * ShoppingCartŬ���� �ν��Ͻ� ����(�������) ���������� private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public ArrayList<MemberAndBookAndShoppingCart> selectShoppingCartListBypage(int memberNumber, int currentPage, int pagePerRow) {
		connection = DBconnection.getConnetion();				// DBconnectionŬ������ Ŭ���� �޼ҵ�, import�� ��Ű���� ����
		ArrayList<MemberAndBookAndShoppingCart> shoppingCartList = new ArrayList<MemberAndBookAndShoppingCart>();
		try {
			int startRow = (currentPage-1)*pagePerRow;
			preparedStatement = connection.prepareStatement(sql1);
			sql1 = "select sc.shoppingcart_no,sc.book_no,sc.member_no,sc.shoppingcart_amount,"
					+ "sc.shoppingcart_price,sc.shoppingcart_date,m.member_id,m.member_name,"
					+ "m.member_addr,m.member_point,b.book_name,b.book_author,b.book_price,b.book_point "
					+ "from shoppingcart sc inner join member m on sc.member_no = m.member_no "
					+ "inner join book b on sc.book_no = b.book_no where sc.member_no = ? order by sc.shoppingcart_date desc limit ?,?";
			
			// connection.setAutoCommit(false);		// �������� ����� �ڵ����� DB�� �Է�(����)�Ǵ� ��(commit)�� �������� ����
			preparedStatement.setInt(1, memberNumber);
			preparedStatement.setInt(2, startRow);
			preparedStatement.setInt(3, pagePerRow);
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
				member.setMemberId(resultSet.getString(7));
				member.setMemberName(resultSet.getString(8));
				member.setMemberAddr(resultSet.getString(9));
				book.setBook_name(resultSet.getString(10));
				book.setBook_author(resultSet.getString(11));
				book.setBook_price(resultSet.getInt(12));
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
	
	/* 5�� �޼ҵ�
	 * ��� : �Ѹ��� ȸ���� ��ٱ��ϸ� ��� ���� ��ȸ�ϴ� �޼ҵ� (shoppingcart���̺� Ư�� member_no�� ���� ���� ��ȸ)
	 * �Ű����� : int memberNumber(��ȸ�� ȸ���� �⺻Ű), pagePerRow(�������� �� ���� ��)
	 * ���ϰ� : lastPage(��ٱ��� Page�� ������ �������� �˱����� �������� �����(����)/�������� ����)�� ���� �������·� ����
	 * ShoppingCartŬ���� �ν��Ͻ� ����(�������) ���������� private
	 * int shoppingCartNumber, int bookNumber, int memberNumber, int shoppingCartAmount, 
	 * int shoppingCartPrice, String shoppingCartDate
	*/
	public int countMemberShoppingCart(int memberNumber, int pagePerRow) {
		connection = DBconnection.getConnetion();				// DBconnectionŬ������ Ŭ���� �޼ҵ�, import�� ��Ű���� ����
		int latsPage = 0;
		try {
			preparedStatement = connection.prepareStatement(sql1);
			sql1 = "select count(member_no) as totalRow from shoppingcart where member_no=?";
			preparedStatement.setInt(1, memberNumber);
			resultSet = preparedStatement.executeQuery();
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
	
}