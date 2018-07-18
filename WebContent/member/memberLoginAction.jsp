<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "service.bookshop.project.ServiceMember" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberLoginAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			
			System.out.println(memberId);
			System.out.println(memberPw);
			
			ServiceMember serviceMember = new ServiceMember();
			
			Member member = serviceMember.loginMember(memberId, memberPw);
			
			if(member != null){
				session.setAttribute("sessionId", member.getMemberId());
				session.setAttribute("sessionName", member.getMemberName());
				session.setAttribute("sessionNo", member.getMemberNum());
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}else {
				response.sendRedirect(request.getContextPath()+"/member/memberLoginForm.jsp");
			}			
		%>
	</body>
</html>