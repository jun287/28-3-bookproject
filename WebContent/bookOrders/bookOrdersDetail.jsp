<!-- 2018-07-23 김소희 / bookOrdersDetail.jsp -->
<!-- 주문상세정보 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.bookshop.project.BookOrdersDao" %>		<!-- dao.bookshop.project패키지 안에 BookOrdersDao클래스 import  -->
<%@ page import = "dto.bookshop.project.Orders"  %>				<!-- dto.bookshop.project패키지 안에 Orders클래스 import  -->
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>bookOrdersDetail</title>
	<style>
		table,td{
			border : 1px solid;
		}
	</style>
</head>
<body>
<%
	int ordersNumber = Integer.parseInt(request.getParameter("ordersNumber"));
	BookOrdersDao bookOrdersDao = new BookOrdersDao();
	Orders orders = bookOrdersDao.selectOrders(ordersNumber);
%>
		<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersList.jsp">
			<input type="hidden" name="memberNumber" value="<%=orders.getMemberNumber()%>">
			<input type="submit" value="돌아가기">
			<table>
				<tr>
					<td>주문번호</td>
					<td>상품번호</td>
					<td>회원번호</td>
					<td>상품가격</td>
					<td>상품수량</td>
					<td>주문날짜</td>
					<td>배송주소</td>
					<td>진행상태</td>
				</tr>
				<tr>
					<td><%=orders.getOrdersNumber() %></td>
					<td><%=orders.getBookNumber() %></td>
					<td><%=orders.getMemberNumber() %></td>
					<td><%=orders.getOrdersPrice() %></td>
					<td><%=orders.getOrdersAmount() %></td>
					<td><%=orders.getOrdersDate() %></td>
					<td><%=orders.getOrdersAddress() %></td>
					<td><%=orders.getOrderState() %></td>			
				</tr>	
			</table>
		</form>
	</body>
</html>