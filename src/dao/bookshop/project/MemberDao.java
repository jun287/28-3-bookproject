// 2018. 07. 22 怨듭�몄�

package dao.bookshop.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.bookshop.project.Member;
import util.connetion.db.DBconnection;

public class MemberDao {
	
	public Member selectMemberPoint(int memberNumber) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Member member = null;
		try {
			
			connection = DBconnection.getConnetion();
			preparedStatement = connection.prepareStatement("SELECT member_no,member_id,member_pw,member_name,member_addr,member_point,member_date FROM member WHERE member_no=?");
			preparedStatement.setInt(1, memberNumber);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				member = new Member();
				member.setMemberNum(resultSet.getInt("member_no"));
				member.setMemberId(resultSet.getString("member_id"));
				member.setMemberPw(resultSet.getString("member_pw"));
				member.setMemberName(resultSet.getString("member_name"));
				member.setMemberAddr(resultSet.getString("member_point"));
				member.setMemberDate(resultSet.getString("member_date"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(resultSet!=null) try{ resultSet.close(); } catch (SQLException e) {}	
			if(preparedStatement!=null) try{ preparedStatement.close(); } catch (SQLException e) {}	
			if(connection!=null) try{ connection.close(); } catch (SQLException e) {}
		}
		return member;
	
	}
	
	public void updateMemberPoint(int memberNumber, int memberPoint) {
		// 18.7.23 理�吏���
		// 援щℓ��猷� �� �ъ�명�� ��由� or 李④����� 硫�����
		// 留ㅺ�蹂��� memberNumber 諛����� �대�� ����留� ���곗�댄��
		// 由ы�닿� ����
		
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
	
	// �ㅻ� : id 瑜� 諛����� �곗�댄�곕��댁�ㅼ�� �쇱����� id 媛� ���쇰㈃ 洹� ��蹂대�� 媛��몄�ㅻ�� 硫����� ������.
	// 留ㅺ�蹂��� : String �����쇰� memberId瑜� 諛��듬����.
	// 由ы�� : ������蹂닿� �닿릿 Member �대���� 媛�泥댁�� 李몄“媛��� 由ы�� �⑸����.
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
	
	// �ㅻ� : id�� pw瑜� 諛����� �곗�댄�곕��댁�ㅼ�� ���� ��蹂대�� 寃������� 濡�洹몄�몄껜�� ���� 硫����� ������.
	// 留ㅺ�蹂��� : String 李몄“�����쇰� memberId, memberPw 瑜� 諛��듬����.
	// 由ы�� : String 李몄“�����쇰� 議곌굔臾몄�� 寃곌낵媛��� "濡�洹몄�몄�깃났" ���� "濡�洹몄�몄�ㅽ��" 瑜� result�� ������ 由ы�댄�⑸����. 
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
				result = "濡�洹몄�몄�깃났";
			}else {
				result = "濡�洹몄�몄�ㅽ��";
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
				result = "���대��議댁��";
			}else {
				result = "媛���媛���";
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
	
	// �ㅻ� : ������蹂대�� 諛����� �곗�댄�곕��댁�ㅼ�� ���곗�댄�� ���� 硫����� ������.
	// 留ㅺ�蹂��� : Member �대���� �����쇰� 媛�泥댁�� 李몄“媛��� 諛��듬����.
	// 由ы�� : void濡� ���듬����.
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
	
	// �ㅻ� : ������蹂대�� �댁�� Member 媛�泥댁�� 李몄“媛��� 諛��� insert荑쇰━臾몄�� �ㅽ����耳� �곗�댄�곕��댁�ㅼ�� ���� ���� 硫����� ������.
	// 留ㅺ�蹂��� : Member �대���� �����쇰� 媛�泥댁�� 李몄“媛��� 諛��듬����.
	// 由ы�� : void濡� ���듬����.
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