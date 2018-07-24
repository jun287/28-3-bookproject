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
		int publisherNo=Integer.parseInt(request.getParameter("publisherNo"));
		Publisher publisher = new Publisher();
		publisher.setPublisherNo(publisherNo);
		
		PublisherDao publisherDao = new PublisherDao();
		publisherDao.deletePublisher(publisher.getPublisherNo());
		
		response.sendRedirect(request.getContextPath()+"/publisher/publisherList.jsp");
		%>
	</body>
</html>