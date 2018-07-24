<!-- 2018. 07. 17. 공세준 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberLoginForm</title>
	</head>
	<body>
		<!-- 회원 로그인 페이지 입니다. -->
		<div align="center">
			<h1>회원 로그인</h1>
			<form method="post" action="<%= request.getContextPath() %>/member/memberLoginAction.jsp">
				<table>
					<tr>
						<td align="right">아이디 : </td>
						<td><input type="text" name="memberId" required></td>
						<td><input type="submit" value="로그인"></td>
					</tr>
					<tr>
						<td align="right">비밀번호 : </td>
						<td><input type="password" name="memberPw" required></td>
						<td><button type="button" onclick="location.href='<%= request.getContextPath() %>/admin/adminLoginForm.jsp'">관리자</button></td>
					</tr>
				</table>
			</form><br>
			<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
		</div>
	</body>
</html>