<!-- 2018-07-18 김소희 / bookOrderList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.bookshop.project.BookOrdersDao" %>	<!-- dao.bookshop.project패키지 안에 BookOrdersDo클래스 import -->
<%@ page import = "dto.bookshop.project.Orders" %>			<!-- dto.bookshop.project패키지 안에 Orders클래스 import  -->
<%@ page import = "java.util.ArrayList" %>					<!-- ArrayList는 java.util.ArrayList에 포함 import -->

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookOrderList</title>
	<style>
		table, th, td{
			border : 1px solid;
		}
	</style>
	</head>
	<body>
	<table>
		<tr>
			<th>상품번호</th>
			<th>회원번호</th>
			<th>주문가격</th>
			<th>주문수량</th>
			<th>주문날짜</th>
			<th>주문주소</th>
			<th>진행상태</th>
		</tr>
		
<%
	request.setCharacterEncoding("UTF-8");
	
	int currentPage = 1;	// 페이지 번호 1페이지
	int rowPerPage = 3;		// 한 페이지에 보여주는 페이지 수 3개
	
	if(request.getParameter("currentPage") !=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int startRow = (currentPage - 1 ) * rowPerPage;		// 시작 = (현재 페이지 -1) * 한 페이지에 보여주는 페이지 수
	
	BookOrdersDao bookOrdersDao = new BookOrdersDao();
	ArrayList<Orders> ordersList = bookOrdersDao.selectOrderByPage(currentPage, rowPerPage);
	
	for(int i=0; i<ordersList.size(); i++){
		Orders orders = ordersList.get(i);
%>
		
		<tr>
			<td><%= orders.getOrdersNumber() %></td>
			<td><%= orders.getBookNumber() %></td>
			<td><%= orders.getMemberNumber() %></td>
			<td><%= orders.getOrdersPrice() %></td>
			<td><%= orders.getOrdersAmount() %></td>
			<td><%= orders.getOrdersDate() %></td>
			<td><%= orders.getOrdersAddress() %></td>
			<td><%= orders.getOrderState() %></td>
		</tr>
<% 		
	}		
%>
	</table>
	<form action = "<%=request.getContextPath()%>/bookOrders/bookOrdersState.jsp" method="post">
		<input type="submit" value="주문완료">
	</form>
<%

%>


<%
	
%>



	
	</body>
</html>