<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.PublisherDao"%>
<%@ page import="dao.bookshop.project.BookCategoryDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.bookshop.project.Publisher"%>
<%@ page import="dao.bookshop.project.BookCategoryDao" %>
<%@ page import="dto.bookshop.project.BookCode" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookInsertForm</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		PublisherDao publisherDao = new PublisherDao();
		ArrayList<Publisher> list = publisherDao.selectPublisher();
		BookCategoryDao bookCategoryDao = new BookCategoryDao();
		ArrayList<BookCode> list2 = bookCategoryDao.selectBookCategory();
	%>


	<form action="<%=request.getContextPath()%>/book/bookInsertAction.jsp"
		method="post">
		<table>
			<tr>
				<td>책이름</td>
				<td><input type="text" name="bookName" required></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="bookAuthor" required></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="bookPrice" required></td>
			</tr>
			<tr>
				<td>포인트</td>
				<td><input type="text" name="bookPoint" required></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="bookAmount" required></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><select name="publisher">
				<%
					for(int i=0; i<list.size(); i++){
						Publisher publisher = list.get(i);
				
				%>
						<option value="<%=publisher.getPublisherNo() %>"><%=publisher.getPublisherName() %></option>
						
				<%
					}
				%>
				</select></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><select name="category">
				<%
					for(int j=0; j<list2.size(); j++){
						BookCode bookCode = list2.get(j);
					
				%>		
						<option value="<%=bookCode.getBookCodeNo()%>"><%=bookCode.getBookCodeName() %></option>
						
				<%
					}
				%>		
				</select></td>
		</table>
	
		<input type="submit" value="등록">
	</form>
</body>
</html>