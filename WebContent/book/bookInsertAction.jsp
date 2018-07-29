<!-- 2018. 07. 25 이경선  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="dao.bookshop.project.BookDao"%>
<%@page import="dto.bookshop.project.Book"%>

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
			String bookDate=request.getParameter("bookDate");
			
			System.out.println(bookDate+"<--bookDate");
			
			Book book=new Book();
			book.setBookName(bookName);
			book.setBookAuthor(bookAuthor);
			book.setBookPrice(bookPrice);
			book.setBookPoint(bookPoint);
			book.setBookAmount(bookAmount);
			book.setBookCodeNo(category);
			book.setPublisherNo(publisher);
			book.setBookDate(bookDate);
			
			System.out.println(book.getBookName()+"<--bookName");
			System.out.println(book.getBookAuthor()+"<--bookAuthor");
			System.out.println(book.getPublisherNo()+"<--publisher");
			System.out.println(book.getBookCodeNo()+"<--category");
			System.out.println("---------------------------------");
			
			BookDao BookDao = new BookDao();
			BookDao.insertBook(book);  
			
			response.sendRedirect(request.getContextPath()+"/book/bookList.jsp");
			
		%>
	</body>
</html>