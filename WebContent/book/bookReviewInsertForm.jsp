<!-- 2018. 07. 25. 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookReivewInsertForm</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			int bookNo = 1;
			if(request.getParameter("bookNo") != null){
				bookNo = Integer.parseInt(request.getParameter("bookNo"));
			}
			
		%>
		<div align="center">
			<h1>Book Review</h1>
			<form method="post" action="<%= request.getContextPath() %>/book/bookReviewInsertAction.jsp">
				<input type="hidden" name="bookNo" value="<%=bookNo%>">
				<textarea name="bookReviewContent" placeholder="서평(Book Review)을 작성해주세요." cols="100" rows="10" required></textarea><br><br>
				<input type="submit" value="작성">&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/book/bookList.jsp'">목록</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
	</body>
</html>