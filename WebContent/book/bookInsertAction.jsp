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
		
		String bookName = request.getParameter("bookName");
		String bookAuthor = request.getParameter("bookAuthor");
		int publisher = Integer.parseInt(request.getParameter("publisher"));
		int category = Integer.parseInt(request.getParameter("category"));
		int bookPrice = Integer.parseInt(request.getParameter("bookPrice"));
		int bookPoint = Integer.parseInt(request.getParameter("bookPoint"));
		int bookAmount = Integer.parseInt(request.getParameter("bookAmount"));
		
		System.out.println(bookName+"<--bookName");
		System.out.println(bookAuthor+"<--bookAuthor");
		System.out.println(publisher+"<--publisher");
		System.out.println(category+"<--category");
		System.out.println(bookPrice+"<--bookPrice");
		System.out.println(bookPoint+"<--bookPoint");
		System.out.println(bookAmount+"<--bookAmount");
		
		
		Book book=new Book();
		book.setBookName(bookName);
		book.setBookAuthor(bookAuthor);
		book.setBookPrice(bookPrice);
		book.setBookPoint(bookPoint);
		book.setBookAmount(bookAmount);
		book.setBookCodeNo(publisher);
		book.setPublisherNo(category);
		
		System.out.println(book.getBookName()+"<--bookName");
		System.out.println(book.getBookAuthor()+"<--bookAuthor");
		System.out.println(book.getPublisherNo()+"<--publisher");
		System.out.println(book.getBookCodeNo()+"<--category");
		
		 
		BookDao BookDao = new BookDao();
		BookDao.insertBook(book);  
	%>
</body>
</html>