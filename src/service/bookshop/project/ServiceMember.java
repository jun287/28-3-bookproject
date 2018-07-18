package service.bookshop.project;

import java.sql.Connection;
import java.sql.SQLException;

import dao.bookshop.project.MemberDao;
import dto.bookshop.project.Member;
import util.connetion.db.DBconnection;

public class ServiceMember {
	
	// ���� : ȸ������ ������ ������ ���� �޾� �����ͺ��̽��� ������Ʈ �ϴ� �޼��� �Դϴ�.
	// �Ű����� : Member Ŭ����Ÿ������ member ��ü�� �������� �޽��ϴ�.
	// ���� : void�� �����ϴ�.
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
	
	// ���� : �α����� ���̵� �޾� ȸ�������� ��ȸ�� ȸ�������� �����ϴ� �޼��� �Դϴ�.
	// �Ű����� : String ����Ÿ������ �α��ν� ���̵� �޽��ϴ�.
	// ���� : id �� ��ġ�ϴ� ȸ�������� ���� Member Ŭ���� ��ü�� �������� �����մϴ�.
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
	
	// ���� : ���̵�� ��й�ȣ�� �޾� �����ͺ��̽� ��ȸ�� ����� ������ �α��� ���θ� �����ϰ� ���ǹ����� ȸ�������� �޾ƿ��� �޼��� �Դϴ�.
	// �Ű����� : String ����Ÿ������ memberId �� memberPw �� �޽��ϴ�.
	// ���� : ȸ�������� ���� Member Ŭ���� ��ü�� �������� �����մϴ�.
	public Member loginMember(String memberId, String memberPw) {
		
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			String result = memberDao.loginCheckMember(connection, memberId, memberPw);
			
			if(result.equals("�α��μ���")){
				member = memberDao.selectMemberInfor(connection, memberId);
			}else if(result.equals("�α��ν���")) {
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
	
	// ���� : ȸ�������� �޾� �����ͺ��̽��� ���̵� �����ϴ��� Ȯ���� ȸ������ ��Ű�� �޼��� �Դϴ�.
	// �Ű����� : ȸ�������� ����  Member Ŭ���� Ÿ���� member ��ü�� �������� �޽��ϴ�.
	// ���� : void �� �����ϴ�.
	public void insertMember(Member member) {
		
		MemberDao memberDao = new MemberDao();
		Connection connection = null;
		
		try {
			
			connection = DBconnection.getConnetion();
			connection.setAutoCommit(false);
			
			String result = memberDao.selectCheckMemberId(connection , member.getMemberId());
			
			if(result.equals("���԰���")) {
				memberDao.insertMember(connection , member);
			}else if(result.equals("���̵�����")) {
				System.out.println("���̵� ���� �մϴ�");
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