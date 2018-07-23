<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@page import="dto.bookshop.project.BookCode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insertBookCategoryForm.jsp</title>
	</head>
	<body>
		<%
			//BookCode(dto)객체를 생성하여 넘어온 파라미터값을 정수로 바꾸어주고 셋팅메서드로 bookcode_no에셋팅한다
			BookCode bookCode=new BookCode();
			bookCode.setBookcode_no(Integer.parseInt(request.getParameter("categoryNO")));
			
			//BookCategoryDao(dao)객체를 생성하여 selectBookCategorytupdateFrom에 bookcode_no값을 대입하여 호출하여 return값을 BookCode클래스형 데이터 타입으로 선언되result에 대입한다.
			BookCategoryDao bookCategoryDao=new BookCategoryDao();
			BookCode result=bookCategoryDao.selectBookCategorytupdateFrom(bookCode.getBookcode_no());
			
			
		%>
		<!--카테고리를 수정시킬 폼을 만든다.그리고 그안에 원래 가지고 있었던 값을 출력한다.  -->
		<form action="<%=request.getContextPath()%>/book/bookCategoryUpdateAction.jsp?categoryNo=<%=result.getBookcode_no()%>" method="post">
			<input type="text" name="categoryName" placeholder="카테고리추가" max="1" min="5" value="<%=result.getBookcode_name()%>">
			<input type="submit" value="확인">
		</form>
	</body>
</html>