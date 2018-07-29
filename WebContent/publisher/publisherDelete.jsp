<!-- 2018. 07. 25 이경선  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.Publisher" %>
<%@ page import="service.bookshop.project.ServicePublisher" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>publisherDelete</title>
	</head>
	<body>
		<% 
			int publisherNo=Integer.parseInt(request.getParameter("publisherNo"));
			Publisher publisher = new Publisher();
			publisher.setPublisherNo(publisherNo);
			
			ServicePublisher servicePublisher = new ServicePublisher();
			servicePublisher.deletePublisher(publisher.getPublisherNo());
			
			response.sendRedirect(request.getContextPath()+"/publisher/publisherList.jsp");
		%>
	</body>
</html>