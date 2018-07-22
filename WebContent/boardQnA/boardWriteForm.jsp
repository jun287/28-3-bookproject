<!-- 2018. 07. 22 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardWriteForm</title>
	</head>
	<body>
		<%
			/*
				질문 게시글을 작성하는 폼입니다.
				로그인후 세션처리된 값들을 받고 폼이 제출될때 데이터들을 넘겨줍니다.
			*/
			request.setCharacterEncoding("UTF-8");
			String sessionId = (String)session.getAttribute("sessionId");
			String sessionName = (String)session.getAttribute("sessionName");

		%>
		<div align="center">
			<h1>질문 작성</h1>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardWriteAction.jsp">
				작성자 : <%= sessionId %>(<%= sessionName %>)<br><br>
				제목 : <input type="text" name="boardQnaTitle" required><br><br>
				<textarea name="boardQnaContent" placeholder="질문내용을 작성해주세요." cols="30" rows="30" required></textarea><br>
				<input type="submit" value="작성">&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/boardQnA/boardList.jsp'">목록</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
	</body>
</html>