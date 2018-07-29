<!-- 2018. 07. 29 공세준 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "service.bookshop.project.ServiceMember" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberDeleteAction</title>
	</head>
	<body>
		<%
			/*
				회원 번호와 아이디 , 비밀번호를 대입받아서 정보 삭제 및 탈퇴하는 페이지 입니다.
				
				회원정보를 받아서 Member 클래스 객체 생성후 setter's 메서드 호출하여
				값을 대입하고 객체의 참조값을 member 객체참조변수에 대입합니다.
				ServiceMember 클래스 객체를 생성하고
				객체내에 deleteMember 메서드에 member 참조값을 대입하여 호출하면
				회원정보 삭제와 회원탈퇴가 되고
				세션이 종료되고 메인화면으로 이동합니다.
			*/
			
			request.setCharacterEncoding("UTF-8");
		
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String sessionId = (String)session.getAttribute("sessionId");
			String memberPw = request.getParameter("memberPw");
			final int adminNo = 1;
			
			System.out.println(memberNo + "<-- 회원번호");
			System.out.println(memberPw + "<-- 비밀번호");
			
			Member member = new Member();
			member.setMemberNum(memberNo);
			member.setMemberId(sessionId);
			member.setMemberPw(memberPw);
			
			ServiceMember serviceMember = new ServiceMember();
			serviceMember.deleteMember(member);
			
			response.sendRedirect(request.getContextPath() + "/member/memberLogout.jsp");
		%>
	</body>
</html>