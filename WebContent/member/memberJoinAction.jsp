<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "dto.bookshop.project.MemberInter" %>
<%@ page import = "service.bookshop.project.ServiceMember" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberJoinAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
			String memberAddr = request.getParameter("memberAddr");
			String[] memberInter = request.getParameterValues("memberInter");
			int[] memberinterNo = new int[memberInter.length];
			MemberInter memberInterInstance = new MemberInter();
			for(int i = 0; i<memberInter.length; i++){
				memberinterNo[i] = Integer.parseInt(memberInter[i]);
				System.out.println(memberinterNo[i]);
				
			}
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberAddr(memberAddr);
			
			ServiceMember serviceMember = new ServiceMember();
			
			serviceMember.insertMember(member);
			
			response.sendRedirect(request.getContextPath()+"/index.jsp"); 
		%>
	</body>
</html>