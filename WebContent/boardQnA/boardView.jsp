<!-- 2018. 07. 22 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dto.bookshop.project.BoardQnA" %>
<%@ page import="dto.bookshop.project.BoardQnAComment" %>
<%@ page import="dto.bookshop.project.BoardQnAandComment" %>
<%@ page import="service.bookshop.project.ServiceBoardQnA" %>
			
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardView</title>
	</head>
	<body>
		<%	
			/*
				게시글들의 상세정보를 보여주는 boarView페이지 입니다.
				
				게시글 번호와 회원번호 그리고 관리자 번호 를 받아서 
				BoardQnA, boardQnAComment 객체에 setter's 메서드에 대입후 
				ServiceBoardQnA 클래스 객체 생성후
				selectBoardQnaView 메서드에 boardQna, boardQnAComment 객체참조값을 대입후
				호출하면 게시글의 상세정보가 BoardQnAandComment 클래스타입의 객체참조변수에 대입되고
				참조값을 찾아가서 getter's메서드를 호출하여 상세정보를 불러오고 화면에 출력합니다.
				
				회원번호 및 관리자 번호를 조건문에 대입하여 나타내는 메뉴를 달리합니다. 
			*/
			
			request.setCharacterEncoding("UTF-8");
			String sessionAdminId = (String)session.getAttribute("sessionAdminId");
			
			int sessionAdminNo = 0;
			if(session.getAttribute("sessionAdminNo") != null){
				sessionAdminNo = (int)session.getAttribute("sessionAdminNo");
			}
			
			int sessionNo = 0;
			if(session.getAttribute("sessionNo") != null){
				sessionNo = (int)session.getAttribute("sessionNo");
			}
			
			int boardQnaNo = 0;
			if(request.getParameter("bqNo") != null){
				boardQnaNo = Integer.parseInt(request.getParameter("bqNo"));
			}			
			int memberNo = 0;		
			if(request.getParameter("mNo") != null){
				memberNo = Integer.parseInt(request.getParameter("mNo"));
			}
			
			BoardQnA boardQna = new BoardQnA();
			boardQna.setBoardQnaNo(boardQnaNo);
			boardQna.setMemberNo(memberNo);
			
			BoardQnAComment boardQnAComment= new BoardQnAComment();
			boardQnAComment.setAdminNo(sessionAdminNo);
			boardQnAComment.setBoardQnaNo(boardQnaNo);
			
			ServiceBoardQnA serviceBoardQnA = new ServiceBoardQnA();
			BoardQnAandComment boardQnAandComment = serviceBoardQnA.selectBoardQnaView(boardQna, boardQnAComment);
			
		%>
	
		<div align="center">
			<h1>질문 내용</h1>
				----------------------------------------------------------------------<br>
				제목 : <%=boardQnAandComment.getBoardQna().getBoardQnaTitle() %><br>
				----------------------------------------------------------------------<br>
				내용 : <%=boardQnAandComment.getBoardQna().getBoardQnaContent() %><br>
				----------------------------------------------------------------------<br>
				<% 
					if(boardQnAandComment.getBoardQnaComment().getBoardQnaCommentContent() != null){
				%>
						답변완료 : <%=boardQnAandComment.getBoardQnaComment().getBoardQnaCommentContent() %><br><br>
				<%
					}else{
				%>
						답변 대기중<br><br>		
				<%		
					}
				
				
					if(sessionAdminId != null){
				%>
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardCommentForm.jsp?bqNo=<%=boardQnaNo%>'">답변등록</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">목록</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
				<%
					}else if(sessionNo == memberNo && (sessionNo != 0 && memberNo != 0)){
				%>
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">글수정</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">글삭제</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">목록</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
				<%
					}else{
				%>
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">목록</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
				<%
					}
				%>

		</div>
	</body>
</html>