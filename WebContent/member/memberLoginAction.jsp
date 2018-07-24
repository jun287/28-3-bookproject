<!-- 2018. 07. 24. 공세준 -->

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
			/* 
				회원 아이디와 비밀번호를 받아 로그인 처리하고 세션처리합니다.
				
				아이디와 비밀번호를 받아 loginMember 메서드를 호출하여
				데이터베이스 조회후 아이디와 비밀번호가 존재하면 회원정보를 담은 객체의 참조값을 리턴하고
				리턴받은 참조값을 찾아가 아이디와 이름 회원번호를 받아
				세션처리합니다.
				만약 존재 하지 않으면 다시 로그인 페이지로 이동합니다.
			*/
			
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