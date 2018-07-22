<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@page import="dto.bookshop.project.BookCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insertBookCategoryForm.jsp</title>
	</head>
	<body>
		<%
		
			BookCode bookCode=new BookCode();
			bookCode.setBookcode_no(Integer.parseInt(request.getParameter("categoryNO")));
			
			
			BookCategoryDao bookCategoryDao=new BookCategoryDao();
			BookCode result=bookCategoryDao.selectBookCategorytupdateFrom(bookCode.getBookcode_no());
			
			
		%>
		<!--카테고리를 추가시키 폼을 만든다.  -->
		<form action="<%=request.getContextPath()%>/book/bookCategoryUpdateAction.jsp?categoryNo=<%=result.getBookcode_no()%>" method="post">
			<input type="text" name="categoryName" placeholder="카테고리추가" max="1" min="5" value="<%=result.getBookcode_name()%>">
			<input type="submit" value="확인">
		</form>
	</body>
</html>