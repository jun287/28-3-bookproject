<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dao.bookshop.project.MemberDao" %>
<%@ page import = "dto.bookshop.project.Member" %>

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
			
			MemberDao memberDao = new MemberDao();
			String result = memberDao.loginCheckMember(memberId, memberPw);
			
			if(result.equals("로그인성공")){
				Member member = memberDao.memberInformationSelect(memberId);
				session.setAttribute("sessionId", member.getMemberId());
				session.setAttribute("sessionName", member.getMemberName());
				session.setAttribute("sessionNo", member.getMemberNum());
				
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}else if(result.equals("로그인실패")){
				response.sendRedirect(request.getContextPath()+"/member/memberJoinForm.jsp");
			}
		%>
	</body>
</html>