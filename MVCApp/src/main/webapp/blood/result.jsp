<%@page import="mvc.model.blood.BloodAdvisor"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	혈액형에 대한 판단 결과 :  
	<p>
	<%=msg %>
	
</body>
</html>





