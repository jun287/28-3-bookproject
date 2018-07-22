<!-- 2018. 07. 22 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardCommentForm</title>
	</head>
	<body>
		<!-- 관리자가 질문게시글에 답변을 다는 폼입니다.  -->
		<%
			request.setCharacterEncoding("UTF-8");
			int boardQnaNo = 0;
			if(request.getParameter("bqNo") != null){
				boardQnaNo = Integer.parseInt(request.getParameter("bqNo"));
			}
		%>
	
		<div align="center">
			<h1>답변 등록</h1>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardCommentAction.jsp">
				<input type="hidden" name="bqNo" value="<%=boardQnaNo%>">
				<textarea name="boardQnaCommentContent" placeholder="답변 내용을 작성해주세요." cols="100" required></textarea><br>
				<input type="submit" value="작성">&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">목록</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
	</body>
</html>