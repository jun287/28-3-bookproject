<!-- 2018. 7. 23(월) 이원상  bookList.jsp-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.bookshop.project.*"%>
<%@ page import="dto.bookshop.project.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>책 리스트</title>
		<style>
			tr, td, th{
				border:1px solid #353535
			}
		</style>
	</head>

<%
	request.setCharacterEncoding("utf-8");
	int currentPage = (request.getParameter("currentPage") == null) ? 1 : Integer.parseInt(request.getParameter("currentPage"));	// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	int pagePerRow = (request.getParameter("pagePerRow") == null) ? 5 : Integer.parseInt(request.getParameter("pagePerRow"));		// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	String searchCategory = (request.getParameter("searchCategory") == null) ? "" : request.getParameter("searchCategory");			// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	String searchKeyword = (request.getParameter("searchKeyword") == null) ? "" : request.getParameter("searchKeyword");			// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우	
	String beginDate  = (request.getParameter("beginDate") == null) ? "" : request.getParameter("beginDate");						// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	String endDate  = (request.getParameter("endDate") == null) ? "" : request.getParameter("endDate");								// 삼항연산자 (조건식) ? 참일경우 : 거짓일 경우
	System.out.println(searchCategory+"<--searchCategory");
	System.out.println(searchKeyword+"<--searchKeyword");
	System.out.println(beginDate+"<--beginDate");
	System.out.println(endDate+"<--endDate");
	
	BookListDao bookListDao = new BookListDao();
	BookAndPublisherAndBookCode bookAndPublisherAndBookCode = new BookAndPublisherAndBookCode();
	ArrayList<BookAndPublisherAndBookCode> bookAndPublisherAndBookCodeList =new ArrayList<BookAndPublisherAndBookCode>();
	bookAndPublisherAndBookCodeList = bookListDao.selectBookListSearchByPage(beginDate, endDate, searchKeyword, searchCategory, currentPage, pagePerRow);
	int lastPage = bookListDao.checkBookListLastPage(beginDate, endDate, searchKeyword, searchCategory, currentPage, pagePerRow);
	System.out.println(lastPage+"<--lastPage");
	int bookAndPublisherAndBookCodeListSize = bookAndPublisherAndBookCodeList.size();
%>
	<body>
	<!-- 페이지당 볼 행 설정 폼 시작 -->
		<form action="<%=request.getContextPath() %>/book/bookList.jsp" method="post" id="pagePerRowSelectForm">
		
<%		
	if(pagePerRow == 3){
%>
			<select id="pagePerRow" name="pagePerRow">
				<option value="3" selected>3개씩 보기</option>
				<option value="5">5개씩 보기</option>
				<option value="7">7개씩 보기</option>
				<option value="10">10개씩 보기</option>
			</select>
<%		
	}else if(pagePerRow == 5){
%>
			<select id="pagePerRow" name="pagePerRow">
				<option value="3">3개씩 보기</option>
				<option value="5" selected>5개씩 보기</option>
				<option value="7">7개씩 보기</option>
				<option value="10">10개씩 보기</option>
			</select>
<%		
	}else if(pagePerRow == 7){
%>
			<select id="pagePerRow" name="pagePerRow">
				<option value="3">3개씩 보기</option>
				<option value="5">5개씩 보기</option>
				<option value="7" selected>7개씩 보기</option>
				<option value="10">10개씩 보기</option>
			</select>
<%		
	}else if(pagePerRow == 10){
%>
			<select id="pagePerRow" name="pagePerRow">
				<option value="3">3개씩 보기</option>
				<option value="5">5개씩 보기</option>
				<option value="7">7개씩 보기</option>
				<option value="10" selected>10개씩 보기</option>
			</select>
<%
	}
%>	
			<input type="hidden" name="searchCategory" value="<%=searchCategory%>">	
			<input type="hidden" name="searchKeyword" value="<%=searchKeyword%>">	
			<input type="hidden" name="beginDate" value="<%=beginDate%>">	
			<input type="hidden" name="endDate" value="<%=endDate%>">	
			<input type="submit" value="보기설정">	
		</form>		
	<!-- 페이지당 볼 행 설정 폼 끝 -->		
		<table>
			<thead>
				<tr>
					<th>책번호</th>
					<th>책 카테고리</th>
					<th>출판사</th>
					<th>책이름</th>
					<th>저자</th>
					<th>가격</th>
					<th>재고</th>
					<th>상태</th>
					<th>등록일짜</th>
				</tr>
			</thead>
<%
	for(int i=0; i<bookAndPublisherAndBookCodeListSize; i++){
		bookAndPublisherAndBookCode = bookAndPublisherAndBookCodeList.get(i);
%>
			<tbody>
				<tr>
					<td><%=bookAndPublisherAndBookCode.getBook().getBookNo() %></td>
					<td><%=bookAndPublisherAndBookCode.getBookCode().getBookCodeName() %></td>
					<td><%=bookAndPublisherAndBookCode.getPublisher().getPublisherName()%></td>
					<td><a href="<%=request.getContextPath() %>/book/bookView.jsp?bookNumber=<%=bookAndPublisherAndBookCode.getBook().getBookNo()%>"><%=bookAndPublisherAndBookCode.getBook().getBookName() %></a></td>
					<td><%=bookAndPublisherAndBookCode.getBook().getBookAuthor() %></td>
					<td><%=bookAndPublisherAndBookCode.getBook().getBookPrice() %></td>
					<td><%=bookAndPublisherAndBookCode.getBook().getBookAmount() %></td>
					<td><%=bookAndPublisherAndBookCode.getBook().getBookOut() %></td>
					<td><%=bookAndPublisherAndBookCode.getBook().getBookDate() %></td>
				</tr>
			</tbody>
<%
	}
%>							
		</table>
		<!-- 검색폼 시작 -->
		<form action="<%=request.getContextPath() %>/book/bookList.jsp" method="post" id="searchForm">
			<label for="beginDate">검색시작날짜</label>
<%
	if(beginDate.equals("")){
%>
			<input type="date" name="beginDate" id="beginDate">
<%		
	}else{
%>
			<input type="date" name="beginDate" id="beginDate" value="<%=beginDate%>">
<%		
	}
%>		
			<label for="beginDate">검색종료날짜</label>
<%
	if(beginDate.equals("")){
%>			
			<input type="date" name="endDate" id="endDate"><br>
<%		
	}else{
%>
			<input type="date" name="endDate" id="endDate" value="<%=endDate%>"><br>			
<%		
	}if(searchCategory.equals("")){
%>						
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="" selected>선택하세요</option>
				<option value="b.book_no">책번호</option>
				<option value="bc.bookcode_name">책 카테고리</option>
				<option value="p.publisher_name">출판사</option>
				<option value="b.book_name">책이름</option>
				<option value="b.book_author">저자</option>
				<option value="b.book_price">가격</option>
				<option value="b.book_out">상태</option>
			</select>
<%		
	}else if(searchCategory.equals("b.book_no")){		
%>			
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="">선택하세요</option>
				<option value="b.book_no" selected>책번호</option>
				<option value="bc.bookcode_name">책 카테고리</option>
				<option value="p.publisher_name">출판사</option>
				<option value="b.book_name">책이름</option>
				<option value="b.book_author">저자</option>
				<option value="b.book_price">가격</option>
				<option value="b.book_out">상태</option>
			</select>
<%
	}else if(searchCategory.equals("bc.bookcode_name")){		
		%>			
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="">선택하세요</option>
				<option value="b.book_no">책번호</option>
				<option value="bc.bookcode_name" selected>책 카테고리</option>
				<option value="p.publisher_name">출판사</option>
				<option value="b.book_name">책이름</option>
				<option value="b.book_author">저자</option>
				<option value="b.book_price">가격</option>
				<option value="b.book_out">상태</option>
			</select>
<%
	}else if(searchCategory.equals("p.publisher_name")){		
		%>			
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="">선택하세요</option>
				<option value="b.book_no">책번호</option>
				<option value="bc.bookcode_name">책 카테고리</option>
				<option value="p.publisher_name" selected>출판사</option>
				<option value="b.book_name">책이름</option>
				<option value="b.book_author">저자</option>
				<option value="b.book_price">가격</option>
				<option value="b.book_out">상태</option>
			</select>
<%
	}else if(searchCategory.equals("b.book_name")){		
		%>			
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="">선택하세요</option>
				<option value="b.book_no">책번호</option>
				<option value="bc.bookcode_name">책 카테고리</option>
				<option value="p.publisher_name">출판사</option>
				<option value="b.book_name" selected>책이름</option>
				<option value="b.book_author">저자</option>
				<option value="b.book_price">가격</option>
				<option value="b.book_out">상태</option>
			</select>
<%
	}else if(searchCategory.equals("b.book_author")){		
		%>			
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="">선택하세요</option>
				<option value="b.book_no">책번호</option>
				<option value="bc.bookcode_name">책 카테고리</option>
				<option value="p.publisher_name">출판사</option>
				<option value="b.book_name">책이름</option>
				<option value="b.book_author" selected>저자</option>
				<option value="b.book_price">가격</option>
				<option value="b.book_out">상태</option>
			</select>
<%
	}else if(searchCategory.equals("b.book_price")){		
		%>			
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="">선택하세요</option>
				<option value="b.book_no">책번호</option>
				<option value="bc.bookcode_name">책 카테고리</option>
				<option value="p.publisher_name">출판사</option>
				<option value="b.book_name">책이름</option>
				<option value="b.book_author">저자</option>
				<option value="b.book_price" selected>가격</option>
				<option value="b.book_out">상태</option>
			</select>
<%
	}else if(searchCategory.equals("b.book_out")){		
		%>			
			<label for="searchCategory">검색구분</label> 
			<select name="searchCategory" id="searchCategory">
				<option value="">선택하세요</option>
				<option value="b.book_no">책번호</option>
				<option value="bc.bookcode_name">책 카테고리</option>
				<option value="p.publisher_name">출판사</option>
				<option value="b.book_name">책이름</option>
				<option value="b.book_author">저자</option>
				<option value="b.book_price">가격</option>
				<option value="b.book_out" selected>상태</option>
			</select>
			<label for="searchKeyword">검색단어</label> 
<%
	}if(searchKeyword.equals("")){
%>
			<input type="text" id="searchKeyword" name="searchKeyword">
<%
	}else{
%>
			<input type="text" id="searchKeyword" name="searchKeyword" value="<%=searchKeyword%>">
<%		
	}
%>			

			<input type="hidden" name="pageRow" value="<%=pagePerRow%>">
			<input type="submit" value="검색">		
		</form>
		<!-- 검색폼 끝 -->
			<div>
<%
	if(currentPage !=0 && currentPage != 1){
%>
			<a href="<%=request.getContextPath() %>/book/bookList.jsp?currentPage=<%=currentPage-1 %>&pagePerRow=<%=pagePerRow%>&searchCategory=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>">이전</a>
<%
	}for(int p=1; p<=lastPage; p++){
%>		
			<a href="<%=request.getContextPath() %>/book/bookList.jsp?currentPage=<%=p%>&pagePerRow=<%=pagePerRow%>&searchCategory=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>"><%=p%></a>
<%		
	}if(currentPage < lastPage){
%>	
			<a href="<%=request.getContextPath() %>/book/bookList.jsp?currentPage=<%=currentPage+1 %>&pagePerRow=<%=pagePerRow%>&searchCategory=<%=searchCategory%>&searchKeyword=<%=searchKeyword%>&beginDate=<%=beginDate%>&endDate=<%=endDate%>">다음</a>
<%
	}
%>		
		</div>	
	</body>
</html>