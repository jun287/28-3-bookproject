<%@page import="dto.bookshop.project.BookIntro"%>
<%@page import="dao.bookshop.project.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int bookNumber=Integer.parseInt(request.getParameter("bookNumber"));
			int bookIntroNo=Integer.parseInt(request.getParameter("bookIntroNo"));
			String write=request.getParameter("write");
			String content=request.getParameter("content");
			
			System.out.println(bookNumber+"<--bookNumber");
			System.out.println(bookIntroNo+"<--bookIntroNo");
			
			BookIntro bookIntro=new BookIntro();
			
			bookIntro.setBookNo(bookNumber);
			bookIntro.setBookIntroNo(bookIntroNo);
			bookIntro.setBookIntroContent(content);
			bookIntro.setBookIntroWrite(write);
			
			System.out.println(bookIntro.getBookIntroNo()+"<--bookIntro.getBookIntroNo()");
			System.out.println(bookIntro.getBookNo()+"<--bookIntro.getBookNo()");
			System.out.println(bookIntro.getBookIntroWrite()+"<--bookIntro.getBookIntroWrite()");
			System.out.println(bookIntro.getBookIntroContent()+"<--bookIntro.getBookIntroContent()");
			
			BookDao bookDao=new BookDao();
			bookDao.updateIntro(bookIntro);
			
			response.sendRedirect(request.getContextPath()+"/book/bookView.jsp?bookNumber="+bookNumber);
		%>
	</body>
</html>