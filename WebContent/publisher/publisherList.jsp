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
		<table>
			<%
				PublisherDao publisherDao=new PublisherDao();
				ArrayList<Publisher> result=publisherDao.selectPublisher();
				
				for(int i=0;i<result.size();i++){
				Publisher publisher=result.get(i);
			%>
					
			<%
				}
			%>
		</table>
	</body>
</html>