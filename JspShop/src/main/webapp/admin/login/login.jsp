<%@ page contentType="text/html;charset=UTF-8"%>
<%
	//로그인 폼으로부터 전송된 파라미터 받기 
	String admin_id = request.getParameter("admin_id");
	String admin_pass = request.getParameter("admin_pass");
	
	System.out.println(admin_id);	
	System.out.println(admin_pass);	
%>