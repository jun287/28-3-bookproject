<!-- 2018. 07. 25 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BookCode"%>
<%@ page import="dao.bookshop.project.BookCategoryDao"%>

<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>bookCategoryUpdateAction</title>
	</head>
	<body>
		<%
			//BookCode(dto)객체를 생성후 넘어온no,name 파라미터값을 가지고 셋팅한다. 
			BookCode bookCode=new BookCode();
			bookCode.setBookCodeNo(Integer.parseInt(request.getParameter("categoryNo")));
			bookCode.setBookCodeName(request.getParameter("categoryName"));
			
			//BookCategoryDao(dao)객체를 생성한후 updateBookCategory메서드에 no,name값을 대입한후 호출한다.
			BookCategoryDao bookCategoryDao=new BookCategoryDao();
			bookCategoryDao.updateBookCategory(bookCode.getBookCodeNo(), bookCode.getBookCodeName());
	
			//bookManagement.jsp파일로 페이지 이동
			response.sendRedirect(request.getContextPath()+"/bookCategory/bookCategoryManagement.jsp");
		%>
	</body>
</html>