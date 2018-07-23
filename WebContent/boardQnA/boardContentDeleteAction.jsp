<!-- 2018. 07. 23 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BoardQnA" %>
<%@ page import="dto.bookshop.project.BoardQnAComment" %>
<%@ page import="dto.bookshop.project.BoardQnAandComment" %>
<%@ page import="service.bookshop.project.ServiceBoardQnA" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardContentDeleteAction</title>
	</head>
	<body>
		<%
			/* 
				게시글에서 정보를 받아와서 삭제합니다.
				관리자의번호 와 게시글 번호, 회원번호를 받아와서 int 기본타입 변수대입후
				BoardQnA, BoardQnAComment 클래스 객체에 setter's 메서드를 통해 대입후
				ServiceBoardQnA 클래스객체 생성후 deleteBoardQnaContentAll 메서드에 대입하여
				호출하면 게시글과 답변 모두가 삭제 되고 질문게시판 목록으로 이동 됩니다.
				
			*/
			
		
			request.setCharacterEncoding("UTF-8");
		
			int sessionAdminNo = Integer.parseInt(request.getParameter("sessionAdminNo"));
			
			int boardQnaNo = Integer.parseInt(request.getParameter("boardQnaNo"));
	
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));

			BoardQnA boardQna = new BoardQnA();
			boardQna.setBoardQnaNo(boardQnaNo);
			boardQna.setMemberNo(memberNo);
			
			BoardQnAComment boardQnAComment= new BoardQnAComment();
			boardQnAComment.setAdminNo(sessionAdminNo);
			boardQnAComment.setBoardQnaNo(boardQnaNo);
			
			ServiceBoardQnA serviceBoardQnA = new ServiceBoardQnA();
			serviceBoardQnA.deleteBoardQnaContentAll(boardQna, boardQnAComment);
			
			System.out.println("게시글 삭제 완료");
			response.sendRedirect(request.getContextPath()+"/boardQnA/boardList.jsp");
			
		%>
	</body>
</html>