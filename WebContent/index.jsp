<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Index</title>
	</head>
	<body>
		<div align ="center">
			<h1>Book Shop</h1>
				<a href="<%= request.getContextPath() %>/member/memberJoinForm.jsp">ȸ������</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/member/memberLoginForm.jsp">�α���</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/book/bookList.jsp">���� ���</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/bookCart/bookCartList.jsp">īƮ</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="<%= request.getContextPath() %>/bookOrders/bookOrdersList.jsp">���� ����</a>&nbsp;&nbsp;&nbsp;
		</div>
	</body>
</html>