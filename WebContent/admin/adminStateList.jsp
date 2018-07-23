<!--2017.07.23 김소희 / adminStateList.jsp 관리자	 주문 진행상태 리스트-->
<%@ page language = "java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "dao.bookshop.project.BookOrdersDao" %>	<!-- dao.bookshop.project패키지 안에 BookOrdersDo클래스 import -->
<%@ page import = "dto.bookshop.project.Orders" %>			<!-- dto.bookshop.project패키지 안에 Orders클래스 import  -->
<%@ page import = "java.util.ArrayList" %>					<!-- ArrayList는 java.util.ArrayList에 포함 import -->
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>adminStateList</title>
	<style>
		table, th, td{
			border : 1px solid;
		}
	</style>
</head>
	<body>
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
<%
	request.setCharacterEncoding("UTF-8");
	
	int currentPage = 1;		// 시작 페이지 (1페이지)
	int pagePerRow = 3;			// 한 페이지에 보이는 글 수 (글 3개)
	
	if(request.getParameter("currentPage") !=null){
		currentPage =Integer.parseInt(request.getParameter("currentPage"));
	}
	int startRow = (currentPage - 1 ) * pagePerRow;		//시작 페이지 = (현재 페이지 번호  - 1) * 한 페이지에 보여주는 글 수
	
	BookOrdersDao bookOrdersDao = new BookOrdersDao();
	ArrayList<Orders> selectOrdersList = bookOrdersDao.selectOrdersState(currentPage, pagePerRow);
	
	for(int i=0; i<selectOrdersList.size(); i++){
		Orders orders = selectOrdersList.get(i);
%>
			<tr>
				<td><%=orders.getOrdersNumber()%></td>
				<td><%=orders.getBookNumber()%></td>
				<td><%=orders.getMemberNumber() %></td>
				<td><%=orders.getOrdersPrice() %></td>
				<td><%=orders.getOrdersAmount() %></td>
				<td><%=orders.getOrdersDate() %></td>
				<td><%=orders.getOrdersAddress() %></td>
				<%
					if(orders.getOrderState().equals("주문완료")){			//getOrderState()에 담겨있는 값이 "주문완료"랑 같으면  if문 실행 주문완료 클릭시 배송완료로 변경
				%>
					<td><a href="<%=request.getContextPath()%>/admin/adminStateApproval.jsp?ordersNumber=<%=orders.getOrdersNumber()%>"><%=orders.getOrderState() %></a></td>
				<%		
					}else{
				%>
					<td><%=orders.getOrderState() %></td>
				<%
					}
				%>
			</tr>
<% 	
	}
%>
		</table>
<%
	int totalRow = bookOrdersDao.selectCount();		// 총 페이지
	int lastPage = 0;								// 마지막 페이지
	
	if(totalRow % pagePerRow == 0){				
		lastPage = totalRow / pagePerRow;			// 마지막 페이지 = 총 페이지 / 한 페이지에 보이는 글 수
	}else {
		lastPage = totalRow / pagePerRow + 1;		// 마지막 페이지 = 총 페이지 / 한 페이지에 보이는 글 수  + 1
	
	}
	
	
	if(currentPage > 1){							// currentPage(시작페이지)가 1보다 크면
%>
	<a href="<%=request.getContextPath()%>/admin/adminStateList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<% 		
	}
	if(currentPage < lastPage){						// currentPage(시작페이지)가 lastPage(마지막페이지)보다 작으면
%>
	<a href="<%=request.getContextPath()%>/admin/adminStateList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
	}
%>

	</body>
</html>