<!-- 2018. 07. 22 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BoardQnAandMember" %>
<%@ page import="service.bookshop.project.ServiceBoardQnA" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardList</title>
	</head>
	<body>
		<%
			/*
				질문게시판에 게시글 목록을 가져와서 화면에 출력합니다.
				
				ServiceBoardQnA 클래스 객체생성후 
				selectBoardQnaList 메서드를 호출하여
				게시글들의 목록이 담긴 객체의 참조값을 ArrayList<BoardQnAandMember> 클래스타입으로
				arrayList 객체참조변수에 대입하고
				참조값을 찾아가서 객체의 배열 index수 많큼 반복하면서
				게시글의 정보를 가져와서 화면에 출력합니다.
			*/
	
		
			request.setCharacterEncoding("UTF-8");
			String sessionId = (String)session.getAttribute("sessionId");
			
			request.setCharacterEncoding("EUC-KR");
			//페이징을 위해 첫 페이지의 값을 1로 지정합니다.
			int currentPage = 1;
			if(request.getParameter("currentPage")!=null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			int rowPerPage = 5;
		
			ServiceBoardQnA serviceBoardQna = new ServiceBoardQnA();
			ArrayList<BoardQnAandMember> arrayList = serviceBoardQna.selectBoardQnaList(currentPage, rowPerPage);
			
		%>
		
		<div align="center">
			<h1>질문 게시판</h1>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardList.jsp">
				질문내용 : <input type="text" name="searchWord">
				<input type="submit" value="검색">
			</form><br>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardWriteForm.jsp">
				<table border="1" width="50%">
					<thead>
						<tr>
							<th>번호</th>
							<th>질문내용</th>
							<th>작성자</th>
							<th>작성날짜</th>
						</tr>
					</thead>
					<tbody align="center">
					<%
						for(int i=0;i<arrayList.size();i++){
							BoardQnAandMember boardQnAandMember = new BoardQnAandMember();
							boardQnAandMember = arrayList.get(i);
					%>
						<tr>
							<td><%= boardQnAandMember.getBoardQna().getBoardQnaNo() %></td>
							<td><a href="<%= request.getContextPath() %>/boardQnA/boardView.jsp?bqNo=<%=boardQnAandMember.getBoardQna().getBoardQnaNo()%>&mNo=<%=boardQnAandMember.getMember().getMemberNum()%>"><%= boardQnAandMember.getBoardQna().getBoardQnaTitle() %></a></td>
							<td><%= boardQnAandMember.getMember().getMemberId() %></td>
							<td><%= boardQnAandMember.getBoardQna().getBoardQnaDate() %></td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table><br>
				
				<%
					int lastPage = serviceBoardQna.lastPageBoardQnA(rowPerPage);
						
					
						// 페이징 함으로서 검색키워드와 나이차순정렬 키워드를 get 방식으로 값을 넘겨줍니다.
					if(currentPage>1){
						%>
						<a href = "./boardList.jsp?currentPage=<%=currentPage-1%>">◀ 이전</a>
						<%
					}
		
					if(currentPage<lastPage){
						%>
						<a href = "./boardList.jsp?currentPage=<%=currentPage+1%>">다음 ▶</a>
						<%
					}
					
					if(sessionId != null){
						%>
						<br><br>
						<input type="submit" value="글쓰기">&nbsp;&nbsp;
						<%
					}
				%>
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">목록</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
	</body>
</html>