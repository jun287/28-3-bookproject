<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bookInsertForm</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/book/bookInsertAction.jsp" method="post">
		<table>
			<tr>
				<td>책이름</td>
				<td><input type="text" name="book_name"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="book_author"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="book_price"></td>
			</tr>
			<tr>
				<td>포인트</td>
				<td><input type="text" name="book_point"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="book_amount"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><select>
  					<option value="한국">한국</option>
 			 		<option value="스마트">스마트</option>
 					<option value="정보">정보</option>	
		    	</select></td>
		   	</tr>
		    <tr>	
		    	<td>카테고리</td>
				<td><select>
  					<option value="축구">축구</option>
 			 		<option value="야구">야구</option>
 					<option value="농구">농구</option>	
		    	</select></td>
		    </tr>
		</table>
		<input type="submit" value="등록">
	</form>
</body>
</html>