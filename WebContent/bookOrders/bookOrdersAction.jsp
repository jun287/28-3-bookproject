<!-- 18.7.18 최지수 : bookOrdersAction.jsp -->
<!-- bookOrdersForm.jsp에서 주문버튼 누르면 처리하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.bookshop.project.Orders" %>
<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "service.bookshop.project.ServiceMember" %>
<%@ page import = "service.bookshop.project.ServiceBookOrders" %>


<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	
	ServiceMember serviceMember = new ServiceMember();										// ServiceMember객체생성
	ServiceBookOrders serviceBookOrders = new ServiceBookOrders();							// ServiceBookOrders 객체 생성
	Orders orders = new Orders();															// Orders객체생성
	
	int usePoint = Integer.parseInt(request.getParameter("usePoint"));						// 사용포인트 받아오기
	int memberPoint = 0;																	// 회원포인트 초기값 설정
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));				// 회원번호 받아오기
	int shoppingCartNumber = Integer.parseInt(request.getParameter("shoppingCartNumber"));	// 장바구니번호 받아오기

	orders.setBookNumber(Integer.parseInt(request.getParameter("bookNumber")));				// 받아온 값 Orders 안에 있는 set메서드로 값 세팅
	orders.setMemberNumber(Integer.parseInt(request.getParameter("memberNumber")));
	orders.setOrdersPrice(Integer.parseInt(request.getParameter("ordersPrice")));
	orders.setOrdersAmount(Integer.parseInt(request.getParameter("ordersAmount")));
	orders.setOrdersAddress(request.getParameter("ordersAddress"));
	
	
	Member member = serviceMember.selectMember((String)session.getAttribute("sessionId"));	// 회원정보 조회하는 메서드 호출
	
	memberPoint = member.getMemberPoint() - usePoint;										// 회원포인트 = 현재총포인트 - 사용포인트
	
	serviceBookOrders.insertBookOrders(memberNumber, memberPoint, orders, shoppingCartNumber);
	
	System.out.println(orders.getBookNumber());
	System.out.println(orders.getMemberNumber());
	System.out.println(orders.getOrdersPrice());
	System.out.println(orders.getOrdersAmount());
	System.out.println(orders.getOrdersAddress());
	
	response.sendRedirect(request.getContextPath() + "/bookOrders/bookOrdersList.jsp?memberNumber="+memberNumber);
	
%>