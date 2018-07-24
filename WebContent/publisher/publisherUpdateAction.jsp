<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.PublisherDao" %>
<%@ page import="dto.bookshop.project.Publisher" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			Publisher publisher = new Publisher();
			int publisherNO=Integer.parseInt(request.getParameter("publisherNo"));
			String publisherName=request.getParameter("publisherName");
			String publisherSite=request.getParameter("publisherSite");
			
			
			publisher.setPublisherNo(publisherNO);
			publisher.setPublisherName(publisherName);
			publisher.setPublisherWebsite(publisherSite);
			
			PublisherDao publisherDao = new PublisherDao();
			publisherDao.updatePublisher(publisher.getPublisherNo(), publisher.getPublisherName(),publisher.getPublisherWebsite());
			response.sendRedirect(request.getContextPath()+"/publisher/publisherList.jsp");
		%>
	</body>
</html>