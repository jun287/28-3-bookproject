<!-- 2018. 07. 25 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="service.bookshop.project.ServicePublisher" %>
<%@ page import="dto.bookshop.project.Publisher" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>publisherUpdateForm</title>
	</head>
	<body>
		<%
			/* 		int publisherNO=;
			System.out.println(publisherNO+"<--publisherNO"); */
			Publisher publisher = new Publisher();
			publisher.setPublisherNo(Integer.parseInt(request.getParameter("publisherNO")));
			
			ServicePublisher servicePublisher = new ServicePublisher();
			Publisher result=servicePublisher.selectPublisherNo(publisher.getPublisherNo());
		%>
			<div align="center">
				<h1>출판사 수정</h1>
				<form action="<%=request.getContextPath()%>/publisher/publisherUpdateAction.jsp?publisherNo=<%=result.getPublisherNo()%>" method="post">
					<label>출판사이름</label>
					<input type="text" name="publisherName" value="<%=result.getPublisherName()%>" required><br>
					<label>출판사홈페이지</label>
					<input type="text" name="publisherSite" value="<%=result.getPublisherWebsite()%>"required><br>
					<input type="submit" value="수정">
				</form>
			</div>
	</body>
</html>