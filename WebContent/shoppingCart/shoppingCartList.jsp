<!-- 28기 이원상 2018. 7. 18(수) shoppingCartList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.ShoppingCartDao"%>
<%@ page import="dto.bookshop.project.MemberAndBookAndShoppingCart"%>
<%@ page import="dto.bookshop.project.ShoppingCart"%>
<%@ page import="dto.bookshop.project.Member"%>
<%@ page import="dto.bookshop.project.Book"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장바구니 리스트</title>
	</head>
	<body>
		<h1>장바구니</h1>
		<table>
			<thead>
				<tr>
					<th>장바구니 번호</th><th>책 번호</th><th>책이름</th><th>저자</th><th>구매수량</th><th>가격</th><th>담은날짜</th>
				</tr>	
			</thead>
			<tbody>	
<%
	request.setCharacterEncoding("utf-8");
	int currentPage = (request.getParameter("currentPage") == null) ? 1 : Integer.parseInt(request.getParameter("currentPage"));
	int pagePerRow = (request.getParameter("pagePerRow") == null) ? 5 : Integer.parseInt(request.getParameter("pagePerRow"));
																						// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));
	
	ShoppingCartDao shoppingCartDao = new ShoppingCartDao();															// ShoppingCartDao클래스내 메소드 호출을 위한 인스턴스 생성
	ArrayList<MemberAndBookAndShoppingCart> selectShoppingCartList = new ArrayList<MemberAndBookAndShoppingCart>();		// ShoppingCartDao클래스내 메소드의 리턴값을 받기 위한 인스턴스 생성
	MemberAndBookAndShoppingCart memberAndBookAndShoppingCart = new MemberAndBookAndShoppingCart();						// ArrayList<ShoppingCart>클래스내 메소드의 리턴값을 받기 위한 인스턴스 생성
	
	selectShoppingCartList = shoppingCartDao.selectShoppingCartListBypage(memberNumber, currentPage, pagePerRow);		// 메소드 호출, 리턴값 참조변수에 대입
	
	int i = 0, selectShoppingCartListSize = selectShoppingCartList.size(); 
	for(i=0; i<selectShoppingCartListSize; i++){
		memberAndBookAndShoppingCart=selectShoppingCartList.get(i); 
%>			
				<tr>
					<td><%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartNumber()%></td>
					<td><%=memberAndBookAndShoppingCart.getShoppingCart().getBookNumber() %></td>
					<td><%=memberAndBookAndShoppingCart.getBook().getBookName() %></td>
					<td><%=memberAndBookAndShoppingCart.getBook().getBookAuthor() %></td>
					<td><%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartPrice()%></td>
					<td><%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartDate() %></td>
					<td>
					<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp" method="post">	
						<input type="hidden" name="" value="<%=%>" readonly>
						<input type="hidden" name="" value="<%=%>" readonly>
						<input type="hidden" name="" value="<%=%>" readonly>
						<input type="hidden" name="" value="<%=%>" readonly>
						<input type="submit" value="구매하기">			
					</form>
					</td>
				</tr>	
<%			
	}
%>				
			</tbody>
		</table>
	</body>
</html>