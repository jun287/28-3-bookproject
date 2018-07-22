<!-- 2018. 07. 22 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BoardQnA" %>
<%@ page import="service.bookshop.project.ServiceBoardQnA" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardWriteAction</title>
	</head>
	<body>
		<%
			/*
				회원이 게시글을 작성하면 그 정보를 데이터베이스에 입력하는 페이지 입니다.
				
				String 참조타입으로 게시글의 제목과 내용을 받고
				로그인후 세션처리된 회원번호를 int 기본타입으로 받습니다.
				받은값들을 BoardQnA 클래스 객체 생성후 setter's 메서드로 대입후
				그 객체의 참조값을 
				ServiceBoardQnA 클래스 객체 생성하고 insertBoardQnaContent에
				대입하여 호출하면 게시글이 데이터베이스에 저장되고
				질문게시판 목록으로 갑니다.
			*/
			
			request.setCharacterEncoding("UTF-8");
			String boardQnaTitle = request.getParameter("boardQnaTitle");
			String boardQnaContent = request.getParameter("boardQnaContent");
			
			int sessionNo = 0;
			if(session.getAttribute("sessionNo") != null){
				sessionNo = (int)session.getAttribute("sessionNo");
			}
			
			BoardQnA boardQna = new BoardQnA();
			boardQna.setMemberNo(sessionNo);
			boardQna.setBoardQnaTitle(boardQnaTitle);
			boardQna.setBoardQnaContent(boardQnaContent);
			
			ServiceBoardQnA serviceBoardQna = new ServiceBoardQnA();
			serviceBoardQna.insertBoardQnaContent(boardQna);
			
			response.sendRedirect(request.getContextPath()+"/boardQnA/boardList.jsp");
		%>
	</body>
</html>