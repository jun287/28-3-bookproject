<!-- 2018. 07. 24. 공세준 -->

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
			/*  
				회원의 정보를 보여 주는 페이지 입니다.
				
				로그인후 아이디와 회원번호를 받아 selectMember 메서드 호출하여 회원정보가 담긴
				객체의 참조값을 리턴받아 Member 클래스타입의 member 객체참조변수에 대입하고
				selectMemberInter 메서드 호출하여 회원의 관심 카테고리를 조회후 
				객체배열 참조값을 리턴받아 MemberInter객체 배열 타입으로 arrayList 객체참조변수에
				대입후 참조값을 참조하여 회원정보를 불러와 화면에 나타냅니다.
			*/
		
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
						<td>선택하신 목록입니다.</td>
					</tr>						
						<%
							for(int i=0; i<arrayList.size(); i++){
								MemberInter memberInter = arrayList.get(i);
						%>	
								<tr>
									<td></td>	
									<td><%=i+1%>. <%=memberInter.getBookCodeName()%></td>
								</tr>
						<%
							}
						%>	
				</table><br>
					<input type ="submit" value="정보수정">
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</form>
		</div>
	</body>
</html>