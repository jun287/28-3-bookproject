<!-- 18.7.18 ������ : bookOrdersForm.jsp -->
<!-- ��ǰ �ֹ��ϴ� ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
<%
	/* if(session.getAttribute("sessionId")==null){		// �α����� �Ǿ��ִ��� Ȯ���Ͽ� �α����� �ȵǾ������� �α����������� �̵�
		response.sendRedirect(request.getContextPath() + "/member/memberLoginForm.jsp" );
	}
	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));		// book_no�� �޾ƿ��� �ڵ�
	int memberNumber = Integer.parseInt(request.getParameter("memberNumber"));	// member_no�� �޾ƿ��� �ڵ�
	int amount = Integer.parseInt(request.getParameter("amount"));				// ������ �޾ƿ��� �ڵ�
	 */
	int price = 50000;															// ��ǰ�ݾ�(�ӽ�)
	int memberPoint = 20000;													// ȸ���� ����Ʈ�� �޾ƿ��� ����
	int usePoint = 0;															// ����Ʈ ���ݾ��� �޾ƿ��� ����
	if(request.getParameter("usePoint")!=null){									// ����Ʈ ���ݾ��� ���� ���
		if(Integer.parseInt(request.getParameter("usePoint"))<=memberPoint){	// �Է��� ���� �� ����Ʈ�� ������ ���ų� ���� ��쿡��
			usePoint = Integer.parseInt(request.getParameter("usePoint"));		// usePoint ������ �޾ƿ� �� �Է�
		}
	}
	int addressCheck = 0;														// �����ּ�����, ���ο� �ּ����� ����Ȯ������ ���� ����
	 if(request.getParameter("addressCheck")!=null){							// addressCheck�� �޾ƿ��� ���� ������
		 addressCheck = Integer.parseInt(request.getParameter("addressCheck"));	// ���ο� �ּҸ� ������ ���� addressCheck������ ����
	 }
	out.println(usePoint);
%>	
	<form>
		<table>
			<tr>
				<th>�ֹ����̸�</th>
				<td>ȫ�浿</td>
			</tr>
			<tr>
				<th>����ּ�</th>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp">�����ּ�</a></td>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=1&usePoint=<%=usePoint%>">���ο��ּ�</a></td>
			</tr>
			<tr>
<%
			if(addressCheck==0){				// �����ּҸ� ����������
%>
				<td colspan="3" align="center">�����ּ�ǥ�ÿ���</td>
<%
			}else{								// ���ο��ּҸ� ����������
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress"></td>
<%
			}
%>
				</tr>
		</table>
		<table>
			<tr>
				<th>��ǰ��</th>
				<td>��ǰ�� �޾ƿ°� �Է�</td>
			</tr>
			<tr>
				<th>����</th>
				<td>���� �޾ƿ°� �Է�</td>
			</tr>
		</table>
	</form>
	<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp" method="post">
		<input type="hidden" name="addressCheck" value="<%=addressCheck %>">
		<table>
			<tr>
				<th>���� ����Ʈ</th>
				<td><%=memberPoint %></td>
			</tr>
			<tr>
				<th>��� ����Ʈ</th>
				<td><input type="text" name="usePoint" value="0"> <button type="submit">����</button></td>
			</tr>
		</table>
	</form>
		<table>
			<tr>
				<th>�ݾ�</th>
				<td><%=price %></td>
			</tr>
			<tr>
				<th>����(����Ʈ���)</th>
				<td><%=usePoint %></td>
			</tr>
			<tr>
				<th>�� �ݾ�</th>
				<td><%= (price-usePoint) %></td>
			</tr>
		</table>
	</body>
</html>