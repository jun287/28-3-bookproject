<!-- 2018. 07. 24. 공세준 -->

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
			/*
				회원정보 수정폼에서 받은 회원정보를 데이터베이스에 업데이트 합니다.
				
				회원정보 수정폼에서 받은 회원정보 값들을 각각의 변수에 담고
				담은 변수를 Member 클래스 객체 생성후 setter's 메서드로 값을 대입합니다.
				도서 카테고리의 경우 값이 여려개 이므로 배열로 받아서
				for 반복문으로 값을 객체 배열에 대입하여 줍니다.
				
				회원이 선택한 카테고리가 있으면 updateMemberAll 메서드를 호출하여 카테고리와 회원정보를 업데이트하고
				회원정보만 있을때는 updateMember 메서드를 호출하여 회원정보만 업데이트합니다.
			
			*/
		
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