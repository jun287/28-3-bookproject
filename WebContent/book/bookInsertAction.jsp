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
		String book_name = request.getParameter("book_name");
		String book_author = request.getParameter("book_author");
		int book_price = Integer.parseInt(request.getParameter("book_price"));
		int book_point = Integer.parseInt(request.getParameter("book_point"));
		int book_amount = Integer.parseInt(request.getParameter("book_amount"));
		
		
		Book book=new Book();
		book.setBook_name(book_name);
		book.setBook_author(book_author);
		book.setBook_price(book_price);
		book.setBook_point(book_point);
		book.setBook_amount(book_amount);
	
		
		BookDao BookDao = new BookDao();
		BookDao.insertBook(book);
	%>
</body>
</html>