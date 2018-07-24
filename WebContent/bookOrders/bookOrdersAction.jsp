<!-- 18.7.18 최지수 : bookOrdersAction.jsp -->
<!-- bookOrdersForm.jsp에서 주문버튼 누르면 처리하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.bookshop.project.Orders" %>
<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "dao.bookshop.project.BookOrdersDao" %>
<%@ page import = "dao.bookshop.project.MemberDao" %>
<%@ page import = "dao.bookshop.project.ShoppingCartDao" %>
<%@ page import = "service.bookshop.project.ServiceMember" %>


<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	BookOrdersDao bookOrderDao = new BookOrdersDao();										// BookOrdersDao 객체 생성
	Orders orders = new Orders();															// Orders객체생성
	int usePoint = Integer.parseInt(request.getParameter("usePoint"));						// 사용포인트 받아오기
	int memberPoint = 0;																	// 회원포인트 초기값 설정
	//int buyPoint = Integer.parseInt(request.getParameter("buyPoint"));					// 구매시 적립포인트 받아오기
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));				// 회원번호 받아오기
	int shoppingCartNumber = Integer.parseInt(request.getParameter("shoppingCartNumber"));	// 장바구니번호 받아오기
	
	if(shoppingCartNumber>0){																// 장바구니 번호가 0보다 크다면
		ShoppingCartDao shoppingCartDao = new ShoppingCartDao();							// ShoppingCartDao객체생성
		shoppingCartDao.deleteShoppingCart(shoppingCartNumber);								// 장바구니 내 삭제 메서드 호출
	}
	
	ServiceMember ServiceMember = new ServiceMember();										// ServiceMember객체생성
	Member member = ServiceMember.selectMember((String)session.getAttribute("memberId"));	// 회원정보 조회하는 메서드 호출
	MemberDao memberDao = new MemberDao();													// MemberDao 객체생성
	
	memberPoint = member.getMemberPoint() - usePoint;										// 회원포인트 = 현재총포인트 - 사용포인트
	
	memberDao.updateMemberPoint(memberNumber, memberPoint);									// 회원 포인트 업데이트 메서드 호출
	
	
	orders.setBookNumber(Integer.parseInt(request.getParameter("bookNumber")));
	orders.setMemberNumber(Integer.parseInt(request.getParameter("memberNumber")));
	orders.setOrdersPrice(Integer.parseInt(request.getParameter("ordersPrice")));
	orders.setOrdersAmount(Integer.parseInt(request.getParameter("orderAmount")));
	orders.setOrdersAddress(request.getParameter("ordersAddress"));
	
	System.out.println(orders.getBookNumber());
	System.out.println(orders.getMemberNumber());
	System.out.println(orders.getOrdersPrice());
	System.out.println(orders.getOrdersAmount());
	System.out.println(orders.getOrdersAddress());
	
	bookOrderDao.insertBookOrders(orders);													// orders테이블 생성 메서드 호출
	
	response.sendRedirect(request.getContextPath() + "/bookOrders/bookOrdersList.jsp?memberNumber="+memberNumber);
	
%>