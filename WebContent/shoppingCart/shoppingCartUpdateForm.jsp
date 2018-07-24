<!-- 28기 이원상 2018. 7. 24(화) shoppingCartUpdateForm.jsp -->
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
		<style>
			tr, td, th{
				border:1px solid #353535;
			}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>장바구니 수정화면 리스트</title>
	</head>
	<body>
		<h1>장바구니</h1>
		<form action="<%=request.getContextPath() %>/shoppingCart/shoppingCartList.jsp" method="post" id="selectForm">
<%
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("sessionId") == null){
		response.sendRedirect(request.getContextPath()+"/member/memberLoginForm.jsp");
	}
	int currentPage = (request.getParameter("currentPage") == null) ? 1 : Integer.parseInt(request.getParameter("currentPage"));	// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	// 현재 페이지		
	int pagePerRow = (request.getParameter("pagePerRow") == null) ? 5 : Integer.parseInt(request.getParameter("pagePerRow"));		// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	// 페이지당 볼 행의 수		
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));
	if(pagePerRow == 3){
%>
			<select id="pagePerRow" name="pagePerRow">
				<option value="3" selected>3개씩 보기</option>
				<option value="5">5개씩 보기</option>
				<option value="7">7개씩 보기</option>
			</select>
<%		
	}else if(pagePerRow == 5){
%>
			<select id="pagePerRow" name="pagePerRow">
				<option value="3">3개씩 보기</option>
				<option value="5" selected>5개씩 보기</option>
				<option value="7">7개씩 보기</option>
			</select>
<%		
	}else if(pagePerRow == 7){
%>
			<select id="pagePerRow" name="pagePerRow">
				<option value="3">3개씩 보기</option>
				<option value="5">5개씩 보기</option>
				<option value="7" selected>7개씩 보기</option>
			</select>
<%		
	}
%>	
			<input type="submit" value="보기설정">
		</form>
		<table>
			<thead>
				<tr>
					<th>장바구니 번호</th><th>책 번호</th><th>책이름</th><th>저자</th><th>구매수량</th><th>가격</th><th>담은날짜</th><th>수정</th>
				</tr>	
			</thead>
			<tbody>	
<%
	ShoppingCartDao shoppingCartDao = new ShoppingCartDao();															// ShoppingCartDao클래스내 메소드 호출을 위한 인스턴스 생성
	int lastPage=shoppingCartDao.countMemberShoppingCart(memberNumber, pagePerRow);
	ArrayList<MemberAndBookAndShoppingCart> selectShoppingCartList = new ArrayList<MemberAndBookAndShoppingCart>();		// ShoppingCartDao클래스내 메소드의 리턴값을 받기 위한 인스턴스 생성
	MemberAndBookAndShoppingCart memberAndBookAndShoppingCart = new MemberAndBookAndShoppingCart();						// ArrayList<ShoppingCart>클래스내 메소드의 리턴값을 받기 위한 인스턴스 생성
	
	selectShoppingCartList = shoppingCartDao.selectShoppingCartListBypage(memberNumber, currentPage, pagePerRow);		// 메소드 호출, 리턴값 참조변수에 대입
	
	int i = 0, selectShoppingCartListSize = selectShoppingCartList.size();
	for(i=0; i<selectShoppingCartListSize; i++){
		memberAndBookAndShoppingCart=selectShoppingCartList.get(i); 
%>										
				<form action="<%=request.getContextPath()%>/shoppingCart/shoppingCartUpdateAction.jsp" method="post">	
					<tr>
						<td><%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartNumber()%></td>
						<td><%=memberAndBookAndShoppingCart.getShoppingCart().getBookNumber() %></td>
						<td><%=memberAndBookAndShoppingCart.getBook().getBookName() %></td>
						<td><%=memberAndBookAndShoppingCart.getBook().getBookAuthor() %></td>
						<td><input type="number" style="text-align:center;" name="updateShoppingCartAmount" value="<%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartAmount() %>"></td>
						<td><%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartPrice()%></td>
						<td><%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartDate() %></td>
						<td>
		 					<input type="hidden" name="shoppingCartNumber" value="<%=memberAndBookAndShoppingCart.getShoppingCart().getShoppingCartNumber()%>" readonly>
							<input type="hidden" name="memberNumber" value="<%=memberAndBookAndShoppingCart.getMember().getMemberNum()%>" readonly>
							<input type="hidden" name="bookPrice" value="<%=memberAndBookAndShoppingCart.getBook().getBookPrice()%>" readonly>
							<input type="submit" value="수정하기">						
						</td>
					</tr>
				</form>		
<%			
	}
%>				
			</tbody>
		</table>
		<div>
<%
	if(currentPage !=0 && currentPage != 1){
%>
			<a href="<%=request.getContextPath() %>/shoppingCart/shoppingCartList.jsp?currentPage=<%=currentPage-1 %>&pagePerRow=<%=pagePerRow%>">이전</a>
<%
	}for(int p=1; p<=lastPage; p++){
%>		
			<a href="<%=request.getContextPath() %>/shoppingCart/shoppingCartList.jsp?currentPage=<%=p%>&pagePerRow=<%=pagePerRow%>"><%=p%></a>
<%		
	}if(currentPage < lastPage){
%>	
			<a href="<%=request.getContextPath() %>/shoppingCart/shoppingCartList.jsp?currentPage=<%=currentPage+1 %>&pagePerRow=<%=pagePerRow%>">다음</a>
<%
	}
%>		
		</div>	
	</body>
</html>