<!-- 2018-07-18 김소희 / bookOrderList.jsp -->
<%@page import="dto.bookshop.project.MemberAndBookAndShoppingCart"%>
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
				<th>주문번호</th>
				<th>상품번호</th>
				<th>주문가격</th>
				<th>주문수량</th>
			</tr>
		
<%
	request.setCharacterEncoding("UTF-8");
	
	int currentPage = 1;	// 시작 페이지 (1페이지)
	int pagePerRow = 3;		// 한 페이지에 보이는 글 수 (글 3개)
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));

	if(request.getParameter("currentPage") !=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int startRow = (currentPage - 1 ) * pagePerRow;		// 시작 페이지 = (현재 페이지 번호 -1) * 한 페이지에 보여주는 글 수
	
	BookOrdersDao bookOrdersDao = new BookOrdersDao();
	ArrayList<Orders> ordersList = bookOrdersDao.selectOrderByPage(currentPage, pagePerRow, memberNumber);
	
	for(int i=0; i<ordersList.size(); i++){
		Orders orders = ordersList.get(i);
%>
		
			<tr>
				<td><%=orders.getOrdersNumber()%></td>	<!-- 주문번호-->
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersDetail.jsp?ordersNumber=<%=orders.getOrdersNumber()%>"><%=orders.getBookNumber()%></a></td>		<!-- <a href="orders.getBookNumber()"></a> -> 임의로 넣어둔 것 bookDao 완성 되면 수정 -->
				<td><%= orders.getOrdersPrice() %></td>		<!-- book에서 OrdersPrice가져오기 -->
				<td><%= orders.getOrdersAmount() %></td>	<!-- book에서 OrdersAmount가져오기 -->
			</tr>
<%
	}
%>

		</table>
	
<% 
	int totalRow = bookOrdersDao.selectCount();			// 총 개수
	int lastPage = 0;									// 마지막 페이지
	
	if(totalRow % pagePerRow == 0) {
	    lastPage = totalRow / pagePerRow;				// 마지막 페이지 = 총 개수 나누기 한 페이지에 보이는 개수
	    
	}else{
	    lastPage = totalRow / pagePerRow + 1;			// 마지막 페이지 = 총 개수 나누기 한 페이지에 보이는 개수 + 1
	            
	}
	
	
	if(currentPage > 1){
%>
	 <a href="<%=request.getContextPath()%>/bookOrders/bookOrdersList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
	
	}
	if(currentPage < lastPage){
%>
	  <a href="<%=request.getContextPath()%>/bookOrders/bookOrdersList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
	}
%>



	</body>
</html>