<!-- 2018. 07. 17. ������ -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberLoginForm</title>
	</head>
	<body>
		<div align="center">
			<h1>ȸ�� �α���</h1>
			<form method="post" action="<%= request.getContextPath() %>/member/memberLoginAction.jsp">
				<table>
					<tr>
						<td align="right">���̵� : </td>
						<td><input type="text" name="memberId" required></td>
						<td><input type="submit" value="�α���"></td>
					</tr>
					<tr>
						<td align="right">��й�ȣ : </td>
						<td><input type="password" name="memberPw" required></td>
						<td><button type="button" onclick="location.href='<%= request.getContextPath() %>/admin/adminLoginForm.jsp'">������</button></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>