<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.bookshop.project.Publisher" %>
<%@ page import="dao.bookshop.project.PublisherDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<% 
		Publisher publisher = new Publisher();
		publisher.setPublisherNo(Integer.parseInt(request.getParameter("publisherNo")));
		
		PublisherDao publisherDao = new PublisherDao();
		publisherDao.deletePublisher(publisher.getPublisherNo());
		
		response.sendRedirect(request.getContextPath()+"/publisher/publisherList.jsp");
		%>
	</body>
</html>