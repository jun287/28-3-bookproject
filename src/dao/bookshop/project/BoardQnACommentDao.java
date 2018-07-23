// 2018. 07. 23 공세준

package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.bookshop.project.BoardQnA;
import dto.bookshop.project.BoardQnAComment;

public class BoardQnACommentDao {
	
	// 설명 : 게시글에 답변을 삭제하는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 답변의 정보를 담은  BoardQnACommnet 클래스객체의 참조값을 받습니다.
	// 리턴 : void 로 없습니다.
	public void deleteBoardQnaComment(Connection connection, BoardQnAComment boardQnAComment) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("DELETE FROM qna_comment WHERE qna_no=? and admin_no=?");
			preparedStatement.setInt(1, boardQnAComment.getBoardQnaNo());
			preparedStatement.setInt(2, boardQnAComment.getAdminNo());
			preparedStatement.executeUpdate();
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			if(preparedStatement != null)try{
				preparedStatement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}

		}
		
	}
	
	// 설명 : 게시글의 답변 내용을 수정하는 메서드입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 수정한 답변내용 및 게시글 번호가 담긴 BoardQnAComment 클래스객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void updateBoardQnaComment(Connection connection, BoardQnAComment boardQnAComment) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("UPDATE qna_comment SET comment_content=? WHERE qna_no=?");
			preparedStatement.setString(1, boardQnAComment.getBoardQnaCommentContent());
			preparedStatement.setInt(2, boardQnAComment.getBoardQnaNo());
			preparedStatement.executeUpdate();
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			if(preparedStatement != null)try{
				preparedStatement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}

		}
	}
	
	// 설명 : 게시글의 답변내용을 조회후 가져오는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 게시글의 번호가 담긴 BoardQnAComment 클래스객체의 참조값을 받습니다.
	// 리턴 : BoardQnAComment 클래스 타입으로 게시글의 답변내용이 담긴 객체의 참조값이 리턴됩니다.
	public BoardQnAComment selectBoardQnaCommentView(Connection connection, BoardQnAComment boardQnaComment) {
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		BoardQnAComment boardQnAComment = new BoardQnAComment();
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT * FROM qna_comment WHERE qna_no=?");
			preparedStatement.setInt(1, boardQnaComment.getBoardQnaNo());
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				boardQnAComment.setBoardQnaCommentContent(resultSet.getString("comment_content"));
				boardQnAComment.setBoardQnaCommentDate(resultSet.getString("comment_date"));
			}
					
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			if(preparedStatement != null)try{
				preparedStatement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
			if(resultSet != null)try{
				resultSet.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}

		}
		
		return boardQnAComment;
	}
	
	// 설명 : 게시글의 답변을 데이터베이스에 입력하는 메서드입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 답변내용이 담긴 BoardQnAComment 클래스객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertBoardQnaComment(Connection connection, BoardQnAComment boardQnAComment) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("INSERT INTO qna_comment(qna_no, admin_no, comment_content, comment_date) VALUES (?,?,?,now())");
			preparedStatement.setInt(1, boardQnAComment.getBoardQnaNo());
			preparedStatement.setInt(2, boardQnAComment.getAdminNo());
			preparedStatement.setString(3, boardQnAComment.getBoardQnaCommentContent());
			
			preparedStatement.executeUpdate();
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally {
			if(preparedStatement != null)try{
				preparedStatement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}

		}
		
	}
	
}
