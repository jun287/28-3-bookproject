// 2018. 07. 22 공세준

package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.bookshop.project.Member;
import util.connetion.db.DBconnection;

public class MemberDao {
	
	public void updateMemberPoint(int memberNumber, int memberPoint) {
		// 18.7.23 최지수
		// 구매완료 시 포인트 적립 or 차감하는 메서드
		// 매개변수 memberNumber 받아서 해당 회원만 업데이트
		// 리턴값 없음
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("UPDATE member SET member_point=? WHERE member_no=?");
			preparedStatement.setInt(1, memberPoint);
			preparedStatement.setInt(2, memberNumber);
			
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}
		}
		
	}
	
	// 설명 : id 를 받아서 데이터베이스에 일치하는 id 가 있으면 그 정보를 가져오는 메서드 입니다.
	// 매개변수 : String 타입으로 memberId를 받습니다.
	// 리턴 : 회원정보가 담긴 Member 클래스 객체의 참조값을 리턴 합니다.
	public Member selectMemberInfor(Connection connection, String memberId) {
		
		Member member = new Member();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT * FROM member WHERE member_id=?");
			preparedStatement.setString(1, memberId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				member.setMemberNum(resultSet.getInt("member_no"));
				member.setMemberId(resultSet.getString("member_id"));
				member.setMemberPw(resultSet.getString("member_pw"));
				member.setMemberName(resultSet.getString("member_name"));
				member.setMemberAddr(resultSet.getString("member_addr"));
				member.setMemberPoint(resultSet.getInt("member_point"));
				member.setMemberDate(resultSet.getString("member_date"));
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
		
		
		return member;
	}
	
	// 설명 : id와 pw를 받아서 데이터베이스에 있는 정보를 검색하여 로그인체크 하는 메서드 입니다.
	// 매개변수 : String 참조타입으로 memberId, memberPw 를 받습니다.
	// 리턴 : String 참조타입으로 조건문에 결과값인 "로그인성공" 또는 "로그인실패" 를 result에 대입후 리턴합니다. 
	public String loginCheckMember(Connection connection ,String memberId, String memberPw) {
	
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String result = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT * FROM member WHERE member_id=? and member_pw=?");
			preparedStatement.setString(1, memberId);
			preparedStatement.setString(2, memberPw);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				result = "로그인성공";
			}else {
				result = "로그인실패";
			}
			
		}catch(SQLException ex) {
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
		
		return result;
	}
	
	public String selectCheckMemberId(Connection connection , String memberId) {
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String result = "";
		
		try {
			
			preparedStatement = connection.prepareStatement("SELECT * FROM member WHERE member_id=?");
			preparedStatement.setString(1, memberId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				result = "아이디존재";
			}else {
				result = "가입가능";
			}
			
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally{
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
		
		return result;
	}
	
	// 설명 : 회원정보를 받아서 데이터베이스에 업데이트 하는 메서드 입니다.
	// 매개변수 : Member 클래스 타입으로 객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void updateMember(Connection connection, Member member) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("UPDATE member SET member_pw=?,member_name=?,member_addr=? WHERE member_id=?");
			preparedStatement.setString(1, member.getMemberPw());
			preparedStatement.setString(2, member.getMemberName());
			preparedStatement.setString(3, member.getMemberAddr());
			preparedStatement.setString(4, member.getMemberId());
			preparedStatement.executeUpdate();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		}finally {
			if(preparedStatement != null)try{
				preparedStatement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
	}
	
	// 설명 : 회원정보를 담은 Member 객체의 참조값을 받아 insert쿼리문을 실행시켜 데이터베이스에 저장 하는 메서드 입니다.
	// 매개변수 : Member 클래스 타입으로 객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void insertMember(Connection connection, Member member) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("INSERT INTO member(member_id, member_pw, member_name, member_addr,member_point, member_date) VALUES (?,?,?,?,'0',now())");
			preparedStatement.setString(1, member.getMemberId());
			preparedStatement.setString(2, member.getMemberPw());
			preparedStatement.setString(3, member.getMemberName());
			preparedStatement.setString(4, member.getMemberAddr());
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