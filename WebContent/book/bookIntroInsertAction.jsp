<!-- 2018. 07. 25 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.bookshop.project.BookDao"%>
<%@ page import="dto.bookshop.project.BookIntro"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookIntroInsertAction</title>
	</head>
	<body>
		<%
			int bookNumber=Integer.parseInt(request.getParameter("bookNumber"));
			String write=request.getParameter("write");
			String content=request.getParameter("content").replace("\r\n","<br>");
			System.out.println(write+"<--write");
			System.out.println(content+"<--content");
			System.out.println(bookNumber+"<--bookNumber");
			
			BookIntro bookIntro=new BookIntro();
			
			bookIntro.setBookIntroWrite(write); 
			bookIntro.setBookIntroContent(content);
			bookIntro.setBookNo(bookNumber);
			
			BookDao bookDao=new BookDao();
			bookDao.insertBookIntro(bookIntro);
			
			response.sendRedirect(request.getContextPath()+"/book/bookView.jsp?bookNumber="+bookNumber);
		%>
	</body>
</html>