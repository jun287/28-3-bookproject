<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>insertBookCategoryForm.jsp</title>
	</head>
	<body>
		<!--카테고리를 추가시키 폼을 만든다.  -->
		<form action="<%=request.getContextPath()%>/book/insertBookCategoryAction.jsp">
			<input type="text" name="category" placeholder="카테고리추가" max="1" min="5" >
			<input type="submit" value="확인">
		</form>
	</body>
</html>