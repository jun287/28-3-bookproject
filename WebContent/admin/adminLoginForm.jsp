<!-- 2018. 07. 17. ������ -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>adminLoginForm.jsp</title>
	</head>
	<body>
		<div align="center">
			<h1>������ �α���</h1>
			<form method="post" action="<%= request.getContextPath() %>/admin/adminLoginAction.jsp">
				<table>
					<tr>
						<td align="right">���̵� : </td>
						<td><input type="text" name="adminId"></td>
						<td><input type="submit" value="�α���"></td>
					</tr>
					<tr>
						<td align="right">��й�ȣ : </td>
						<td><input type="password" name="adminPw"></td>
						<td><button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">��������</button></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>