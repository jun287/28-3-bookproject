<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@page import="dto.bookshop.project.BookCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insertBookCategoryAction.jsp</title>
	</head>
	<body>
		<%
			BookCode bookCode=new BookCode();
			bookCode.setBookcode_name(request.getParameter("category"));
			
			BookCategoryDao bookCategroyDao=new BookCategoryDao();
			bookCategroyDao.insertBookCategory(bookCode.getBookcode_name());
			
			response.sendRedirect(request.getContextPath()+"/book/bookManagement.jsp");
		%>
	</body>
</html>