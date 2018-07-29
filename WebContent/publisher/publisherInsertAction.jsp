<!-- 2018. 07. 25 이경선  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="service.bookshop.project.ServicePublisher"%>
<%@ page import="dto.bookshop.project.Publisher"%>
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>publisherInsertAction</title>
	</head>
	<body>
		<%			
			Publisher publisher=new Publisher();
			publisher.setPublisherName(request.getParameter("publisherName"));
			publisher.setPublisherWebsite(request.getParameter("publisherSite"));
			
			ServicePublisher servicePublisher=new ServicePublisher();
			servicePublisher.insertPublisher(publisher.getPublisherName(),publisher.getPublisherWebsite());
			
			response.sendRedirect(request.getContextPath()+"/publisher/publisherList.jsp");
		%>
	</body>
</html>