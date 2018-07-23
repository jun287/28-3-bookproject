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
				//BookCategoryDao(dao) 객체 생성 하여 selectBookCategory메서드를 호출하여 ArrayList<BookCode>로 선언되었는 result에 return값을 대입한다.
				BookCategoryDao bookCategoryDao=new BookCategoryDao();
				ArrayList<BookCode> result=bookCategoryDao.selectBookCategory();
			
				//for문을 이용하여 index크기만큼 result에 담겨있는 주소값을 찾아가서 BookCode_name에 담겨있는 값을 출력한다.
				for(int i=0;i<result.size();i++){
					BookCode bookCode=result.get(i);
					
			%>
				<div id="list">▶<%=bookCode.getBookcode_name() %></div>
			<%
				}
			%>
		<br>
		</div>
		
		<!-- 버튼을 클릭하면 추가,수정,삭제가 있는 관리 페이지로 이동한다  -->
		<div id="button">
			<a href="<%=request.getContextPath()%>/book/bookManagement.jsp"><button>관리</button></a>
		</div>
	</body>
</html>