<!-- 28기 이원상 2018. 7. 18(수) shoppingCartAddAction.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.bookshop.project.ServiceShoppingCart"%>
<%
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("sessionId") == null){
		response.sendRedirect(request.getContextPath()+"/member/memberLoginForm.jsp");
	}
	int shoppingCartNumber = Integer.parseInt(request.getParameter("shoppingCartNumber"));								// shoppingCartList.jsp에서 넘겨받은 쇼핑카트 넘버
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));											// shoppingCartList.jsp에서 넘겨받은 멤버 넘버

	ServiceShoppingCart serviceShoppingCart = new ServiceShoppingCart();												// ServiceShoppingCart클래스내 메소드 호출을 위한 인스턴스 생성
	serviceShoppingCart.deleteShoppingCart(shoppingCartNumber);															// shoppingCart 삭제메소드
	response.sendRedirect(request.getContextPath()+"/shoppingCart/shoppingCartList.jsp?memberNumber="+memberNumber);	// 삭제 후  해당 member의 shoppingCartList.jsp로 이동
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장바구니 삭제</title>
	</head>
	<body>
	
	</body>
</html>