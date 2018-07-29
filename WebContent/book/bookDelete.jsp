<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@page import="dao.bookshop.project.BookDao"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookDelete</title>
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