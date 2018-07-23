<!-- 18.7.18 최지수 : bookOrdersAction.jsp -->
<!-- bookOrdersForm.jsp에서 주문버튼 누르면 처리하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.bookshop.project.Orders" %>
<%@ page import = "dao.bookshop.project.BookOrdersDao" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	BookOrdersDao bookOrderDao = new BookOrdersDao();
	Orders orders = new Orders();
	
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
	
	bookOrderDao.insertBookOrders(orders);
%>