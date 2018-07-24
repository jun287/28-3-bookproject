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
			/* 
				질문게시글의 수정 정보를 받아서 데이터베이스 테이블내에 게시글 정보를을 수정합니다.
				
				게시글의 제목과 내용 그리고 회원번호 게시글의 번호를 받아 각각의 변수에 대입합니다.
				변수에 담긴 값들을 BoardQnA 클래스 객체 생성후
				setter's 메서드 호출 하여 대입하여 줍니다.
				ServiceBoardQnA 클래스 객체 생성후 serviceBoardQnA 객체참조값을
				찾아가서  updateBoardQnaContent 메서드에 boardQna 참조값을 대입하여 
				호출하면 데이터베이스에 게시글 정보가 수정됩니다. 
				
			*/
		
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