<!-- 18.7.18 최지수 : bookOrdersForm.jsp -->
<!-- 상품 주문하는 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "service.bookshop.project.ServiceMember" %>
<%@ page import = "service.bookshop.project.ServiceBookOrders" %>
<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "dto.bookshop.project.Orders" %>
<%@ page import = "dto.bookshop.project.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%
	if(session.getAttribute("sessionId")==null){		// 로그인이 되어있는지 확인하여 로그인이 안되어있으면 로그인페이지로 이동
		response.sendRedirect(request.getContextPath() + "/member/memberLoginForm.jsp" );
	}

	ServiceMember serviceMember = new ServiceMember();										// ServiceMember 객체생성
	ServiceBookOrders serviceBookOrders = new ServiceBookOrders();							// ServiceBookOrders 객체생성
	
	
	Member Member = serviceMember.selectMember((String)session.getAttribute("sessionId"));	// 멤버의 정보를 받아오기 위한 메서드 호출
	

	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));		// book_no를 받아오는 코드
	
	Book book = serviceBookOrders.seslectBookOrders(bookNumber);				// book테이블의 정보를 받아오기 위한 메서드 호출
	
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));	// member_no를 받아오는 코드
	int ordersAmount = 0;														// 수량을 받아오는 코드
	int price = 0;																// 상품금액(임시)
	
	int memberPoint = Member.getMemberPoint();									// 회원의 포인트를 받아오는 변수
	int usePoint = 0;															// 포인트 사용금액을 받아오는 변수
	int addressCheck = 0;														// 기존주소인지, 새로운 주소인지 선택확인위한 변수 선언
	int shoppingCartNumber = 0;
	
	System.out.println(bookNumber + "<--bookNumber");
	System.out.println(memberNumber + "<--memberNumber");
	
	if(request.getParameter("usePoint")!=null){									// 포인트 사용금액이 있을 경우
		if(Integer.parseInt(request.getParameter("usePoint"))<=memberPoint){	// 입력한 값이 총 포인트의 값보다 낮거나 같을 경우에만
			usePoint = Integer.parseInt(request.getParameter("usePoint"));		// usePoint 변수에 받아온 값 입력
		}
	}
	
	
	if(request.getParameter("shoppingCartNumber") == null ){					// shoppingCartNumber가 넘어오지 않으면 view페이지에서 값 받기
		System.out.println("뷰페이지 받기");
		
		ordersAmount = Integer.parseInt(request.getParameter("amount"));
		price = Integer.parseInt(request.getParameter("price"));
	}else{
		System.out.println("장바구니 받기");
		shoppingCartNumber = Integer.parseInt(request.getParameter("shoppingCartNumber"));
		ordersAmount = Integer.parseInt(request.getParameter("shoppingCartAmount"));
		price = Integer.parseInt(request.getParameter("shoppingCartPrice"));
	}
	
	int buyPrice = price*ordersAmount;											// 금액 * 수량
	int ordersPrice = buyPrice-usePoint;										// 포인트 적용 후 최종 결제금액
	
	
	 if(request.getParameter("addressCheck")!=null){							// addressCheck를 받아오는 값이 있을때
		 addressCheck = Integer.parseInt(request.getParameter("addressCheck"));	// 새로운 주소를 선택한 값을 addressCheck변수에 대입
	 }
	
	String recentAddress = null;												// 최근배송지 받아오는 변수
	
	Orders orders = serviceBookOrders.selectOrdersRecontAddress(memberNumber);	// 최근배송지 받아오는 메서드
	if(orders != null){															// 메서드 호출하여 결과값이 있으면 
		recentAddress = orders.getOrdersAddress();								// 받아온 주소값 recentAddress변수에 대입
	}
	
	
%>	
	<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersAction.jsp" method="post">
		<input type="hidden" name="ordersPrice" value="<%=ordersPrice%>">
		<input type="hidden" name="bookNumber" value="<%=bookNumber%>">
		<input type="hidden" name="ordersAmount" value="<%=ordersAmount%>">
		<input type="hidden" name="bookNumber" value="<%=bookNumber%>">
		<input type="hidden" name="ordersAmount" value="<%=ordersAmount%>">
		<input type="hidden" name="memberNumber" value="<%=memberNumber%>">
		<input type="hidden" name="usePoint" value="<%=usePoint%>">
		<input type="hidden" name="shoppingCartNumber" value="<%=shoppingCartNumber %>">
		<table>
			<tr>
				<th>주문자이름</th>
				<td><%= Member.getMemberName() %></td>
			</tr>
			<tr>
				<th>배송주소</th>
<%
	if(shoppingCartNumber == 0){						// shoppingCartNumber가 넘어오지 않으면 view페이지에서 값 받기
		
%>		
		<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?bookNumber=<%=bookNumber %>&memberNumber=<%=memberNumber %>&amount=<%=ordersAmount%>&price=<%=price%>">기존주소</a></td>
		<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=1&usePoint=<%=usePoint%>&bookNumber=<%=bookNumber %>&memberNumber=<%=memberNumber %>&amount=<%=ordersAmount%>&price=<%=price%>">새로운주소</a></td>
		<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=2&usePoint=<%=usePoint%>&bookNumber=<%=bookNumber %>&memberNumber=<%=memberNumber %>&amount=<%=ordersAmount%>&price=<%=price%>">최근배송지</a></td>
<%
	}else{
%>
		<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?bookNumber=<%=bookNumber %>&memberNumber=<%=memberNumber %>&shoppingCartAmount=<%=ordersAmount%>&shoppingCartPrice=<%=price%>&shoppingCartNumber=<%=shoppingCartNumber%>">기존주소</a></td>
		<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=1&usePoint=<%=usePoint%>&bookNumber=<%=bookNumber %>&memberNumber=<%=memberNumber %>&shoppingCartAmount=<%=ordersAmount%>&shoppingCartPrice=<%=price%>&shoppingCartNumber=<%=shoppingCartNumber%>">새로운주소</a></td>
		<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=2&usePoint=<%=usePoint%>&bookNumber=<%=bookNumber %>&memberNumber=<%=memberNumber %>&shoppingCartAmount=<%=ordersAmount%>&shoppingCartPrice=<%=price%>&shoppingCartNumber=<%=shoppingCartNumber%>">최근배송지</a></td>
<%
	}
%>
				
			</tr>
			<tr>
<%
			if(addressCheck==0){				// 기존주소를 선택했을때
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress" value="<%=Member.getMemberAddr() %>" readonly="readonly"></td>
<%
			}else if(addressCheck==1){								// 새로운주소를 선택했을때
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress"></td>
<%
			}else{
				if(recentAddress == null){
%>
				<td colspan="3" align="center">최근배송지가 없습니다</td>
<%					
				}else{
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress" value="<%=recentAddress%>" readonly="readonly"></td>
<%
				}
			}
%>
				</tr>
		</table>
		<table>
			<tr>
				<th>상품명</th>
				<td><%=book.getBookName() %></td>
			</tr>
			<tr>
				<th>수량</th>
				<td><%=ordersAmount %></td>
			</tr>
		</table>
		<button>주문하기</button>
	</form>
	<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp" method="post">
		<input type="hidden" name="bookNumber" value = "<%=bookNumber %>">
		<input type="hidden" name="memberNumber" value="<%=memberNumber %>">
		<input type="hidden" name="addressCheck" value="<%=addressCheck %>">
		
<%
	if(shoppingCartNumber == 0){						// shoppingCartNumber가 넘어오지 않으면 view페이지에서 값 받기
%>
		<input type="hidden" name="amount" value="<%=ordersAmount%>">
		<input type="hidden" name="price" value="<%=price%>">
<%
	}else{
%>
		<input type="hidden" name="shoppingCartAmount" value="<%=ordersAmount%>">
		<input type="hidden" name="shoppingCartPrice" value="<%=price%>">
		<input type="hidden" name="shoppingCartNumber" value="<%=shoppingCartNumber %>">
<%
	}
%>		
		
		<table>
			<tr>
				<th>보유 포인트</th>
				<td><%=memberPoint %></td>
			</tr>
			<tr>
				<th>사용 포인트</th>
				<td><input type="text" name="usePoint" value="<%=usePoint%>"> <button type="submit">적용</button></td>
			</tr>
		</table>
	</form>
		<table>
			<tr>
				<th>금액</th>
				<td><%=buyPrice %></td>
			</tr>
			<tr>
				<th>할인(포인트사용)</th>
				<td><%=usePoint %></td>
			</tr>
			<tr>
				<th>총 금액</th>
				<td><%= ordersPrice %></td>
			</tr>
		</table>
		<div>
			책 구매시 적립포인트 : <%=buyPrice*5/100 %>원 적립 <br>
			책 리뷰작성시 적립포인트 : <%=buyPrice*1/100 %>원 적립
		</div>
	</body>
</html>