<!-- 2018. 07. 25 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BookReview"%>
<%@ page import="dao.bookshop.project.BookReviewDao"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookReviewUpdateAction</title>
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