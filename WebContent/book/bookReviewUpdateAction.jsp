<%@page import="dto.bookshop.project.BookReview"%>
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
			int bookReivewNo=Integer.parseInt(request.getParameter("bookReivewNo"));
			String bookReviewContent=request.getParameter("bookReviewContent");
			int bookNumber=Integer.parseInt(request.getParameter("bookNumber"));
			BookReview bookReview =new BookReview();
			bookReview.setBookReviewNo(bookReivewNo);
			bookReview.setBookReviewContent(bookReviewContent);
			
			BookReviewDao bookReviewDao=new BookReviewDao();
			bookReviewDao.updateBookReivew(bookReview);
			
			response.sendRedirect(request.getContextPath()+"/book/bookView.jsp?bookNumber="+bookNumber);
		%>
	</body>
</html>