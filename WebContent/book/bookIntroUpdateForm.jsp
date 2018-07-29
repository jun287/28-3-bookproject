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
			BookDao bookDao=new BookDao();
			BookIntro bookIntro=bookDao.updateIntroForm(bookNumber);
		%>
		<form action="<%=request.getContextPath()%>/book/bookIntroUpdateAction.jsp?bookNumber=<%=bookNumber %>&bookIntroNo=<%=bookIntro.getBookIntroNo() %>" method="post">
				<label>글쓴이</label>
				<input type="text"  width="1px;" name="write" value="<%=bookIntro.getBookIntroWrite() %>" required><br><br>
				<textarea name="content" style="width:800px;height:100px;resize: none;" required><%=bookIntro.getBookIntroContent() %></textarea>
				<input type="submit" value="등록">
		</form>
	</body>
</html>