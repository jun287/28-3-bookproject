<!-- 2018. 07. 25 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BookReview"%>
<%@ page import="dao.bookshop.project.BookReviewDao"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookReviewUpdateForm</title>
	</head>
	<body>
		<%
			int bookReviewNo=Integer.parseInt(request.getParameter("bookReviewNo"));
			System.out.println(bookReviewNo+"<--bookReviewNo");
			BookReviewDao bookReviewDao=new BookReviewDao();
			BookReview bookReview=bookReviewDao.updateBookReviewForm(bookReviewNo);
			bookReview.getBookNo();
			bookReview.getBookReviewNo();
			bookReview.getBookReviewContent();
			bookReview.getMemberNo();
			System.out.println(bookReview.getBookNo()+"<--bookReview.getBookNo()");
			System.out.println(bookReview.getBookReviewNo()+"<--bookReview.getBookReviewNo()");
			System.out.println(bookReview.getBookReviewContent()+"<--bookReview.getBookReviewContent()");
			System.out.println(bookReview.getMemberNo()+"<--bookReview.getMemberNo()");
		%>
		<form method="post" action="<%= request.getContextPath() %>/book/bookReviewUpdateAction.jsp">
				<input type="hidden" name="bookReviewNo" value="<%=bookReviewNo%>">
				<textarea name="bookReviewContent" placeholder="서평(Book Review)을 작성해주세요."  style="width:800px;height:100px;resize: none;" required><%=bookReview.getBookReviewContent()%></textarea><br><br>
				<input type="submit" value="작성">&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/book/bookList.jsp">목록</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
		</form>
	</body>
</html>