<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "service.bookshop.project.ServiceMember" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberUpdateAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
			String memberAddr = request.getParameter("memberAddr");
			
			System.out.println(memberId);
			System.out.println(memberPw);
			System.out.println(memberName);
			System.out.println(memberAddr);

			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberAddr(memberAddr);
			
			ServiceMember serviceMember = new ServiceMember();
			serviceMember.updateMember(member);
			
			response.sendRedirect(request.getContextPath()+"/member/memberInformationList.jsp");
		%>
	</body>
</html>