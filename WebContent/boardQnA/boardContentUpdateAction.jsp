<!-- 2018. 07. 23 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BoardQnA" %>
<%@ page import="service.bookshop.project.ServiceBoardQnA" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardContentUpdateAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String boardQnaTitle = request.getParameter("boardQnaTitle");
			String boardQnaContent = request.getParameter("boardQnaContent");
			boardQnaContent = boardQnaContent.replace("\r\n","<br>");
			
			int boardQnaNo = 0;
			if(request.getParameter("boardQnaNo") != null){
				boardQnaNo = Integer.parseInt(request.getParameter("boardQnaNo"));
			}
			
			int sessionNo = 0;
			if(session.getAttribute("sessionNo") != null){
				sessionNo = (int)session.getAttribute("sessionNo");
			}
			
			BoardQnA boardQna = new BoardQnA();
			boardQna.setBoardQnaNo(boardQnaNo);
			boardQna.setMemberNo(sessionNo);
			boardQna.setBoardQnaTitle(boardQnaTitle);
			boardQna.setBoardQnaContent(boardQnaContent);
			
			ServiceBoardQnA serviceBoardQna = new ServiceBoardQnA();
			serviceBoardQna.updateBoardQnaContent(boardQna);
			
			response.sendRedirect(request.getContextPath()+"/boardQnA/boardList.jsp");
			
		%>
		
	</body>
</html>