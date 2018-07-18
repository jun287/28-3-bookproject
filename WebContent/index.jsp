<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Index</title>
	</head>
	<body>
		<div align ="center">
			<h1>Book Shop</h1>
				<a href="<%= request.getContextPath() %>/member/memberJoinForm.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/member/memberLoginForm.jsp">로그인</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/book/bookList.jsp">도서 목록</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/bookCart/bookCartList.jsp">카트</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/bookOrders/bookOrdersList.jsp">도서 구매</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/boardQnA/boardList.jsp">Q&A</a>
		</div>
	</body>
</html>