<%@page import="dto.bookshop.project.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.bookshop.project.PublisherDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>출판사이름</th>
				<th>출판사홈페이지</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				PublisherDao publisherDao=new PublisherDao();
				ArrayList<Publisher> result=publisherDao.selectPublisher();
				
				for(int i=0;i<result.size();i++){
				Publisher publisher=result.get(i);
			%>
				<tr>
					<td><%=publisher.getPublischerNo() %></td>
					<td><%=publisher.getPublischerName() %></td>
					<td><%=publisher.getPublischerWebsite() %></td>
					<td><a href="#">수정</a></td>
					<td><a href="#">삭제</a></td>
				</tr>
			<%
				}
			%>
		</table>
	</body>
</html>