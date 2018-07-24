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
		<title>memberJoinAction</title>
	</head>
	<body>
		<%
			/*
				회원정보를 받아 데이터베이스에 입력합니다.
				
				회원정보를 각각의 변수에 대입하고 Member 클래스 객체 생성후 
				setter's 메서드를 호출하여 값들을 대입합니다.
				도서 카테고리는 값이 없거나 하나 혹은 여러개 일수 있으므로
				있을시에 반복문을 사용해 객체 배열에 저장합니다.
				그리고 카테고리 값이 있으면 insertMemberAll 메서드를 사용하여 회원가입시키고
				없으면 insertMember 메서드를 사용하여 회원가입 시킵니다.
				회원가입이 완료되면 메인화면으로 이동합니다.
				
			*/	
		
			request.setCharacterEncoding("UTF-8");
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
			String memberAddr = request.getParameter("memberAddr");
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberAddr(memberAddr);
			
			int checkDB = 0;
			
			ServiceMember serviceMember = new ServiceMember();
			
			if(request.getParameterValues("memberInter") != null){
				
				String[] memberInter = request.getParameterValues("memberInter");
				int[] memberinterNo = new int[memberInter.length];
				ArrayList<MemberInter> arrayList = new ArrayList<MemberInter>();
				
				for(int i = 0; i<memberInter.length; i++){
					memberinterNo[i] = Integer.parseInt(memberInter[i]);
					MemberInter memberInters = new MemberInter();
					memberInters.setBookcodeNo(memberinterNo[i]);
					arrayList.add(memberInters);
				}

				checkDB = serviceMember.insertMemberAll(member, arrayList);

			}else{
				
				checkDB = serviceMember.insertMember(member);
			}
			
			if(checkDB==2){
				response.sendRedirect(request.getContextPath()+"/member/memberJoinForm.jsp");
			}else if(checkDB==1){
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}
			
		%>
	</body>
</html>