<%@page import="dto.bookshop.project.BookCode"%>
<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			//BookCode(dto)��ü�� ������ �Ѿ��no,name �Ķ���Ͱ��� ������ �����Ѵ�. 
			BookCode bookCode=new BookCode();
			bookCode.setBookCodeNo(Integer.parseInt(request.getParameter("categoryNo")));
			bookCode.setBookCodeName(request.getParameter("categoryName"));
			
			//BookCategoryDao(dao)��ü�� �������� updateBookCategory�޼��忡 no,name���� �������� ȣ���Ѵ�.
			BookCategoryDao bookCategoryDao=new BookCategoryDao();
			bookCategoryDao.updateBookCategory(bookCode.getBookCodeNo(), bookCode.getBookCodeName());
	
			//bookManagement.jsp���Ϸ� ������ �̵�
			response.sendRedirect(request.getContextPath()+"/bookCategory/bookCategoryManagement.jsp");
		%>
	</body>
</html>