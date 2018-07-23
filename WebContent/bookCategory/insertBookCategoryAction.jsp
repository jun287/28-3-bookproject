<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@page import="dto.bookshop.project.BookCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insertBookCategoryAction.jsp</title>
	</head>
	<body>
		<%
			//bookCode(dto)객체 생성후  name에 값 셋팅 
			BookCode bookCode=new BookCode();
			bookCode.setBookCodeName(request.getParameter("category"));
			
			//BookCategoryDao(Dao)객체 생성후 insertBookCategory메서드에 셋팅되어 있는 name을 겟팅하여 return값을 매개변수에 대입한다.
			BookCategoryDao bookCategroyDao=new BookCategoryDao();
			bookCategroyDao.insertBookCategory(bookCode.getBookCodeName());
			
			
			//bookManagement.jsp로 페이지 이동한다.
			response.sendRedirect(request.getContextPath()+"/bookCategory/bookCategoryManagement.jsp");
		%>
	</body>
</html>