<%@page import="dto.bookshop.project.BookCode"%>
<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			BookCode bookCode=new BookCode();
			bookCode.setBookcode_no(Integer.parseInt(request.getParameter("categoryNo")));
			bookCode.setBookcode_name(request.getParameter("categoryName"));
			
			BookCategoryDao bookCategoryDao=new BookCategoryDao();
			bookCategoryDao.updateBookCategory(bookCode.getBookcode_no(), bookCode.getBookcode_name());
	
			response.sendRedirect(request.getContextPath()+"/book/bookManagement.jsp");
		%>
	</body>
</html>