<!-- 2018-07-23 김소희 / adminStateApprovalAction.jsp -->
<!-- 관리자 주문 진행상태 승인 후 포인트 적립과 재고변경 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.BookOrdersDao"%>			<!-- dao.bookshop.project패키지 안에 BookOrdersDo클래스 import -->
<%@ page import="dao.bookshop.project.MemberDao"%>				<!-- dao.bookshop.project패키지 안에 MemberDao클래스 import -->
<%@ page import="dto.bookshop.project.Orders"  %>				<!-- dto.bookshop.project패키지 안에 Orders클래스 import -->
<%@ page import="dto.bookshop.project.Book"  %>					<!-- dto.bookshop.project패키지 안에 Book클래스 import -->
<%@ page import="dto.bookshop.project.Member"  %>				<!-- dto.bookshop.project패키지 안에 Member클래스 import -->
<%@ page import="service.bookshop.project.ServiceMember" %>		<!-- service.bookshop.project패키지 안에  ServiceMember클래스 import-->
<%@ page import="dao.bookshop.project.BookDao" %>				<!-- dao.bookshop.project패키지 안에 Member클래스 BookDao -->

<%
	request.setCharacterEncoding("UTF-8");
	
	int ordersNumber = Integer.parseInt(request.getParameter("ordersNumber"));
	
	BookOrdersDao bookOrdersDao = new BookOrdersDao();					// bookOrdersDao 변수 선언
	MemberDao memberDao = new MemberDao();								// memberDao 변수 선언
		
	bookOrdersDao.updateStateApproval(ordersNumber);					// 주문 정보 업데이트
	Orders orders = bookOrdersDao.selectOrders(ordersNumber);			// 한 개 주문 조회
	
	int memberNumber = orders.getMemberNumber();							
	int bookNumber = orders.getBookNumber();

	Member member = memberDao.selectMemberPoint(memberNumber);			// 멤버 포인트 조회
		
	// book 테이블에서 book_point * orders 테이블에 orders_amount  = 적립 포인트
	Book book = bookOrdersDao.selectBookOrder(bookNumber);				// BookOrder 조회
	int point = member.getMemberPoint();								
	int buyPoint = (book.getBookPoint()*orders.getOrdersAmount());		// 주문 후 포인트 = 책 포인트*주문 수량
	int memberPoint = member.getMemberPoint()+buyPoint;					// 멤버 포인트 = 기존 멤버포인트 +주문 후 포인트
	
	System.out.println(ordersNumber+"<-ordersNumber");					// 콘솔창 출력
	System.out.println(memberNumber+"<-memberNumber");
	System.out.println(bookNumber+"<-bookNumber");
	System.out.println(buyPoint+"<-buyPoint");
	System.out.println(memberPoint+"<-memberPoint");
	System.out.println(point+"<-point");
	
	bookOrdersDao.selectforUpdateBookAmount(bookNumber, ordersNumber);	// bookNumber 와  ordersNumber 조회 후 bookAmount 업데이트
	
	memberDao.updateMemberPoint(memberNumber, memberPoint);				// 주문 후 기존의 memberPoint 업데이트 
	
	response.sendRedirect(request.getContextPath() + "/admin/adminStateApprovalList.jsp");
	
%>