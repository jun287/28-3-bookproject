<!-- 2018. 07. 24. 공세준 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dao.bookshop.project.BookCategoryDao" %>
<%@ page import = "dto.bookshop.project.BookCode" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>memberJoinForm</title>
	</head>
	<body>
		<%
			/* 
				회원가입을 받는 페이지 입니다.
				
				도서카테고리를 조회후 for반복문으로 화면에 나타냅니다.
				아이디와 비밀번호 및 회원정보를 작성받아 
				값을 post 방식으로 넘겨줍니다.

			*/
		
			BookCategoryDao bookCategoryDao = new BookCategoryDao();
			ArrayList<BookCode> arrayList = bookCategoryDao.selectBookCategory();
		%>
		<div align="center">
			<h1>회원 가입</h1>
			<form method="post" action="<%= request.getContextPath() %>/member/memberJoinAction.jsp">
				<table>
					<tr>
						<td align="right">아이디 : </td>
						<td><input type="text" name="memberId" required></td>
					</tr>
					<tr>
						<td align="right">비밀번호 : </td>
						<td><input type="password" name="memberPw" required></td>
					</tr>
					<tr>
						<td align="right">이름 :</td>
						<td><input type="text" name="memberName" required></td>
					</tr>
					<tr>
						<td align="right">주소 :</td>
						<td><input type="text" name="memberAddr" required></td>
					</tr>
					<tr>
						<td align="right">관심 도서 : </td>
						<td>관심 분야를 선택하세요</td>
					</tr>	
						<%
							for(int i=0; i<arrayList.size(); i++){
								BookCode bookCode = arrayList.get(i);
						%>		
								<tr>
									<td></td>
									<td>
										<input type="checkbox" name="memberInter" value="<%=bookCode.getBookCodeNo()%>"><%=bookCode.getBookCodeName()%>
									</td>
								</tr>
						<%
							}
						%>			
					<tr>
						<td></td>
						<td>
							<input type ="submit" value="회원가입">
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>