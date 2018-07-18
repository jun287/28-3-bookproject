<!-- 28기 이원상 2018. 7. 18(수) shoppingCartList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.ShoppingCartDao"%>
<%@ page import="dto.bookshop.project.ShoppingCart"%>
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
			<th></th><th></th><th></th>
<%
	request.setCharacterEncoding("utf-8");
	int currentPage = (request.getParameter("currentPage") == null) ? 1 : Integer.parseInt(request.getParameter("currentPage"));
	int pagePerRow = (request.getParameter("pagePerRow") == null) ? 5 : Integer.parseInt(request.getParameter("pagePerRow"));
																						// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	/* int memberNumber = Integer.parseInt(request.getParameter("memberNumber")); */
	int memberNumber = 1; 
	
	ShoppingCartDao shoppingCartDao = new ShoppingCartDao();							// ShoppingCartDao클래스내 메소드 호출을 위한 인스턴스 생성
	ArrayList<ShoppingCart> selectShoppingCartList = new ArrayList<ShoppingCart>();		// ShoppingCartDao클래스내 메소드의 리턴값을 받기 위한 인스턴스 생성
	ShoppingCart shoppingCart = new ShoppingCart();										// ArrayList<ShoppingCart>클래스내 메소드의 리턴값을 받기 위한 인스턴스 생성
	
	selectShoppingCartList = shoppingCartDao.selectShoppingCartListBypage(memberNumber, currentPage, pagePerRow);	// 메소드 호출, 리턴값 참조변수에 대입
	
	int i = 0, selectShoppingCartListSize = selectShoppingCartList.size(); 
	for(i=0; i<selectShoppingCartListSize; i++){
		shoppingCart=selectShoppingCartList.get(i); 
%>
			<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp" method="post">
			<!-- shoppingcart_no,book_no,member_no,shoppingcart_amount,shoppingcart_price,shoppingcart_date -->
					<label for="bookNumber">일련 번호</label>
					<input type="text" name="shoppingCartNumber" value="<%=shoppingCart.getShoppingCartNumber() %>" readonly>
					<label for="bookNumber">책 번호</label>
					<input type="text" name="bookNumber" value="<%=shoppingCart.getBookNumber() %>" readonly>
					<label for="ShoppingCartAmount">수량</label>
					<input type="text" name="shoppingCartAmount" value="<%=shoppingCart.getShoppingCartAmount() %>" readonly>
					<label for="ShoppingCartPrice">가격</label>
					<input type="text" name="shoppingCartPrice" value="<%=shoppingCart.getShoppingCartPrice()%>" readonly>
					<label for="shoppingCartDate">담은 일시</label>
					<input type="text" name="shoppingCartDate" value="<%=shoppingCart.getShoppingCartDate()%>" readonly>
					<input type="submit" value="구매하기">			
			</form>
<%		
	}
%>
		</table>
	</body>
</html>