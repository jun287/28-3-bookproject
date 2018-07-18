<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>boardList</title>
	</head>
	<body>
		<div align="center">
			<h1>Q&A 게시판</h1>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardWriteForm.jsp">
				<table border="1" width="50%">
					<thead>
						<tr>
							<th>번호</th>
							<th>질문내용</th>
							<th>작성자</th>
							<th>작성날짜</th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td>1</td>
							<td><a href="<%= request.getContextPath() %>/boardQnA/boardView.jsp">배송은 언제 되나요?</a></td>
							<td>test</td>
							<td>2018-07-18</td>
						</tr>
					</tbody>
				</table><br>
				<input type="submit" value="글쓰기">&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
			<form method="post" action="<%= request.getContextPath() %>/boardQnA/boardList.jsp">
				<input type="text" name="searchWord">
				<input type="submit" value="검색">
			</form>
		</div>
	</body>
</html>