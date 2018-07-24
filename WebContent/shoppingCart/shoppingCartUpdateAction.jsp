<!-- 28기 이원상 2018. 7. 24(화) shoppingCartUpdateAction.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.ShoppingCartDao"%>
<%
	request.setCharacterEncoding("UTF-8");
	int shoppingCartNumber = Integer.parseInt(request.getParameter("shoppingCartNumber"));					// shoppingCartUpdateForm.jsp에서 넘겨받은 쇼핑카트번호
	int updateShoppingCartAmount = Integer.parseInt(request.getParameter("updateShoppingCartAmount"));		// shoppingCartUpdateForm.jsp에서 넘겨받은 수정된 쇼핑카트수량	
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));								// shoppingCartUpdateForm.jsp에서 넘겨받은 멤버번호
	int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));									// shoppingCartUpdateForm.jsp에서 넘겨받은 책 가격
	
	int updateShoppingCartPrice = updateShoppingCartAmount * bookPrice;										// 수정될 가격(책가격 * 수정된 수량)
	System.out.println(shoppingCartNumber+"<--shoppingCartNumber");											
	System.out.println(updateShoppingCartAmount+"<--updateShoppingCartAmount");
	System.out.println(memberNumber+"<--memberNumber");
	System.out.println(bookPrice+"<--bookPrice");
	System.out.println(updateShoppingCartPrice+"<--updateShoppingCartPrice");
	
	ShoppingCartDao shoppingCartDao = new ShoppingCartDao();
	shoppingCartDao.updateShoppingCart(shoppingCartNumber, updateShoppingCartAmount, updateShoppingCartPrice);
	response.sendRedirect(request.getContextPath()+"/shoppingCart/shoppingCartList.jsp?memberNumber="+memberNumber);	// 수정 후 해당 member의 shoppingCartList로 이동
%>
<!DOCTYPE html>
<html>
	<head>
		<style>
			tr, td, th{
				border:1px solid #353535;
			}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장바구니 수정처리</title>
	</head>
	<body>
	</body>
</html>