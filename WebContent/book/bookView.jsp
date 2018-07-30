<!-- 2018. 07. 25 정민수  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.bookshop.project.BookReviewDao"%>
<%@ page import="dto.bookshop.project.BookReview"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.bookshop.project.BookIntro"%>
<%@ page import="dto.bookshop.project.Member"%>
<%@ page import="service.bookshop.project.ServiceMember"%>
<%@ page import="dao.bookshop.project.PublisherDao"%>
<%@ page import="dto.bookshop.project.Publisher"%>
<%@ page import="dto.bookshop.project.Book"%>
<%@ page import="dao.bookshop.project.BookDao"%>
<%@ page import="service.bookshop.project.ServicePublisher"%>

<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>goodsView.jsp</title>
		<style>
			#button a:link{
				color:white;
			}
			#button a:hover{
			color:white;	
			}
			#button a:visited{
			color:white;	
			}
			#info{
				align-content:center;
			
				width: 800px;
				height: auto;
				
			}
			#img{
				
				font-size:70px;
				margin:20px 0 10px 10px;
				border-radius:5px;
				float:left;
				width: 380px;
				height: 450px;
				border: 1px solid #000000;
			}
			#userinfo{
				margin:20px 10px 10px 0;
				border-radius:5px;
				font-size:15px;
				float:right;
				width: 380px;
				height: 400px;
				
			}
			#intro{
				clear:both;
				align-content:center;
				width: 800px;
				height: auto;
			}
			#button{
			 float:right;
			}
			#review{
				clear:both;
				align-content:center;
				width: 800px;
				height: auto;
			}
		</style>
	</head>
	<body>
		<%
			
			int bookNo=Integer.parseInt(request.getParameter("bookNumber"));
			System.out.println(bookNo+"<--bookNo");
			
			String operator=request.getParameter("operator");
			System.out.println(operator+"<--operator");
			
			int num1=0;
			
			if(request.getParameter("num1")==null){
				System.out.println("값이 없음");
				num1=1;
			}else{
				System.out.println("값이 있음");
				num1=Integer.parseInt(request.getParameter("num1"));
			}
			
			int row=5;
			int currentPage;
			
			if(request.getParameter("currentPage")==null){
				currentPage=1;
			}else{
				currentPage=Integer.parseInt(request.getParameter("currentPage"));
			}
			
			
			
			
			BookDao bookDao=new BookDao();
			Book book=bookDao.selectBook(bookNo);
			
			ServicePublisher servicePublisher = new ServicePublisher();
			Publisher publisher=servicePublisher.selectPublisherNo(book.getPublisherNo());
			
			System.out.println(publisher.getPublisherNo()+"<--publisher.getPublisherNo()");
			System.out.println(publisher.getPublisherName()+"<--publisher.getPublisherName()");
			System.out.println(publisher.getPublisherWebsite()+"<--publisher.getPublisherWebsite()");
		    
			String sessionId=(String)session.getAttribute("sessionId");
			
			ServiceMember serviceMember=new ServiceMember();
			Member member=serviceMember.selectMember(sessionId);
			
			System.out.println(member.getMemberNum()+"<--member.getMemberNum()");
			System.out.println(session.getAttribute("sessionId")+"<--session.getAttribute(sessionId)");
			
			ArrayList<BookIntro> result=bookDao.selectBookIntro(bookNo);
			
			BookReviewDao bookReviewDao=new BookReviewDao();
			ArrayList<BookReview> result1=bookReviewDao.selectBookReview(bookNo,currentPage,row);
		
			String sessionAdminId = (String)session.getAttribute("sessionAdminId");
			
			
			int total=bookReviewDao.paging(row,bookNo);
			System.out.println(total+"<-total");
			
		%>
		
			<div id="info">
				<!--책사진  -->
				<div id="img">
					<br>&nbsp;
					<span>smart</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span>tiger</span>
				</div>
				<!--책정보  -->
				<div id="userinfo">
					<h1><%=book.getBookName() %></h1>
					<span><%=book.getBookAuthor() %>&nbsp;|&nbsp;<%=publisher.getPublisherName()%>&nbsp;|&nbsp;<%=book.getBookDate() %></span><br>
					<p>-------------------------------------------------------------</P>
					<label>정가</label>
					<span><%=book.getBookPrice() %>원</span><br>
					<label>통합포인트</label>
					<span> <%=book.getBookPoint() %>%</span>
					<p>-------------------------------------------------------------</P>
					<span>배송비 : 무료</span><br>
					<span>배송일정 : 서울특별시 종로구 세종대로 기준</span><br>
					<span>바로드림 : 인터넷으로 주문하고 매장에서 직접 수령</span>
					<p>-------------------------------------------------------------</P>
					<label>주문:</label>
					<input type="text" value=<%=num1 %> size="1">
					
					<a href="<%=request.getContextPath()%>/book/bookView.jsp?bookNumber=<%=bookNo %>&num1=<%=num1+1%>"><input type="button" value="+" size="1" ></a>
					<a href="<%=request.getContextPath()%>/book/bookView.jsp?bookNumber=<%=bookNo %>&num1=<%=num1-1%>"><input type="button" value="-" size="1"></a><br><br>
					<%
						if(sessionId!=null){
					%>
							<a href="<%=request.getContextPath()%>/shoppingCart/shoppingCartAddAction.jsp?bookNumber=<%=bookNo %>&bookAmount=<%=num1 %>&memberNumber=<%=member.getMemberNum() %>&totalPrice=<%=book.getBookPrice()*num1 %>"><input type="button" value="장바구니" size="1"></a>
					<%
						}
					%>
					<a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?bookNumber=<%=bookNo %>&amount=<%=num1 %>&memberNumber=<%=member.getMemberNum()%>&price=<%=book.getBookPrice() %>"><input type="button" value="바로구매" size="1"></a>
					<%
						if(sessionAdminId!=null){
					%>
					<a href="<%=request.getContextPath()%>/book/bookUpdateForm.jsp?bookNumber=<%=bookNo %>"><input type="button" value="수정"></a>
					<a href="<%=request.getContextPath()%>/book/bookDelete.jsp?bookNumber=<%=bookNo %>"><input type="button" value="삭제"></a>
					<%
						}
					%>
					
				</div>
			</div>
			
			<div id="intro">
				<br><br>
				<span>--------------------------------------------------------</span>
				<span>책소개</span>
				<span>-------------------------------------------------------</span><br>
				<%
					for(int i=0;i<result.size();i++){
						BookIntro bookIntro1=result.get(i);
						
				%>
					<span><%=bookIntro1.getBookIntroContent() %>--<%=bookIntro1.getBookIntroWrite().replace("<br>","\r\n") %></span><br>
					
					<%
						if(sessionAdminId!=null){
					%>
					<a href="<%=request.getContextPath()%>/book/bookIntroUpdateForm.jsp?bookNumber=<%=bookNo%>"><button>수정</button></a>
					<a href="<%=request.getContextPath()%>/book/bookIntroDelete.jsp?bookNumber=<%=bookNo%>&bookIntroNo=<%=bookIntro1.getBookIntroNo()%>"><button>삭제</button></a><br>
						
				<%
					}
					}
					if(sessionAdminId!=null){
				%>
				
				
				<form action="<%=request.getContextPath()%>/book/bookIntroInsertAction.jsp?bookNumber=<%=bookNo %>" method="post">
						<label>글쓴이</label>
						<input type="text"  width="1px;" name="write"required><br><br>
						<textarea name="content" style="width:800px;height:100px;resize: none;"required></textarea>
						<input type="submit" value="등록">
				</form>
				<%
					}
				%>
			</div>
			
			
			<div id="review">
				
				<br><br>
				<span>-----------------------------------------------------</span>
				<span>Book Review</span>
				<span>-----------------------------------------------------</span><br><br>
				
				<div>
					<%
						for(int i=0;i<result1.size();i++){
							BookReview bookReview1=result1.get(i);
							Member member1=serviceMember.selectMemberPoint(bookReview1.getMemberNo());
					%>
							<span><%=bookReview1.getBookReviewContent() %>--<%=member1.getMemberId() %></span>
					<%
							if(sessionId!=null){
					%>
								<a href="<%=request.getContextPath()%>/book/bookReviewUpdateForm.jsp?bookReviewNo=<%=bookReview1.getBookReviewNo()%>&&bookNumber=<%=bookNo%>"><button>수정</button></a>
								<a href="<%=request.getContextPath()%>/book/bookReviewDelete.jsp?bookReviewNo=<%=bookReview1.getBookReviewNo()%>&bookNumber=<%=bookNo%>"><button>삭제</button></a><br>					
					<%
							}
						}
					%>
					<%
					if(currentPage>1){
					%>
					<a href="<%=request.getContextPath() %>/book/bookView.jsp?currentPage=<%=currentPage-1%>&bookNumber=<%=bookNo%>">&lt;이전</a>
					<%
						}
					
						if(currentPage<total){
					%>
					<a href="<%=request.getContextPath() %>/book/bookView.jsp?currentPage=<%=currentPage+1%>&bookNumber=<%=bookNo%>">다음&gt;</a>
					<%
						}
					%>
				</div><br>
				<%
					if(sessionId!=null){
				%>
				<form method="post" action="<%= request.getContextPath() %>/book/bookReviewInsertAction.jsp">
					<input type="hidden" name="bookNo" value="<%=bookNo%>">
					<textarea name="bookReviewContent" placeholder="서평(Book Review)을 작성해주세요." style="width:800px;height:100px;resize: none;"required></textarea><br><br>
					<input type="submit" value="작성">&nbsp;&nbsp;
					
				</form>
				<%
					}
				%>
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/bookCategory/bookCategoryView.jsp'">목록</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">메인으로</button>
			</div>
	</body>
</html>