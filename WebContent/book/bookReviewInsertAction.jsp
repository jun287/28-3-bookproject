<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.Bookreview" %>
<%@ page import = "service.bookshop.project.ServiceBook" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookReviewInsertAction</title>
	</head>
	<body>
		<%
			
			request.setCharacterEncoding("UTF-8");
		
			int bookNo = Integer.parseInt(request.getParameter("bookNo"));	
			
			int sessionNo = 1;
			if(session.getAttribute("sessionNo") != null){
				sessionNo = (int)session.getAttribute("sessionNo");
			}
			
			String bookReviewContent = request.getParameter("bookReviewContent");
			bookReviewContent = bookReviewContent.replace("\r\n","<br>");
			
			
			Bookreview bookReview = new Bookreview();
			bookReview.setBookNo(bookNo);
			bookReview.setMemberNo(sessionNo);
			bookReview.setBookReviewContent(bookReviewContent);
			
			ServiceBook serviceBook = new ServiceBook();
			serviceBook.insertBookReview(bookReview);
			
			response.sendRedirect(request.getContextPath()+"/book/bookList.jsp");
		%>
	</body>
</html>