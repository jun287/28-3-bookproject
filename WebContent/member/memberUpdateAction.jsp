<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "dto.bookshop.project.MemberInter" %>
<%@ page import = "java.util.ArrayList" %>
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
			int memberNum = Integer.parseInt(request.getParameter("memberNum"));
			
			String[] memberInter = request.getParameterValues("memberInter");
			int[] memberinterNo = new int[memberInter.length];
			ArrayList<MemberInter> arrayList = new ArrayList<MemberInter>();
			
			for(int i = 0; i<memberInter.length; i++){
				memberinterNo[i] = Integer.parseInt(memberInter[i]);
				System.out.println(memberinterNo[i]);
				MemberInter memberInters = new MemberInter();
				memberInters.setBookcodeNo(memberinterNo[i]);
				memberInters.setMemberNo(memberNum);
				arrayList.add(memberInters);
			}	
			
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
			serviceMember.updateMemberAll(member, arrayList);
			
			response.sendRedirect(request.getContextPath()+"/member/memberInformationList.jsp");
		%>
	</body>
</html>