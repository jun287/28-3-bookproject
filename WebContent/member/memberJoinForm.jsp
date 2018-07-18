<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberJoinForm</title>
	</head>
	<body>
		<div align="center">
			<h1>회원 가입</h1>
			<form method="post" action="<%= request.getContextPath() %>/member/memberJoinAction.jsp">
				<table>
					<tr>
						<td align="right">아이디 : </td>
						<td><input type="text" name="memberId" required></td>
					</tr>
					<tr>
						<td align="right">비밀번호 : </td>
						<td><input type="password" name="memberPw" required></td>
					</tr>
					<tr>
						<td align="right">이름 :</td>
						<td><input type="text" name="memberName" required></td>
					</tr>
					<tr>
						<td align="right">주소 :</td>
						<td><input type="text" name="memberAddr" required></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/member/memberLoginAction.jsp'">회원가입</button>
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
						</td>
					</tr>
				</table>
			
			
			</form>
		</div>
	</body>
</html>