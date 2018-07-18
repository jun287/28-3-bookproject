<!-- 28기 이원상 2018. 7. 18(수) shoppingCartAddAction.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.ShoppingCartDao" %>
<%

	request.setCharacterEncoding("utf-8");
	int shoppingCartNumber = Integer.parseInt(request.getParameter("shoppingCartNumber"));		// shoppingCartList.jsp에서 넘겨받은 쇼핑카트 넘버
	// book select 조회 메소드	
	
	ShoppingCartDao shoppingCartDao= new ShoppingCartDao();
	shoppingCartDao.deleteShoppingCart(shoppingCartNumber);
	response.sendRedirect(request.getContextPath()+"./shoppingCartList.jsp?");					// 입력 후 해당 member의 bookView.jsp로 이동
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