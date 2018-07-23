<!-- 2018-07-23 김소희 / adminStateApproval.jsp (관리자 진행상태 승인) -->
<%@ page import="dao.bookshop.project.BookOrdersDao"%>
<%@ page import="dao.bookshop.project.MemberDao"%>
<%@ page import="dto.bookshop.project.Orders"  %>	
<%@ page import="dto.bookshop.project.Member"  %>
<%@ page import="service.bookshop.project.ServiceMember" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int ordersNumber = Integer.parseInt(request.getParameter("ordersNumber"));

	BookOrdersDao bookOrdersDao = new BookOrdersDao();
	MemberDao memberDao = new MemberDao();			
	
	bookOrdersDao.updateStateApproval(ordersNumber);
	Orders orders = bookOrdersDao.selectOrders(ordersNumber);
	
	
	int memberNumber = orders.getMemberNumber();
	
	Member member = memberDao.selectMemberPoint(memberNumber);
	
	//북 테이블 받아와서 가격 원가 받아오기 그리고 수량조회해서 원가 * 수량 * 5/100 = 적립 포인트
	int buyPoint = 0;
	int memberPoint = member.getMemberPoint()+buyPoint;
	
	memberDao.updateMemberPoint(memberNumber, memberPoint);
%>