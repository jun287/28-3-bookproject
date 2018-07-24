// 2018. 07. 23 공세준

package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.bookshop.project.BoardQnACommentDao;
import dao.bookshop.project.BoardQnADao;
import dto.bookshop.project.BoardQnA;
import dto.bookshop.project.BoardQnAComment;
import dto.bookshop.project.BoardQnAandComment;
import dto.bookshop.project.BoardQnAandMember;
import util.connetion.db.DBconnection;

public class ServiceBoardQnA {
	
	// 설명 : 질문게시판 페이징시 다음페이지로 이동하기위한 lastPage를 리턴하는 메서드 입니다.
	// 매개변수 : int 기본타입으로 페이지당 갯수를 받습니다.
	// 리턴 : int 기본타입으로 다음페이지로 이동하기 위한 lastPage를 리턴합니다.
	public int lastPageBoardQnA(int rowPerPage) {
		
		BoardQnADao boardQnaDao = new BoardQnADao();
		Connection connection = null;
		
		int lastPage=0;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			lastPage = boardQnaDao.lastPageBoardQnA(connection, rowPerPage);
			
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}	
		return lastPage;
	}
	
	// 설명 : 질문게시판에 게시글을 삭제 하는 메서드입니다.
	// 매개변수 : BoardQnA 클래스타입으로 게시글의 정보를 담은 객체의 참조값과, BoardQnAComment 클래스타입으로 답변의 정보를 담은 객체의 참조값을 받습니다.
	// 리턴 : void 로 없습니다.
	public void deleteBoardQnaContentAll(BoardQnA boardQna , BoardQnAComment boardQnAComment) {
		
		BoardQnADao boardQnaDao = new BoardQnADao();
		BoardQnACommentDao boardQnACommentDao = new BoardQnACommentDao(); 
		
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			boardQnACommentDao.deleteBoardQnaComment(connection, boardQnAComment);
			boardQnaDao.deleteBoardQnaContent(connection, boardQna);
			
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}	
	}
	
	// 설명 : 질문게시판에서 게시글 및 답변의 상세정보를 조회후 가져오는 메서드 입니다.
	// 매개변수 : 글번호와 회원번호, 관리자번호가 담긴 BoardQnA, BoardQnAComment 객체참조값을 받습니다.
	// 리턴 : BoardQnAandComment 클래스타입으로 게시글과 답변의 정보를 담은 객체의 참조값을 리턴합니다.
	public BoardQnAandComment selectBoardQnaView(BoardQnA boardQna , BoardQnAComment boardQnAComment) {
		
		BoardQnADao boardQnaDao = new BoardQnADao();
		BoardQnACommentDao boardQnACommentDao = new BoardQnACommentDao(); 
		
		Connection connection = null;
		BoardQnAandComment boardQnAandComment = new BoardQnAandComment();
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			boardQna = boardQnaDao.selectBoardQnaView(connection, boardQna);
			boardQnAComment = boardQnACommentDao.selectBoardQnaCommentView(connection, boardQnAComment);
			
			boardQnAandComment.setBoardQna(boardQna);
			boardQnAandComment.setBoardQnaComment(boardQnAComment);
			
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}	
		
		return boardQnAandComment;
	}
	
	// 설명 : 질문게시판 리스트에 데이터베이스 조회후 글 목록을 가져와 보여주는 메서드 입니다.
	// 매개변수 : 없습니다.
	// 리턴 : ArrayList<BoardQnAandMember> 클래스타입으로 게시글들의 정보가 담긴 객체의 참조값을 리턴합니다.
	public ArrayList<BoardQnAandMember> selectBoardQnaList(int currentPage, int pagePerRow) {
		
		BoardQnADao boardQnaDao = new BoardQnADao();
		Connection connection = null;
		ArrayList<BoardQnAandMember> arrayList = new ArrayList<BoardQnAandMember>();
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			arrayList = boardQnaDao.selectBoardQnaList(connection, currentPage, pagePerRow);
			
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
		
		return arrayList;
	}
	
	// 설명 : 게시글의 답변을 받아서 데이터베이스 조회후 답변이 있으면 수정하고 없으면 입력하는 메서드 입니다.
	// 매개변수 : BoardQnAComment 클래스 타입으로 답변내용을 담은 객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertBoardQnaComment(BoardQnAComment boardQnaComment) {
		
		BoardQnACommentDao boardQnACommentDao = new BoardQnACommentDao();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			BoardQnAComment boardQnACommet = boardQnACommentDao.selectBoardQnaCommentView(connection, boardQnaComment);
			
			if(boardQnACommet.getBoardQnaCommentContent() != null) {
				boardQnACommentDao.updateBoardQnaComment(connection, boardQnaComment);
			}else {
				boardQnACommentDao.insertBoardQnaComment(connection, boardQnaComment);
			}
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}

	}
	
	// 설명 : 질문게시판에 게시글을 작성하여 데이터베이스에 저장하는 메서드 입니다
	// 매개변수 : BoardQnA 클래스타입으로 게시글의 정보를 담은 객체의 참조값을 받습니다.
	// 리턴 : void로 업습니다.
	public void insertBoardQnaContent(BoardQnA boardQna) {
		
		BoardQnADao boardQnaDao = new BoardQnADao();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			boardQnaDao.insertBoardQnaContent(connection, boardQna);
			
			connection.commit();
		}catch(Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
	}
}
