<!-- 18.7.18 최지수 : bookOrdersAction.jsp -->
<!-- bookOrdersForm.jsp에서 주문버튼 누르면 처리하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.bookshop.project.Orders" %>
<%@ page import = "dao.bookshop.project.ExOrders" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	ExOrders eo = new ExOrders();
	Orders o = new Orders();
	
	o.setBookNumber(Integer.parseInt(request.getParameter("bookNumber")));
	o.setMemberNumber(Integer.parseInt(request.getParameter("memberNumber")));
	o.setOrdersPrice(Integer.parseInt(request.getParameter("ordersPrice")));
	o.setOrderAmount(Integer.parseInt(request.getParameter("orderAmount")));
	o.setOrdersAddress(request.getParameter("ordersAddress"));
	
	System.out.println(o.getBookNumber());
	System.out.println(o.getMemberNumber());
	System.out.println(o.getOrdersPrice());
	System.out.println(o.getOrderAmount());
	System.out.println(o.getOrdersAddress());
	
	eo.insertBookOrder(o);
%>