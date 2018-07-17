<!-- 2018. 07. 17. 공세준 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>adminLoginForm.jsp</title>
	</head>
	<body>
		<div align="center">
			<h1>관리자 로그인</h1>
			<form method="post" action="<%= request.getContextPath() %>/admin/adminLoginAction.jsp">
				<table>
					<tr>
						<td align="right">아이디 : </td>
						<td><input type="text" name="adminId"></td>
						<td><input type="submit" value="로그인"></td>
					</tr>
					<tr>
						<td align="right">비밀번호 : </td>
						<td><input type="password" name="adminPw"></td>
						<td><button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>