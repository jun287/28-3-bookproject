<!-- 2018. 07. 29 공세준 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberDeleteForm</title>
	</head>
	<body>
		<!-- 회원탈퇴시 비밀번호를 확인 받습니다. -->
		<%
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			System.out.println(memberNo + "<-- memberNo");
		%>	
		<div align = "center">
			<h1>회원 탈퇴</h1>
			<form action="<%= request.getContextPath() %>/member/memberDeleteAction.jsp" method="post">
				<input type="hidden" name="memberNo" value=<%=memberNo%>>
				회원 탈퇴 하시겠습니까?<br><br>
				비밀번호 : <input type="password" name="memberPw" required><br><br>
				<input type ="submit" value="탈퇴">&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
	</body>
</html>