package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.bookshop.project.Member;
import util.connetion.db.DBconnection;

public class MemberDao {
	
	
	// ���� : id �� �޾Ƽ� �����ͺ��̽��� ��ġ�ϴ� id �� ������ �� ������ �������� �޼��� �Դϴ�.
	// �Ű����� : String Ÿ������ memberId�� �޽��ϴ�.
	// ���� : ȸ�������� ��� Member Ŭ���� ��ü�� �������� ���� �մϴ�.
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
		}
		
		
		return member;
	}
	
	// ���� : id�� pw�� �޾Ƽ� �����ͺ��̽��� �ִ� ������ �˻��Ͽ� �α���üũ �ϴ� �޼��� �Դϴ�.
	// �Ű����� : String ����Ÿ������ memberId, memberPw �� �޽��ϴ�.
	// ���� : String ����Ÿ������ ���ǹ��� ������� "�α��μ���" �Ǵ� "�α��ν���" �� result�� ������ �����մϴ�. 
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
				result = "�α��μ���";
			}else {
				result = "�α��ν���";
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
				result = "���̵�����";
			}else {
				result = "���԰���";
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
	
	// ���� : ȸ�������� ���� Member ��ü�� �������� �޾� insert�������� ������� �����ͺ��̽��� ���� �ϴ� �޼��� �Դϴ�.
	// �Ű����� : Member Ŭ���� Ÿ������ ��ü�� �������� �޽��ϴ�.
	// ���� : void�� �����ϴ�.
	public void insertMember(Connection connection, Member member) {
		
		PreparedStatement preparedStatement = null;
		
		try {
			
			preparedStatement = connection.prepareStatement("INSERT INTO member(member_id, member_pw, member_name, member_addr, member_date) VALUES (?,?,?,?,now())");
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
