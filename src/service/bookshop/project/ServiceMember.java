package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;

import dao.bookshop.project.MemberDao;
import dto.bookshop.project.Member;
import util.connetion.db.DBconnection;

public class ServiceMember {
	
	// 설명 : 회원정보 변경후 데이터 값을 받아 데이터베이스에 업데이트 하는 메서드 입니다.
	// 매개변수 : Member 클래스타입으로 member 객체의 참조값을 받습니다.
	// 리턴 : void로 없습니다.
	public void updateMember(Member member) {
		
		MemberDao memberDao = new MemberDao();
		Connection connection = null;
		
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			memberDao.updateMember(connection, member);
			
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
	
	// 설명 : 로그인후 아이디를 받아 회원정보를 조회후 회원정보를 리턴하는 메서드 입니다.
	// 매개변수 : String 참조타입으로 로그인시 아이디를 받습니다.
	// 리턴 : id 와 일치하는 회원정보를 담은 Member 클래스 객체의 참조값을 리턴합니다.
	public Member selectMember(String sessionId) {
		
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		Connection connection = null;
		
		try {
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			member = memberDao.selectMemberInfor(connection, sessionId);
			
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
		
		return member;
		
	}
	
	// 설명 : 아이디와 비밀번호를 받아 데이터베이스 조회후 결과가 있으면 로그인 여부를 리턴하고 조건문으로 회원정보를 받아오는 메서드 입니다.
	// 매개변수 : String 참조타입으로 memberId 와 memberPw 를 받습니다.
	// 리턴 : 회원정보를 담은 Member 클래스 객체의 참조값을 리턴합니다.
	public Member loginMember(String memberId, String memberPw) {
		
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			String result = memberDao.loginCheckMember(connection, memberId, memberPw);
			
			if(result.equals("로그인성공")){
				member = memberDao.selectMemberInfor(connection, memberId);
			}else if(result.equals("로그인실패")) {
				member = null;
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
		
		return member;
	}
	
	// 설명 : 회원정보를 받아 데이터베이스에 아이디가 존재하는지 확인후 회원가입 시키는 메서드 입니다.
	// 매개변수 : 회원정보를 담은  Member 클래스 타입의 member 객체의 참조값을 받습니다.
	// 리턴 : void 로 없습니다.
	public void insertMember(Member member) {
		
		MemberDao memberDao = new MemberDao();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			String result = memberDao.selectCheckMemberId(connection , member.getMemberId());
			
			if(result.equals("가입가능")) {
				memberDao.insertMember(connection , member);
			}else if(result.equals("아이디존재")) {
				System.out.println("아이디가 존재 합니다");
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
	
}