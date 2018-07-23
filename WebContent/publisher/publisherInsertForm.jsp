<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div align="center">
			<h1>출판사 등록</h1>
			<form action="<%=request.getContextPath()%>/publisher/publisherInsertAction.jsp" method="post">
				<label>출판사이름</label>
				<input type="text" name="publisherName" required><br>
				<label>출판사홈페이지</label>
				<input type="text" name="publisherSite" required><br>
				<input type="submit" value="등록">
			</form>
		</div>
	</body>
</html>