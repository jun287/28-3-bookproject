<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberJoinForm</title>
	</head>
	<body>
		<div align="center">
			<h1>ȸ�� ����</h1>
			<form method="post" action="<%= request.getContextPath() %>/member/memberJoinAction.jsp">
				<table>
					<tr>
						<td align="right">���̵� : </td>
						<td><input type="text" name="memberId" required></td>
					</tr>
					<tr>
						<td align="right">��й�ȣ : </td>
						<td><input type="password" name="memberPw" required></td>
					</tr>
					<tr>
						<td align="right">�̸� :</td>
						<td><input type="text" name="memberName" required></td>
					</tr>
					<tr>
						<td align="right">�ּ� :</td>
						<td><input type="text" name="memberAddr" required></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/member/memberLoginAction.jsp'">ȸ������</button>
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">��������</button>
						</td>
					</tr>
				</table>
			
			
			</form>
		</div>
	</body>
</html>