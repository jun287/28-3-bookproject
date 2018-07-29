<%@page import="dao.bookshop.project.BookReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int bookReviewNo=Integer.parseInt(request.getParameter("bookReviewNo"));
			int	bookNumber=Integer.parseInt(request.getParameter("bookNumber"));
			System.out.println(bookReviewNo+"<--bookReviewNo");
			
			String sessionId=(String)session.getAttribute("sessionId");
			System.out.println(sessionId+"<--sessionId");
			if(sessionId!=null){
			BookReviewDao bookReviewDao=new BookReviewDao();
			bookReviewDao.deleteReview(bookReviewNo,sessionId);
			}
			response.sendRedirect(request.getContextPath()+"/book/bookView.jsp?bookNumber="+bookNumber);
		%>
	</body>
</html>