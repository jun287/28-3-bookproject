<!-- 18.7.18 최지수 : bookOrdersForm.jsp -->
<!-- 상품 주문하는 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%
	/* if(session.getAttribute("sessionId")==null){		// 로그인이 되어있는지 확인하여 로그인이 안되어있으면 로그인페이지로 이동
		response.sendRedirect(request.getContextPath() + "/member/memberLoginForm.jsp" );
	}
	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));		// book_no를 받아오는 코드
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));	// member_no를 받아오는 코드
	int ordersAmount = Integer.parseInt(request.getParameter("amount"));				// 수량을 받아오는 코드 */
	
	int price = 50000;															// 상품금액(임시)
	int memberPoint = 20000;													// 회원의 포인트를 받아오는 변수
	int usePoint = 0;															// 포인트 사용금액을 받아오는 변수
	if(request.getParameter("usePoint")!=null){									// 포인트 사용금액이 있을 경우
		if(Integer.parseInt(request.getParameter("usePoint"))<=memberPoint){	// 입력한 값이 총 포인트의 값보다 낮거나 같을 경우에만
			usePoint = Integer.parseInt(request.getParameter("usePoint"));		// usePoint 변수에 받아온 값 입력
		}
	}
	int addressCheck = 0;														// 기존주소인지, 새로운 주소인지 선택확인위한 변수 선언
	 if(request.getParameter("addressCheck")!=null){							// addressCheck를 받아오는 값이 있을때
		 addressCheck = Integer.parseInt(request.getParameter("addressCheck"));	// 새로운 주소를 선택한 값을 addressCheck변수에 대입
	 }
	String recentAddress = null;												// 최근배송지 받아오는 변수
	int ordersPrice = price-usePoint;											// 포인트 적용 후 최종 결제금액
%>	
	<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersAction.jsp" method="post">
		<input type="hidden" name="ordersPrice" value="<%=ordersPrice%>">
		<%-- <input type="hidden" name="bookNumber" value="<%=bookNumber%>">
		<input type="hidden" name="orderAmount" value="<%=orderAmount%>"> --%>
		<input type="hidden" name="bookNumber" value="<%=1%>">
		<input type="hidden" name="orderAmount" value="<%=3%>">
		<input type="hidden" name="memberNumber" value="<%=1%>">
		<table>
			<tr>
				<th>주문자이름</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th>배송주소</th>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp">기존주소</a></td>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=1&usePoint=<%=usePoint%>">새로운주소</a></td>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=2&usePoint=<%=usePoint%>">최근배송지</a></td>
			</tr>
			<tr>
<%
			if(addressCheck==0){				// 기존주소를 선택했을때
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress" value="기존주소표시영역" readonly="readonly"></td>
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
				<td>상품명 받아온값 입력</td>
			</tr>
			<tr>
				<th>수량</th>
				<td>수량 받아온값 입력</td>
			</tr>
		</table>
		<button>주문하기</button>
	</form>
	<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp" method="post">
		<input type="hidden" name="addressCheck" value="<%=addressCheck %>">
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
				<td><%=price %></td>
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
			책 구매시 적립포인트 : <%=price*5/100 %>원 적립 <br>
			책 리뷰작성시 적립포인트 : <%=price*1/100 %>원 적립
		</div>
	</body>
</html>