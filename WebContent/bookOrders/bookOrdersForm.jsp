<!-- 18.7.18 최지수 : bookOrdersForm.jsp -->
<!-- 상품 주문하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
<%
	/* if(session.getAttribute("sessionId")==null){		// 로그인이 되어있는지 확인하여 로그인이 안되어있으면 로그인페이지로 이동
		response.sendRedirect(request.getContextPath() + "/member/memberLoginForm.jsp" );
	}
	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));		// book_no를 받아오는 코드
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));	// member_no를 받아오는 코드
	int amount = Integer.parseInt(request.getParameter("amount"));				// 수량을 받아오는 코드
	 */
	int addressCheck = 0;														// 기존주소인지, 새로운 주소인지 선택확인위한 변수 선언
	 if(request.getParameter("addressCheck")!=null){							// addressCheck를 받아오는 값이 있을때
		 addressCheck = Integer.parseInt(request.getParameter("addressCheck"));	// 새로운 주소를 선택한 값을 addressCheck변수에 대입
	 }
	
%>	
	<form>
		<table>
			<tr>
				<th>주문자이름</th>
				<td>홍길동</td>
			</tr>
			<tr>
				<th>배송주소</th>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp">기존주소</a></td>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=1">새로운주소</a></td>
			</tr>
			<tr>
<%
			if(addressCheck==0){				// 기존주소를 선택했을때
%>
				<td colspan="3" align="center">기존주소표시영역</td>
<%
			}else{								// 새로운주소를 선택했을때
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress"></td>
<%
			}
%>
				</tr>
		</table>
	</form>
	</body>
</html>