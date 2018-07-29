<!-- 2018. 07. 25 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.Publisher"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.bookshop.project.ServicePublisher"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>publisher list</title>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/publisher/publisherInsertForm.jsp" method="post">
		<h1>출판사 리스트</h1>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>출판사이름</th>
				<th>출판사홈페이지</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<%
			request.setCharacterEncoding("euc-kr");
			String searchWord = "";
			if(request.getParameter("searchWord") != null){
				searchWord = request.getParameter("searchWord");
		}
			
			int currentPage = 1;	
			int pagePerRow = 3;		
					
			if(request.getParameter("currentPage") !=null ){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int startRow = (currentPage - 1) * pagePerRow;	
					
			ServicePublisher servicePublisher  = new ServicePublisher();		
			ArrayList<Publisher> list = servicePublisher.selectByPagePublisher(currentPage, pagePerRow);
			
				
				for(int i=0;i<list.size();i++){
				Publisher publisher=list.get(i);
			%>
				<tr>
					<td><%=publisher.getPublisherNo() %></td>
					<td><%=publisher.getPublisherName() %></td>
					<td><%=publisher.getPublisherWebsite() %></td>
					<td><a href="<%=request.getContextPath()%>/publisher/publisherUpdateForm.jsp?publisherNO=<%=publisher.getPublisherNo() %>">수정</a></td>
					<td><a href="<%=request.getContextPath()%>/publisher/publisherDelete.jsp?publisherNo=<%=publisher.getPublisherNo() %>">삭제</a></td>
				</tr>
			<%
				}
			%>
		</table>
			
			
			<%
			int totalRow = servicePublisher.selectCount();
			int lastPage = 0;	
			
			if(totalRow % pagePerRow == 0){		
				lastPage = totalRow / pagePerRow ;		
			       
			}else{
				lastPage = totalRow / pagePerRow + 1 ;	
			      
			}
						
			if(currentPage > 1){
		%>
				<a href="<%=request.getContextPath() %>/publisher/publisherList.jsp?currentPage=<%=currentPage-1 %>">이전</a>
		<%
			}
			if(currentPage < lastPage){
		%>
				<a href="<%=request.getContextPath() %>/publisher/publisherList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		<%
			}
		%>	
			
			
			<br><br>
			<input type="submit" value="입력">&nbsp;&nbsp;
			<button type="button" onclick="location.href='<%= request.getContextPath() %>/publisher/publisherList.jsp'">목록</button>&nbsp;&nbsp;
			<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
	</body>
</html>