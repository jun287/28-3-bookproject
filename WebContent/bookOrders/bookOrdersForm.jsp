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
	int ordersAmount = Integer.parseInt(request.getParameter("amount"));				// ������ �޾ƿ��� �ڵ� */
	
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
	String recentAddress = null;												// �ֱٹ���� �޾ƿ��� ����
	int savePoint = price*5/100;
	int ordersPrice = price-usePoint;
%>	
	<form action="<%=request.getContextPath()%>/bookOrders/bookOrdersAction.jsp" method="post">
		<%-- <input type="hidden" name="ordersPrice" value="<%=(ordersPrice-usePoint)%>">
		<input type="hidden" name="bookNumber" value="<%=bookNumber%>">
		<input type="hidden" name="ordersAmount" value="<%=ordersAmount%>"> --%>
		<table>
			<tr>
				<th>�ֹ����̸�</th>
				<td>ȫ�浿</td>
			</tr>
			<tr>
				<th>����ּ�</th>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp">�����ּ�</a></td>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=1&usePoint=<%=usePoint%>">���ο��ּ�</a></td>
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=2&usePoint=<%=usePoint%>">�ֱٹ����</a></td>
			</tr>
			<tr>
<%
			if(addressCheck==0){				// �����ּҸ� ����������
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress" value="�����ּ�ǥ�ÿ���" readonly="readonly"></td>
<%
			}else if(addressCheck==1){								// ���ο��ּҸ� ����������
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress"></td>
<%
			}else{
				if(recentAddress == null){
%>
				<td colspan="3" align="center">�ֱٹ������ �����ϴ�</td>
<%					
				}else{
%>
				<td colspan="3" align="center"><input type="text" name="ordersAddress" value="<%=recentAddress%>" readonly="readonly"></td>
<%
				}
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
		<button>�ֹ��ϱ�</button>
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
				<td><input type="text" name="usePoint" value="<%=usePoint%>"> <button type="submit">����</button></td>
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
				<td><%= ordersPrice %></td>
			</tr>
		</table>
		<div>
			å ���Ž� ��������Ʈ : <%=price*5/100 %>�� ���� <br>
			å �����ۼ��� ��������Ʈ : <%=price*1/100 %>�� ����
		</div>
	</body>
</html>