<%@page import="dto.bookshop.project.BookCode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<Style>
			 #list{
				margin-left: 20px
			} 
			a{
				text-align: center;
			}
			#wrap{
			
				width:200px;
				border:1px solid black;
				border-radius: 5px;
			}	
			h1{
				text-align: center;
			}
		</Style>
	</head>
	<body>
		<div id="wrap">
			<h1>Category</h1><br>
			<%
				BookCategoryDao bookCategoryDao=new BookCategoryDao();
				ArrayList<BookCode> result=bookCategoryDao.selectBookCategory();
			
				for(int i=0;i<result.size();i++){
					BookCode bookCode=result.get(i);
					
			%>
				<div id="list">▶<%=bookCode.getBookcode_name() %></div>
			<%
				}
			%>
		<br>
		</div>
		
		<div id="button">
			<a href="<%=request.getContextPath()%>/book/bookManagement.jsp"><button>관리</button></a>
		</div>
	</body>
</html>