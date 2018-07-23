<%@page import="dto.bookshop.project.BookCode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.bookshop.project.BookCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<Style>
			#list{
				width:150px;
				border: 1px solid black;
				text-align: center;
			}
			a{
				text-align: center;
			}
		</Style>
	</head>
	<body>
		<!--db에 저장되었는 카테고리를 출력시키고 수정,삭제할수 있게하는 폼  -->
		<table border="1">
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
				//BookCategoryDao(dao)객체생성후 selectBookCategory메서드를 호출하여 ArrayList<BookCode> 클래스 데이터 타입으로 선언된 result에 return값을 대입한다.
				BookCategoryDao bookCategoryDao=new BookCategoryDao();
				ArrayList<BookCode> result=bookCategoryDao.selectBookCategory();
				BookCode bookCode=null;
				//for을 이용하여 index의 크기만큼 반복한다.
				for(int i=0;i<result.size();i++){
					//result의 주소를 찾아가서 return값을 bookCode에 대입후 출력해준다
					bookCode=result.get(i);
					
			%>
				<tr>
					<td><%=bookCode.getBookCodeNo() %></td>
					<td><%=bookCode.getBookCodeName() %></td>
					<td><a href="<%=request.getContextPath()%>/bookCategory/bookCategoryUpdateForm.jsp?categoryNO=<%=bookCode.getBookCodeNo() %>">수정</a></td>
					<td><a href="<%=request.getContextPath()%>/bookCategory/bookCategoryDelete.jsp?categoryNO=<%=bookCode.getBookCodeNo() %>">삭제</a></td>
				</tr>
			<%
				}
			%>
		
		</table>
			<a href="<%=request.getContextPath()%>/bookCategory/insertBookCategoryForm.jsp">추가</a>
			<a href="<%=request.getContextPath()%>/bookCategory/bookCategoryView.jsp">목록으로</a>
	</body>
</html>