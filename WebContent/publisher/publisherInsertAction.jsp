<%@page import="dao.bookshop.project.PublisherDao"%>
<%@page import="dto.bookshop.project.Publisher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%			
			Publisher publisher=new Publisher();
			publisher.setPublischerName(request.getParameter("publisherName"));
			publisher.setPublischerWebsite(request.getParameter("publisherSite"));
			
			PublisherDao publisherDao=new PublisherDao();
			publisherDao.insertPublisher(publisher.getPublischerName(),publisher.getPublischerWebsite());
			
			
		%>
	</body>
</html>