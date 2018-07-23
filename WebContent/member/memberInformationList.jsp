<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "service.bookshop.project.ServiceMember" %>
<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "dao.bookshop.project.MemberDao" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dto.bookshop.project.MemberInter" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberInformationList</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String sessionId = (String)session.getAttribute("sessionId");
			
			int sessionNo = 0;
			if(session.getAttribute("sessionNo") != null){
				sessionNo = (int)session.getAttribute("sessionNo");
			}
			
			ServiceMember serviceMember = new ServiceMember();
			Member member = serviceMember.selectMember(sessionId);
			
			MemberDao memberDao = new MemberDao();
			ArrayList<MemberInter> arrayList = memberDao.selectMemberInter(sessionNo);
			
		%>
		
		<div align="center">
			<h1>회원 정보</h1>
			<form method="post" action="<%= request.getContextPath() %>/member/memberUpdateForm.jsp?memberId=<%= member.getMemberId() %>">
				<table>
					<tr>
						<td align="right">아이디 : </td>
						<td><%= member.getMemberId() %></td>
					</tr>
					<tr>
						<td align="right">포 인 트 : </td>
						<td><%= member.getMemberPoint() %></td>
					</tr>
					<tr>
						<td align="right">이 름 : </td>
						<td><%= member.getMemberName() %></td>
					</tr>
					<tr>
						<td align="right">주 소 : </td>
						<td><%= member.getMemberAddr() %></td>
					</tr>
					<tr>
						<td align="right">관심 도서 : </td>
						<%
							for(int i=0; i<arrayList.size(); i++){
								MemberInter memberInter = arrayList.get(i);
						%>	
								<td><%=memberInter.getBookCodeName()%></td>
						<%
							}
						%>	
					</tr>	
				</table><br>
					<input type ="submit" value="정보수정">
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
	</body>
</html>