<%@page import="dao.bookshop.project.BookDao"%>
<%@page import="dto.bookshop.project.Book"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String bookName = request.getParameter("book_name");
		String bookAuthor = request.getParameter("book_author");
		String publisher = request.getParameter("publisher");
		String category = request.getParameter("category");
		
		int bookPrice = Integer.parseInt(request.getParameter("book_price"));
		int bookPoint = Integer.parseInt(request.getParameter("book_point"));
		int bookAmount = Integer.parseInt(request.getParameter("book_amount"));
		
		
		Book book=new Book();
		book.setBookName(bookName);
		book.setBookAuthor(bookAuthor);
		book.setBookPrice(bookPrice);
		book.setBookPoint(bookPoint);
		book.setBookAmount(bookAmount);
	
		
		BookDao BookDao = new BookDao();
		BookDao.insertBook(book);
	%>
</body>
</html>