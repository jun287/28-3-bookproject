<!-- 28기 이원상 2018. 7. 18(수) shoppingCartAddAction.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.bookshop.project.ServiceShoppingCart"%>
<%@ page import="dto.bookshop.project.ShoppingCart" %>
<%
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("sessionId") == null){
		response.sendRedirect(request.getContextPath()+"/member/memberLoginForm.jsp");
	}
	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));			// bookView.jsp에서 넘겨받은 책번호	
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));		// bookView.jsp에서 넘겨받은 멤버번호
	int shoppingCartAmount = Integer.parseInt(request.getParameter("bookAmount"));	// bookView.jsp에서 넘겨받은 수량
	int shoppingCartPrice = Integer.parseInt(request.getParameter("totalPrice"));	// bookView.jsp에서 넘겨받은 금액
	System.out.println(memberNumber+"<--memberNumber");
	
	ShoppingCart shoppingCart = new ShoppingCart(bookNumber,memberNumber,shoppingCartAmount,shoppingCartPrice);
																					// 객체 생성시 매개변수로 값 대입하여 객체 생성시 초기값 setting
	ServiceShoppingCart serviceShoppingCart = new ServiceShoppingCart();			// ServiceShoppingCart클래스내 메소드 호출을 위한 인스턴스 생성
	serviceShoppingCart.insertShoppingCart(shoppingCart);							// 쇼핑카트 등록 메소드 호출
	response.sendRedirect(request.getContextPath()+"/shoppingCart/shoppingCartList.jsp?memberNumber="+memberNumber);	// 입력 후 해당 member의 shoppingCartList로 이동
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