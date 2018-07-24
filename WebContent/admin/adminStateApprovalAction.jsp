<!-- 2018-07-23 김소희 / adminStateApproval.jsp -->
<!-- 관리자 주문 진행상태 승인 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.BookOrdersDao"%>			<!-- dao.bookshop.project패키지 안에 BookOrdersDo클래스 import -->
<%@ page import="dao.bookshop.project.MemberDao"%>				<!-- dao.bookshop.project패키지 안에 MemberDao클래스 import -->
<%@ page import="dto.bookshop.project.Orders"  %>				<!-- dto.bookshop.project패키지 안에 Orders클래스 import -->
<%@ page import="dto.bookshop.project.Member"  %>				<!-- dto.bookshop.project패키지 안에 Member클래스 import -->
<%@ page import="service.bookshop.project.ServiceMember" %>		<!-- service.bookshop.project패키지 안에  ServiceMember클래스 import-->
<%@ page import="dao.bookshop.project.BookDao" %>

<%
	request.setCharacterEncoding("UTF-8");

	/* int ordersNumber = Integer.parseInt(request.getParameter("ordersNumber"));

	BookOrdersDao bookOrdersDao = new BookOrdersDao();
	bookOrdersDao.updateStateApproval(ordersNumber);
	Orders orders = bookOrdersDao.selectOrders(ordersNumber);

	int memberNumber = orders.getMemberNumber();
	MemberDao memberDao = new MemberDao();		
	Member member = memberDao.selectMemberPoint(memberNumber);
	
	// book 테이블에서 book_point * orders 테이블에 orders_price  = 적립 포인트
	int buyPoint = 0;
	//int bookNo = 0;
	int memberPoint = member.getMemberPoint()+buyPoint;
	
	//BookDao bookDao = new BookDao()
	//bookDao.selectBook(bookNo);
	
	memberDao.updateMemberPoint(memberNumber, memberPoint); */
	
	BookOrdersDao bookOrdersDao = new BookOrdersDao();
	int ordersNumber = 0;
	int bookNumber = 0;
	bookOrdersDao.selectforUpdateBookPoint(bookNumber, ordersNumber);
	
%>