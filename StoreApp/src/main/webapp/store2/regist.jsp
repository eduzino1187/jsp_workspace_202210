<%@ page contentType="text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String lati=request.getParameter("lati");
	String longi=request.getParameter("longi");
	String category_idx=request.getParameter("category_idx");
	String store_name=request.getParameter("store_name");
	
	System.out.print(lati+"<br>");
	System.out.print(longi+"<br>");
	System.out.print(category_idx+"<br>");
	System.out.print(store_name+"<br>");
	
	
	
%>