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
			
			Member member = new Member();
			member.setMemberNum(memberNum);
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberAddr(memberAddr);
			
			ServiceMember serviceMember = new ServiceMember();
			
			if(request.getParameterValues("memberInter") != null){
			
				String[] memberInter = request.getParameterValues("memberInter");
				int[] memberinterNo = new int[memberInter.length];
				ArrayList<MemberInter> arrayList = new ArrayList<MemberInter>();
				
				for(int i = 0; i<memberInter.length; i++){
					memberinterNo[i] = Integer.parseInt(memberInter[i]);
					MemberInter memberInters = new MemberInter();
					memberInters.setBookcodeNo(memberinterNo[i]);
					memberInters.setMemberNo(memberNum);
					arrayList.add(memberInters);
				}	
				
				serviceMember.updateMemberAll(member, arrayList);
			}else{
				serviceMember.updateMember(member);
			}
			
			response.sendRedirect(request.getContextPath()+"/member/memberInformationList.jsp");
		%>
	</body>
</html>