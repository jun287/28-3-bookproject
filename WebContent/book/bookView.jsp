<%@page import="dto.bookshop.project.Member"%>
<%@page import="service.bookshop.project.ServiceMember"%>
<%@page import="dao.bookshop.project.PublisherDao"%>
<%@page import="dto.bookshop.project.Publisher"%>
<%@page import="dto.bookshop.project.Book"%>
<%@page import="dao.bookshop.project.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
			#wrap{
				width: 800px;
				height: auto;
				border: 1px solid #000000;
				border-radius: 6px;
			}
			#titleDate{
				padding-top:10px;
				width: 800px;
				height: 30px;
				border-bottom: 1px solid #000000;
			}
			#title{
				margin-left: 10px;
				font-size: 15px;
			}
			#date{
				float:right;
				margin-right: 10px;
				font-size: 12px;
			}
			#name{
				padding-left:10px;
				padding-top:10px;
				width: 790px;
				height: 30px;
				border-bottom: 1px solid #000000;
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
			#goodsInfo{
				clear:both;
				
				margin:0 0 10px 10px;
				width: 780px;
			}
			#button{
				
				margin-left: 690px;
				margin-bottom:10px;
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
			
			BookDao bookDao=new BookDao();
			Book book=bookDao.selectBook(bookNo);
			
			PublisherDao publisherDao=new PublisherDao();
			Publisher publisher=publisherDao.selectPublisherNo(book.getPublisherNo());
			
			System.out.println(publisher.getPublisherNo()+"<--publisher.getPublisherNo()");
			System.out.println(publisher.getPublisherName()+"<--publisher.getPublisherName()");
			System.out.println(publisher.getPublisherWebsite()+"<--publisher.getPublisherWebsite()");
		
			String sessionId=(String)session.getAttribute("sessionId");
			
			ServiceMember serviceMember=new ServiceMember();
			Member member=serviceMember.selectMember(sessionId);
			
			System.out.println(session.getAttribute("sessionId")+"<--session.getAttribute(sessionId)");
			
		%>
		
		<div id="info">
		
			<div id="img">
				<br>&nbsp;
				<span>smart</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>tiger</span>
			</div>
			
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
				<a href="<%=request.getContextPath()%>/book/bookAddCartForm.jsp?bookNumber=<%=bookNo %>&bookamount=<%=num1 %>&memberId=<%=member.getMemberNum() %>>"><input type="button" value="장바구니" size="1"></a>
				<a href="<%=request.getContextPath()%>/book/bookOrdersForm.jsp?bookNumber=<%=bookNo %>&bookamount=<%=num1 %>&memberId=<%=member.getMemberNum() %>>"><input type="button" value="바로구매" size="1"></a>
			</div>
			
			<div id="goodsInfo">
				
			
			</div>
			
			<div id="button">								
				<a href="#"><input type="button" value="삭제"></a>
				<a href="#"><input type="button" value="수정"></a>
				<a href="./goodsList.jsp"><input type="button" value="목록"></a>
			</div>
			
		</div>
	</body>
</html>