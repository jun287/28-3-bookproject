<!-- 2018. 07. 24. 공세준 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "service.bookshop.project.ServiceMember" %>
<%@ page import = "dto.bookshop.project.Member" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dao.bookshop.project.BookCategoryDao" %>
<%@ page import = "dto.bookshop.project.BookCode" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberUpdateForm</title>
	</head>
	<body>
		<%
			/*
				회원 정보를 수정하는 페이지 입니다.
				
				회원 id를 매개변수로 selectMember 메서드를 호출하여
				데이터베이스를 조회후 일치하는 회원정보의 참조값 리턴받아 Member 클래스타입의 member 객체참조변수에 대입하고
				대입받은 참조값을 찾아가서 회원정보를 가져와서 화면에 나타냅니다.
				selectBookCategory메서드를 호출하여
				도서의 카테고리를 가져와서 화면에 나타냅니다.
			
			*/
		
			request.setCharacterEncoding("UTF-8");
			String memberId = request.getParameter("memberId");
			
			ServiceMember serviceMember = new ServiceMember();
			Member member = serviceMember.selectMember(memberId);
			
			BookCategoryDao bookCategoryDao = new BookCategoryDao();
			ArrayList<BookCode> arrayList = bookCategoryDao.selectBookCategory();
		%>
		<div align="center">
			<h1>회원 정보 수정</h1>
			<form method="post" action="<%= request.getContextPath() %>/member/memberUpdateAction.jsp">
				<table>
					<tr>
						<td align="right">아이디 : </td>
						<td><input type="text" name="memberId" value="<%= member.getMemberId() %>" readonly></td>
					</tr>
					<tr>
						<td align="right">비밀번호 : </td>
						<td><input type="password" name="memberPw" value="<%= member.getMemberPw()	 %>" required></td>
					</tr>
					<tr>
						<td align="right">이름 :</td>
						<td><input type="text" name="memberName" value="<%= member.getMemberName() %>" required></td>
					</tr>
					<tr>
						<td align="right">주소 :</td>
						<td><input type="text" name="memberAddr" value="<%= member.getMemberAddr() %>"required></td>
					</tr>
					<tr>
						<td align="right">관심 도서 : </td>
						<td>도서 카테고리를 선택하세요</td>
					</tr>	
						<%
							for(int j=0; j<arrayList.size(); j++){
								BookCode bookCode = arrayList.get(j);
						%>		
								<tr>
									<td></td>
									<td>
										<input type="checkbox" name="memberInter" value="<%=bookCode.getBookCodeNo()%>" ><%=bookCode.getBookCodeName()%>
									</td>
								</tr>
						<%
							}
						%>			
					<tr>
						<td></td>
						<td>
							<input type ="hidden" name = "memberNum" value="<%=member.getMemberNum()%>">
							<input type ="submit" value="수정">
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>