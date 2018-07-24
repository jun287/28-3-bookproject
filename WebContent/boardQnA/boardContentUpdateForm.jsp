<!-- 2018. 07. 23 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.BoardQnA" %>
<%@ page import = "service.bookshop.project.ServiceBoardQnA" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardContentUpdateForm</title>
	</head>
	<body>	
		<%
			/* 
				질문게시판에 글을 수정하는 폼입니다.
				boardView 에서 받은 게시글번호(bpNo)와
				로그인시 세션처리된 회원번호를 가지고
				데이터베이스를 조회후 일치하는 열에 내용을 수정합니다.
			
			*/
			request.setCharacterEncoding("UTF-8");
		
			String sessionId = (String)session.getAttribute("sessionId");
			String sessionName = (String)session.getAttribute("sessionName");
			
			int boardQnaNo = 0;
			if(request.getParameter("bqNo") != null){
				boardQnaNo = Integer.parseInt(request.getParameter("bqNo"));
			}
			
			int memberNo = 0;
			if(request.getParameter("mNo") != null){
				memberNo = Integer.parseInt(request.getParameter("mNo"));
			}
			
			BoardQnA boardQnA = new BoardQnA();
			boardQnA.setBoardQnaNo(boardQnaNo);
			boardQnA.setMemberNo(memberNo);
			
			ServiceBoardQnA serviceBoardQnA = new ServiceBoardQnA();
			boardQnA = serviceBoardQnA.selectBoardQnA(boardQnA);
				
		%>
		<div align="center">
			<h1>질문 수정</h1>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardContentUpdateAction.jsp">
				<input type="hidden" name="boardQnaNo" value="<%=boardQnaNo%>">
				작성자 : <%= sessionId %>(<%= sessionName %>)<br><br>
				제목 : <input type="text" name="boardQnaTitle" value="<%=boardQnA.getBoardQnaTitle()%>" required><br><br>
				<textarea name="boardQnaContent" cols="30" rows="30" required><%=boardQnA.getBoardQnaContent().replaceAll("<br>", "\r\n")%></textarea><br>
				<input type="submit" value="수정">&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">목록</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
		
	</body>
</html>