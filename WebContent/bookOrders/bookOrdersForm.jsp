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
	int addressCheck = 0;														// �����ּ�����, ���ο� �ּ����� ����Ȯ������ ���� ����
	 if(request.getParameter("addressCheck")!=null){							// addressCheck�� �޾ƿ��� ���� ������
		 addressCheck = Integer.parseInt(request.getParameter("addressCheck"));	// ���ο� �ּҸ� ������ ���� addressCheck������ ����
	 }
	
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
				<td><a href="<%=request.getContextPath()%>/bookOrders/bookOrdersForm.jsp?addressCheck=1">���ο��ּ�</a></td>
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
	</form>
	</body>
</html>