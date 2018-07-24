<!-- 2018. 07. 22 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BoardQnAComment" %>
<%@ page import="service.bookshop.project.ServiceBoardQnA" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardCommentAction</title>
	</head>
	<body>
		<%
			/*	
				질문게시판에서 각각의 게시글에 관리자가 답변을 달고 그 답변의 내용을 데이터베이스에 저장합니다.
				
				String 참조타입으로 boardQnaCommentContent(답변내용)을 받습니다.
				int 기본타입으로 관리자가 로그인한후 생긴 세션정보 중 관리자의 번호를 받습니다.
				int 기본타입으로 게시글의 번호를 받습니다.
				받은 정보를 BoardQnAComment 클래스타입으로 객체를 생성후 
				setter's 메서드를 통해 값 대입후 객체의 참조값을
				ServiceBoardQnA 클래스타입으로 객체를 생성후
				insertBoardQnaComment 메서드에 대입후 호출합니다.
			
			*/
			request.setCharacterEncoding("UTF-8");
			String boardQnaCommentContent = request.getParameter("boardQnaCommentContent");
			boardQnaCommentContent = boardQnaCommentContent.replace("\r\n","<br>");
		
			int sessionAdminNo = 0;
			if(session.getAttribute("sessionAdminNo") != null){
				sessionAdminNo = (int)session.getAttribute("sessionAdminNo");
			}
			int boardQnaNo = 0;
			if(request.getParameter("bqNo") != null){
				boardQnaNo = Integer.parseInt(request.getParameter("bqNo"));
			}
			
			BoardQnAComment boardQnaComment = new BoardQnAComment();
			boardQnaComment.setAdminNo(sessionAdminNo);
			boardQnaComment.setBoardQnaNo(boardQnaNo);
			boardQnaComment.setBoardQnaCommentContent(boardQnaCommentContent);
			
			ServiceBoardQnA serviceBoardQnA = new ServiceBoardQnA();
			serviceBoardQnA.insertBoardQnaComment(boardQnaComment);
			
			response.sendRedirect(request.getContextPath()+"/boardQnA/boardList.jsp");
		%>
	</body>
</html>