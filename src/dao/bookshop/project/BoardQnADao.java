// 2018. 07. 22 공세준

package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.bookshop.project.BoardQnA;
import dto.bookshop.project.BoardQnAComment;
import dto.bookshop.project.BoardQnAandMember;
import dto.bookshop.project.Member;

public class BoardQnADao {
	
	// 설명 : 질문게시판에 게시글을 삭제하는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 게시글의 정보를 담은 BoardQnA 클래스객체의 참조값을 받습니다.
	// 리턴 : void 로 없습니다.
	public void deleteBoardQnaContent(Connection connection, BoardQnA boardQna ) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("DELETE FROM qna WHERE qna_no=? and member_no=?");
			preparedStatement.setInt(1, boardQna.getBoardQnaNo());
			preparedStatement.setInt(2, boardQna.getMemberNo());
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

	// 설명 : 질문게시판에서 게시글의 상세정보를 조회후 가져오는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 글번호와 회원번호가 담긴 BoardQnA 객체참조값을 받습니다.
	// 리턴 : BoardQnA 클래스타입으로 게시글의 정보를 담으 객체의 참조값을 리턴합니다.
	public BoardQnA selectBoardQnaView(Connection connection, BoardQnA boardQna) {
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT * FROM qna WHERE qna_no=? and member_no=?");
			preparedStatement.setInt(1, boardQna.getBoardQnaNo());
			preparedStatement.setInt(2, boardQna.getMemberNo());
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				boardQna.setBoardQnaTitle(resultSet.getString("qna_title"));
				boardQna.setBoardQnaContent(resultSet.getString("qna_content"));
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
		
		return boardQna;
	}
	
	// 설명 : 질문게시판 리스트에 데이터베이스 조회후 글 목록을 가져와 보여주는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값을 받습니다.
	// 리턴 : ArrayList<BoardQnAandMember> 클래스타입으로 게시글들의 정보가 담긴 객체의 참조값을 리턴합니다.
	public ArrayList<BoardQnAandMember> selectBoardQnaList(Connection connection) {
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<BoardQnAandMember> arrayList = new ArrayList<BoardQnAandMember>();
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT bq.qna_no, m.member_no, bq.qna_title, m.member_id, substring(bq.qna_date,1,10) as date FROM qna bq INNER JOIN member m ON bq.member_no = m.member_no ORDER By bq.qna_no DESC");
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()){
				
				BoardQnA boardQna = new BoardQnA();
				boardQna.setBoardQnaNo(resultSet.getInt("bq.qna_no"));
				boardQna.setBoardQnaTitle(resultSet.getString("bq.qna_title"));
				boardQna.setBoardQnaDate(resultSet.getString("date"));
				
				Member member = new Member();
				member.setMemberId(resultSet.getString("m.member_id"));
				member.setMemberNum(resultSet.getInt("m.member_no"));
				
				BoardQnAandMember boardQnAandMember = new BoardQnAandMember();
				boardQnAandMember.setBoardQna(boardQna);
				boardQnAandMember.setMember(member);
				
				arrayList.add(boardQnAandMember);
				
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
		return arrayList;
	}
	
	
	// 설명 : 질문게시판에 글쓰기후 정보를 데이터베이스에 insert하는 메서드 입니다.
	// 매개변수 : Connection 클래스 타입으로 드라이버로딩, DB연결정보를 담은 connection 객체참조값과 BoardQnA 클래스타입으로 게시판내용등을 담은 boardQna 객체참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertBoardQnaContent(Connection connection, BoardQnA boardQna) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("INSERT INTO qna(member_no, qna_title, qna_content, qna_date) VALUES (?,?,?,now())");
			preparedStatement.setInt(1, boardQna.getMemberNo());
			preparedStatement.setString(2, boardQna.getBoardQnaTitle());
			preparedStatement.setString(3, boardQna.getBoardQnaContent());
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
