<%@page import="dto.bookshop.project.BookCode"%>
<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			//BookCode(dto)객체를 생성하여 no값을 셋팅해준다
			BookCode bookCode=new BookCode();
			bookCode.setBookCodeNo(Integer.parseInt(request.getParameter("categoryNO")));
			
			//BookCategoryDao(dao)객체를 생성후 deleteBookCategory메서드에 겟팅하여 no의 값을 가져와 대입후 호출해준다.
			BookCategoryDao bookCategoryDao=new BookCategoryDao();
			bookCategoryDao.deleteBookCategory(bookCode.getBookCodeNo());
			
			//bookManagement.jsp 페이지로 이동한다.
			response.sendRedirect(request.getContextPath()+"/bookCategory/bookCategoryManagement.jsp");
		%>
	</body>
</html>