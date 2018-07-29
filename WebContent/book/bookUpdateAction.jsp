
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.bookshop.project.BookDao"%>
<%@ page import="dto.bookshop.project.Book"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookUpdateAction</title>
	</head>
	<body>
		<%
			Book book=new Book();
			book.setBookNo(Integer.parseInt(request.getParameter("bookNumber")));
			book.setBookName(request.getParameter("bookName"));
			book.setBookAuthor(request.getParameter("bookAuthor"));
			book.setBookPrice(Integer.parseInt(request.getParameter("bookPrice")));
			book.setBookPoint(Integer.parseInt(request.getParameter("bookPoint")));
			book.setBookAmount(Integer.parseInt(request.getParameter("bookAmount")));
			book.setBookDate(request.getParameter("bookDate"));
			book.setPublisherNo(Integer.parseInt(request.getParameter("publisher")));
			book.setBookCodeNo(Integer.parseInt(request.getParameter("category")));
			
			
			BookDao bookDao=new BookDao();
			bookDao.updateBook(book);
	
			//bookView.jsp파일로 페이지 이동
			response.sendRedirect(request.getContextPath()+"/book/bookView.jsp?bookNumber="+book.getBookNo());
		%>
	</body>
</html>