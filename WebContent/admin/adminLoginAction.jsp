<!-- 2018. 07. 19 공세준  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "dto.bookshop.project.Admin" %>
<%@ page import = "service.bookshop.project.ServiceAdmin" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>adminLoginAction</title>
	</head>
	<body>
		<%
			String adminId = request.getParameter("adminId");
			String adminPw = request.getParameter("adminPw");
			
			ServiceAdmin serviceAdmin = new ServiceAdmin();
			
			Admin admin = serviceAdmin.loginAdmin(adminId, adminPw);
			
			if(admin != null){
				session.setAttribute("sessionAdminId", admin.getAdminId());
				session.setAttribute("sessionAdminName", admin.getAdminName());
				session.setAttribute("sessionAdminNo", admin.getAdminNo());
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}else {
				response.sendRedirect(request.getContextPath()+"/member/memberLoginForm.jsp");
			}
			
		%>
	</body>
</html>