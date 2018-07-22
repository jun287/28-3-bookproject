<%@page import="dto.bookshop.project.BookCode"%>
<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			BookCode bookCode=new BookCode();
			bookCode.setBookcode_no(Integer.parseInt(request.getParameter("categoryNO")));
			
			BookCategoryDao bookCategoryDao=new BookCategoryDao();
			bookCategoryDao.deleteBookCategory(bookCode.getBookcode_no());
			
			response.sendRedirect(request.getContextPath()+"/book/bookManagement.jsp");
		%>
	</body>
</html>