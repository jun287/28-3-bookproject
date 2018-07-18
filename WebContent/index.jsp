<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Index</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String sessionId = (String)session.getAttribute("sessionId");
			String sessionName = (String)session.getAttribute("sessionName");
			int sessionNo = 0;
			if(session.getAttribute("sessionNo") != null){
				sessionNo = (int)session.getAttribute("sessionNo");
			}
			
			System.out.println(sessionId);
			System.out.println(sessionName);
			System.out.println(sessionNo);
		%>
			<div align ="center">
				<h1>Book Shop</h1>
				<%
					if(sessionId != null){
				%>
						<a href="<%= request.getContextPath() %>/member/memberInformationList.jsp">회원정보</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="<%= request.getContextPath() %>/member/memberLogout.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<%		
					}else{
				%>
						<a href="<%= request.getContextPath() %>/member/memberJoinForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="<%= request.getContextPath() %>/member/memberLoginForm.jsp">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<%
					}
				%>
					<a href="<%= request.getContextPath() %>/book/bookList.jsp">도서 목록</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="<%= request.getContextPath() %>/shoppingCart/shoppingCartList.jsp?memberNo=<%= sessionNo %>">카트</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="<%= request.getContextPath() %>/bookOrders/bookOrdersList.jsp?memberNo=<%= sessionNo %>">도서 구매</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<a href="<%= request.getContextPath() %>/boardQnA/boardList.jsp">Q&A</a>
			</div>
	</body>
</html>