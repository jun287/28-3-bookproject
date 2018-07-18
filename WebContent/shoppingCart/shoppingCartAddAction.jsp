<!-- 28기 이원상 2018. 7. 18(수) bookAddCartAction.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.ShoppingCartDao" %>
<%@ page import="dto.bookshop.project.ShoppingCart" %>
<%

	request.setCharacterEncoding("utf-8");
	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));		// bookView.jsp에서 넘겨받은 책번호	
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));	// bookView.jsp에서 넘겨받은 멤버번호
	int shoppingCartAmount = Integer.parseInt(request.getParameter(""));		// bookView.jsp에서 넘겨받은 수량
	// book select 조회 메소드	
	
	ShoppingCart shoppingCart = new ShoppingCart();								// ShoppingCart 인스턴스 생성 및 참조변수로 인스턴스 가르킴			
	shoppingCart.setBookNumber(0);
	shoppingCart.setMemberNumber(0);
	shoppingCart.setShoppingCartAmount(0);
	shoppingCart.setShoppingCartPrice(0);
	shoppingCart.setShoppingCartDate("");
	ShoppingCartDao shoppingCartDao= new ShoppingCartDao();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장바구니 추가</title>
	</head>
	<body>
	
	</body>
</html>