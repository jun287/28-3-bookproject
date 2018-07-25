<%@page import="dao.bookshop.project.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int bookNumber=Integer.parseInt(request.getParameter("bookNumber"));
			BookDao bookDao=new BookDao();
			bookDao.deleteBook(bookNumber);
			
			response.sendRedirect(request.getContextPath()+"/bookCategory/bookCategoryView.jsp");

		%>
	</body>
</html>