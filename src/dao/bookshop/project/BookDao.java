package dao.bookshop.project;

import java.sql.*;
import java.util.ArrayList;
import dto.bookshop.project.*;
import util.connetion.db.DBconnection;

public class BookDao {
	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	String sql1;
	public void insertBook(Book book) {
		connection = DBconnection.getConnetion();

		if (book.getBookAmount() > 0) {
			book.setBookOut("재고있음");
		} else {
			book.setBookOut("재고없음");
		}

		try {
			sql1 = "INSERT INTO book (bookcode_no, publisher_no, book_name, book_author, book_price, book_point, book_amount, book_out, book_date) VALUES (?,?,?,?,?,?,?,?,?)";

			preparedStatement = connection.prepareStatement(sql1);

			preparedStatement.setInt(1, book.getBookCodeNo());
			preparedStatement.setInt(2, book.getPublisherNo());
			preparedStatement.setString(3, book.getBookName());
			preparedStatement.setString(4, book.getBookAuthor());
			preparedStatement.setInt(5, book.getBookPrice());
			preparedStatement.setInt(6, book.getBookPoint());
			preparedStatement.setInt(7, book.getBookAmount());
			preparedStatement.setString(8, book.getBookOut());
			preparedStatement.setString(9, book.getBookDate());
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
	
	
	//특정 no에 대한 조회하는 메서드 
	//매개변수에 no에 값을 대입하여 조회한다
	public Book selectBook(int bookNo) {
		System.out.println("selectBook");

		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		Book book = new Book();
		String sql = "SELECT book_no,bookcode_no,publisher_no,book_name,book_author,book_price,book_point,book_amount,book_out,subString(book_date,1,10)as book_date FROM book where book_no=?";

		try {
			connection = DBconnection.getConnetion();

			statement = connection.prepareStatement(sql);
			statement.setInt(1, bookNo);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				book.setBookNo(resultSet.getInt("book_no"));
				book.setBookCodeNo(resultSet.getInt("bookcode_no"));
				book.setPublisherNo(resultSet.getInt("publisher_no"));
				book.setBookName(resultSet.getString("book_name"));
				book.setBookAuthor(resultSet.getString("book_author"));
				book.setBookPrice(resultSet.getInt("book_price"));
				book.setBookPoint(resultSet.getInt("book_point"));
				book.setBookAmount(resultSet.getInt("book_amount"));
				book.setBookOut(resultSet.getString("book_out"));
				book.setBookDate(resultSet.getString("book_date"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
				try {statement.close();} catch (SQLException e) {e.printStackTrace();}
				try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return book;
	}
	
	public void insertBookIntro(BookIntro bookIntro) {
		Connection connection=null;
		PreparedStatement statement=null;
		
		String sql="insert into bookintro(book_no,bookintro_content,bookintro_write) values(?,?,?)";
		try {
			connection=DBconnection.getConnetion();
			
			statement=connection.prepareStatement(sql);
			statement.setInt(1, bookIntro.getBookNo());
			statement.setString(2, bookIntro.getBookIntroContent());
			statement.setString(3, bookIntro.getBookIntroWrite());
		
			statement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}
	
	public ArrayList<BookIntro> selectBookIntro(int bookNo){
		
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet =null;
		
		String sql="select bookintro_no,book_no,bookintro_content,bookintro_write from bookintro where book_no=? order by bookintro_no asc";
		ArrayList<BookIntro> list=new ArrayList<BookIntro>();
		
		try {
			connection=DBconnection.getConnetion();
			
			statement=connection.prepareStatement(sql);
			statement.setInt(1, bookNo);
			resultSet =statement.executeQuery();
			
			while(resultSet.next()) {
				BookIntro bookIntro=new BookIntro();
				bookIntro.setBookIntroNo(resultSet.getInt("bookintro_no"));
				bookIntro.setBookNo(resultSet.getInt("book_no"));
				bookIntro.setBookIntroContent(resultSet.getString("bookintro_content"));
				bookIntro.setBookIntroWrite(resultSet.getString("bookintro_write"));
				
				list.add(bookIntro);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
		return list;
	}
	
	public BookIntro updateIntroForm(int bookIntroNo){
			
			Connection connection=null;
			PreparedStatement statement=null;
			ResultSet resultSet =null;
			
			BookIntro bookIntro=new BookIntro();
			
			String sql="select bookintro_no,book_no,bookintro_content,bookintro_write from bookintro where book_no=? order by bookintro_no asc";
			
			try {
				connection=DBconnection.getConnetion();
				
				statement=connection.prepareStatement(sql);
				statement.setInt(1, bookIntroNo);
				
				resultSet =statement.executeQuery();
				
				while(resultSet.next()) {
					bookIntro.setBookIntroNo(resultSet.getInt("bookintro_no"));
					bookIntro.setBookNo(resultSet.getInt("book_no"));
					bookIntro.setBookIntroContent(resultSet.getString("bookintro_content"));
					bookIntro.setBookIntroWrite(resultSet.getString("bookintro_write"));
				}
				
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {resultSet.close();} catch (SQLException e) {e.printStackTrace();}
				try {statement.close();} catch (SQLException e) {e.printStackTrace();}
				try {connection.close();} catch (SQLException e) {e.printStackTrace();}
			}
			
			return bookIntro;
		}

	public void updateIntro(BookIntro bookIntro) {
		Connection connection=null;
		PreparedStatement statement=null;
		
		String sql="update bookintro set bookintro_content=?,bookintro_write=? where bookintro_no=?";
		
		System.out.println(bookIntro.getBookIntroNo()+"<--bookIntro.getBookIntroNo()");
		System.out.println(bookIntro.getBookNo()+"<--bookIntro.getBookNo()");
		System.out.println(bookIntro.getBookIntroWrite()+"<--bookIntro.getBookIntroWrite()");
		System.out.println(bookIntro.getBookIntroContent()+"<--bookIntro.getBookIntroContent()");
		
		try {
			connection=DBconnection.getConnetion();
			
			statement=connection.prepareStatement(sql);
			System.out.println(statement+"<--statement");
			
			statement.setString(1, bookIntro.getBookIntroContent());
			statement.setString(2, bookIntro.getBookIntroWrite());
			statement.setInt(3, bookIntro.getBookIntroNo());
			
			System.out.println(statement+"<--statement");
			
			statement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
	
	}
	
	public void deletebookIntro(int bookIntroNo) {
		Connection connection=null;
		PreparedStatement statement=null;
		
		String sql="delete from bookintro where bookintro_no=?";
		
		try {
			connection=DBconnection.getConnetion();
			
			statement=connection.prepareStatement(sql);
			System.out.println(statement+"<--statement");
			
			statement.setInt(1, bookIntroNo);
						
			System.out.println(statement+"<--statement");
			
			statement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	//특정 no에 대한 조회하는 메서드 
	//매개변수에 no에 값을 대입하여 조회한다
	public void updateBook(Book book) {
			System.out.println("bookUpdate");
			
			Connection connection=null;
			PreparedStatement statement=null;
			
			if (book.getBookAmount() > 0) {
				book.setBookOut("재고있음");
			} else {
				book.setBookOut("재고없음");
			}
			
			String sql="update book set bookcode_no=?,publisher_no=?,book_name=?,book_author=?,book_price=?,book_point=?,book_amount=?,book_out=?,book_date=? where book_no=?";
			
			
			try {
				connection=DBconnection.getConnetion();
				statement=connection.prepareStatement(sql);
				
				statement.setInt(1,book.getBookCodeNo() );
				statement.setInt(2,book.getPublisherNo());
				statement.setString(3,book.getBookName());
				statement.setString(4, book.getBookAuthor());
				statement.setInt(5, book.getBookPrice());
				statement.setInt(6, book.getBookPoint());
				statement.setInt(7, book.getBookAmount());
				statement.setString(8, book.getBookOut());
				statement.setString(9, book.getBookDate());
				statement.setInt(10, book.getBookNo());
				
				statement.executeUpdate();
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {statement.close();} catch (SQLException e) {e.printStackTrace();}
				try {connection.close();} catch (SQLException e) {e.printStackTrace();}
			}
			
			
		} 
	
	public void  deleteBook(int bookNumber) {
		Connection connection=null;
		PreparedStatement statement=null;
		PreparedStatement statement1=null;
		PreparedStatement statement2=null;
		PreparedStatement statement3=null;
		
		String sql="delete from book where book_no=?";
		String sql1="delete from bookintro where book_no=?";
		String sql2="delete from bookreview where book_no=?";
		String sql3="delete from orders where book_no=?";
		try {
			connection=DBconnection.getConnetion();
			statement=connection.prepareStatement(sql1);
			statement.setInt(1, bookNumber);
			
			statement.executeUpdate();
			
			statement1=connection.prepareStatement(sql2);
			statement1.setInt(1, bookNumber);
			
			statement1.executeUpdate();
			
			statement3=connection.prepareStatement(sql3);
			statement3.setInt(1, bookNumber);
			
			statement3.executeUpdate();
			
			statement2=connection.prepareStatement(sql);
			statement2.setInt(1, bookNumber);
			
			statement2.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {statement.close();} catch (SQLException e) {e.printStackTrace();}
			try {connection.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}
	
	
	/*
	메소드 설명	
	1. 용도 : 전체 책을 검색조건에 맞춰 조회, 검색조건없을시 전체조회(DB book,bookcode,publisher inner join 특정조건 행 조회)
	2. 매개변수 : String beginDate(검색시작날짜), String endDate(검색종료날짜), String searchCategory(검색구분), String searchKeyword(검색단어), int currentPage(현재페이지), int pagePerRow(페이지당 볼 행의 수)
	3. 리턴값 : ArrayList<BookAndPublisherAndBookCode>
	4. BookAndPublisherAndBookCode Class 프로퍼티
		- 접근지정자는 모두 private임.
			Book book, Publisher publisher, BookCode bookCode; 
    5. 2018. 7. 24(화) 이원상
	*/
	public ArrayList<BookAndPublisherAndBookCode> selectBookListSearchByPage(String beginDate, String endDate, String searchKeyword, String searchCategory, int currentPage, int pagePerRow, Connection connection){
		ArrayList<BookAndPublisherAndBookCode> bookAndPublisherAndBookCodeList = new ArrayList<BookAndPublisherAndBookCode>();
		int startRow = (currentPage-1)*pagePerRow;
			try {
				if(!beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")) {
					System.out.println("01조건 beginDate,endDate,searchCategory,sv 모두 값이 있다,oooo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? and "+searchCategory+" like ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setString(3, "%"+searchKeyword+"%");
					preparedStatement.setInt(4, startRow);
					preparedStatement.setInt(5, pagePerRow);
					
				}else if(!beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")) {
					System.out.println("02조건 beginDate,endDate,searchCategory의 값이 있고 searchKeyword값이 없다,ooox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no inner join bookcode bc "
							+ "on b.bookcode_no = bc.bookcode_no where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")) {
					System.out.println("03조건 beginDate값이 있고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 있다,oxoo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? and "+searchCategory+" like ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					preparedStatement.setString(3, "%"+searchKeyword+"%");
					preparedStatement.setInt(4, startRow);
					preparedStatement.setInt(5, pagePerRow);
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")) {
					System.out.println("04조건 beginDate값이 있고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 없다,oxox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no inner join bookcode bc "
							+ "on b.bookcode_no = bc.bookcode_no where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")) {
					System.out.println("05조건 beginDate값이 없고,endDate값이 있고,searchCategory의 값이 있고 searchKeyword값이 있다,xooo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? and "+searchCategory+" like ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setString(3, "%"+searchKeyword+"%");
					preparedStatement.setInt(4, startRow);
					preparedStatement.setInt(5, pagePerRow);
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")) {
					System.out.println("06조건 beginDate값이 없고,endDate값이 있고,searchCategory의 값이 있고 searchKeyword값이 없다,xoox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("07조건 beginDate값이 없고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 있다,xxoo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where "+searchCategory+" like ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, "%"+searchKeyword+"%");
					preparedStatement.setInt(2, startRow);
					preparedStatement.setInt(3, pagePerRow);
					
				}else if(beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("08조건 beginDate값이 없고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 없다,xxox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setInt(1, startRow);
					preparedStatement.setInt(2, pagePerRow);
					
				}else if(beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("09조건 beginDate값이 없고,endDate값이 없고,searchCategory의 값이 없고 searchKeyword값이 있다,xxxo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "order by book_date desc limit ?,?";	
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setInt(1, startRow);
					preparedStatement.setInt(2, pagePerRow);
					
				}else if(beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("10조건 beginDate,endDate,searchCategory,searchKeyword모두 값이 없다,xxxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setInt(1, startRow);
					preparedStatement.setInt(2, pagePerRow);
					
				}else if(!beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("11조건 beginDate,endDate값이 있고, searchCategory값이 없고 searchKeyword값이 있다.ooxo ");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(!beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("12조건 beginDate,endDate값이 있고 searchCategory,searchKeyword값이 없다,ooxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("13조건 beginDate값이 있고 endDate값이 없고 searchCategory값이 없고 searchKeyword값이 있다,oxxo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("14조건 beginDate값이 있고endDate,searchCategory,searchKeyword값이 없다,oxxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("15조건 beginDate값이 있고endDate값이 없고searchCategory값이 있고searchKeyword 값이 없다,xoxo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("16조건 beginDate값이없고endDate값이 있고searchCategory값이없고searchKeyword모두 값이 없다,xoxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc limit ?,?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setInt(3, startRow);
					preparedStatement.setInt(4, pagePerRow);
					
				}resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					Book book = new Book();
					Publisher publisher = new Publisher();
					BookCode bookCode = new BookCode();
					BookAndPublisherAndBookCode bookAndPublisherAndBookCode = new BookAndPublisherAndBookCode();
					book.setBookNo(resultSet.getInt(1));
					book.setBookCodeNo(resultSet.getInt(2));
					book.setPublisherNo(resultSet.getInt(3));
					book.setBookName(resultSet.getString(4));
					book.setBookAuthor(resultSet.getString(5));
					book.setBookPrice(resultSet.getInt(6));
					book.setBookPoint(resultSet.getInt(7));
					book.setBookAmount(resultSet.getInt(8));;
					book.setBookOut(resultSet.getString(9));
					book.setBookDate(resultSet.getString(10));
					publisher.setPublisherName(resultSet.getString(11));
					bookCode.setBookCodeName(resultSet.getString(12));
					bookAndPublisherAndBookCode.setBook(book);
					bookAndPublisherAndBookCode.setBookCode(bookCode);
					bookAndPublisherAndBookCode.setPublisher(publisher);	
					bookAndPublisherAndBookCodeList.add(bookAndPublisherAndBookCode);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {if(resultSet != null) {resultSet.close();}
					if(preparedStatement != null) {preparedStatement.close();}
				}catch (SQLException e) {e.printStackTrace();}
			}

		return bookAndPublisherAndBookCodeList;
	}	
	
	/*
	메소드 설명	
	1. 용도 : 전체 책을 검색조건에 맞춰 조회, 검색조건없을시 전체조회한 행의 수를 구해 검색조건에 맞는 lastPage를 구하는 메소드(DB book,bookcode,publisher inner join 특정조건 행의 수 조회)
	2. 매개변수 : String beginDate(검색시작날짜), String endDate(검색종료날짜), String searchCategory(검색구분), String searchKeyword(검색단어), int currentPage(현재페이지), int pagePerRow(페이지당 볼 행의 수)
	3. 리턴값 : lastPage(검색조건에 맞게 변하는 lastPage를 구해 정수로 리턴)
	4. BookAndPublisherAndBookCode Class 프로퍼티
		- 접근지정자는 모두 private임.
			Book book, Publisher publisher, BookCode bookCode; 
	5. 2018. 7. 24(화) 이원상		
	*/
	public int checkBookListLastPage(String beginDate, String endDate, String searchKeyword, String searchCategory, int currentPage, int pagePerRow, Connection connection){
		ArrayList<BookAndPublisherAndBookCode> bookAndPublisherAndBookCodeList = new ArrayList<BookAndPublisherAndBookCode>();
		int totalRow=0;
		int lastPage = 0;
			try {
				if(!beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")) {
					System.out.println("01조건 beginDate,endDate,searchCategory,sv 모두 값이 있다,oooo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? and "+searchCategory+" like ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setString(3, "%"+searchKeyword+"%");
					
				}else if(!beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")) {
					System.out.println("02조건 beginDate,endDate,searchCategory의 값이 있고 searchKeyword값이 없다,ooox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no inner join bookcode bc "
							+ "on b.bookcode_no = bc.bookcode_no where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")) {
					System.out.println("03조건 beginDate값이 있고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 있다,oxoo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? and "+searchCategory+" like ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					preparedStatement.setString(3, "%"+searchKeyword+"%");
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")) {
					System.out.println("04조건 beginDate값이 있고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 없다,oxox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no inner join bookcode bc "
							+ "on b.bookcode_no = bc.bookcode_no where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")) {
					System.out.println("05조건 beginDate값이 없고,endDate값이 있고,searchCategory의 값이 있고 searchKeyword값이 있다,xooo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? and "+searchCategory+" like ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					preparedStatement.setString(3, "%"+searchKeyword+"%");
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")) {
					System.out.println("06조건 beginDate값이 없고,endDate값이 있고,searchCategory의 값이 있고 searchKeyword값이 없다,xoox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no order by book_date desc "
							+ "where b.book_date between ? and ?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					
				}else if(beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("07조건 beginDate값이 없고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 있다,xxoo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no order by book_date desc "
							+ "where "+searchCategory+" like ?";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, "%"+searchKeyword+"%");
					
				}else if(beginDate.equals("") &&  endDate.equals("") && !searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("08조건 beginDate값이 없고,endDate값이 없고,searchCategory의 값이 있고 searchKeyword값이 없다,xxox");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					
				}else if(beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("09조건 beginDate값이 없고,endDate값이 없고,searchCategory의 값이 없고 searchKeyword값이 있다,xxxo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no order by book_date desc";	
					preparedStatement = connection.prepareStatement(sql1);
					
				}else if(beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("10조건 beginDate,endDate,searchCategory,searchKeyword모두 값이 없다,xxxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
				}else if(!beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("11조건 beginDate,endDate값이 있고, searchCategory값이 없고 searchKeyword값이 있다.ooxo ");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					
				}else if(!beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("12조건 beginDate,endDate값이 있고 searchCategory,searchKeyword값이 없다,ooxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("13조건 beginDate값이 있고 endDate값이 없고 searchCategory값이 없고 searchKeyword값이 있다,oxxo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					
				}else if(!beginDate.equals("") &&  endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("14조건 beginDate값이 있고endDate,searchCategory,searchKeyword값이 없다,oxxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && !searchKeyword.equals("")){
					System.out.println("15조건 beginDate값이 있고endDate값이 없고searchCategory값이 있고searchKeyword 값이 없다,xoxo");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, "2099-12-31");
					
				}else if(beginDate.equals("") &&  !endDate.equals("") && searchCategory.equals("") && searchKeyword.equals("")){
					System.out.println("16조건 beginDate값이없고endDate값이 있고searchCategory값이없고searchKeyword모두 값이 없다,xoxx");
					sql1 = "select b.book_no,b.bookcode_no,b.publisher_no,b.book_name,b.book_author,b.book_price,b.book_point,"
							+ "b.book_amount,b.book_out,b.book_date,p.publisher_name,bc.bookcode_name "
							+ "from book b inner join publisher p on b.publisher_no = p.publisher_no "
							+ "inner join bookcode bc on b.bookcode_no = bc.bookcode_no "
							+ "where b.book_date between ? and ? order by book_date desc";
					preparedStatement = connection.prepareStatement(sql1);
					preparedStatement.setString(1, beginDate);
					preparedStatement.setString(2, endDate+" 23:59:59");
					
				}resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					Book book = new Book();
					Publisher publisher = new Publisher();
					BookCode bookCode = new BookCode();
					BookAndPublisherAndBookCode bookAndPublisherAndBookCode = new BookAndPublisherAndBookCode();
					book.setBookNo(resultSet.getInt(1));
					book.setBookCodeNo(resultSet.getInt(2));
					book.setPublisherNo(resultSet.getInt(3));
					book.setBookName(resultSet.getString(4));
					book.setBookAuthor(resultSet.getString(5));
					book.setBookPrice(resultSet.getInt(6));
					book.setBookPoint(resultSet.getInt(7));
					book.setBookAmount(resultSet.getInt(8));;
					book.setBookOut(resultSet.getString(9));
					book.setBookDate(resultSet.getString(10));
					publisher.setPublisherName(resultSet.getString(11));
					bookCode.setBookCodeName(resultSet.getString(12));
					bookAndPublisherAndBookCode.setBook(book);
					bookAndPublisherAndBookCode.setBookCode(bookCode);
					bookAndPublisherAndBookCode.setPublisher(publisher);	
					bookAndPublisherAndBookCodeList.add(bookAndPublisherAndBookCode);
					totalRow++;
				}
				lastPage = totalRow/pagePerRow;
				if(totalRow%pagePerRow!=0) {
					lastPage++;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {if(resultSet != null) {resultSet.close();}
					if(preparedStatement != null) {preparedStatement.close();}
					if(connection != null) {connection.close();}
				}catch (SQLException e) {e.printStackTrace();}
			}

		return lastPage;
	}
	
	
}