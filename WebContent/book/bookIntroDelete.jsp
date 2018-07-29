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
			
			System.out.println(bookNumber+"<--bookNumber");
			System.out.println(bookIntroNo+"<--bookIntroNo");
			
			BookDao bookDao=new BookDao();
			bookDao.deletebookIntro(bookIntroNo);
			
			response.sendRedirect(request.getContextPath()+"/book/bookView.jsp?bookNumber="+bookNumber);

		%>
	</body>
</html>