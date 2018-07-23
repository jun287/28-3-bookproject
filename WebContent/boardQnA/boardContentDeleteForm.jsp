<!-- 2018. 07. 23 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardContentDeleteForm</title>
	</head>
	<body>
		<div align="center">
			<h1>게시글 삭제</h1>
			<%
				/* 
					게시글의 삭제 여부를 묻는 폼입니다.
					관리자의 번호와 게시글 번호 , 회원번호를 int 기본타입 변수에 담고
					폼으로 "post" 방식으로 BoardQnACommentAction.jsp로 제출합니다.
					
				*/
			
				request.setCharacterEncoding("UTF-8");
				
				int sessionAdminNo = 0;
				if(session.getAttribute("sessionAdminNo") != null){
					sessionAdminNo = (int)session.getAttribute("sessionAdminNo");
				}
				
				int boardQnaNo = 0;
				if(request.getParameter("bqNo") != null){
					boardQnaNo = Integer.parseInt(request.getParameter("bqNo"));
				}
				
				int memberNo = 0;		
				if(request.getParameter("mNo") != null){
					memberNo = Integer.parseInt(request.getParameter("mNo"));
				}
			%>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardContentDeleteAction.jsp">
				<input type="hidden" name="boardQnaNo" value="<%=boardQnaNo%>">
				<input type="hidden" name="sessionAdminNo" value="<%=sessionAdminNo%>">
				<input type="hidden" name="memberNo" value="<%=memberNo%>">
				게시글을 삭제 하시겠습니까?<br><br>
				<input type="submit" value="삭제">		
			</form>	
		</div>
	</body>
</html>