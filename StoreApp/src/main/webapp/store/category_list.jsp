<%@page import="java.util.List"%>
<%@page import="store.repository.CategoryDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%!
	CategoryDAO categoryDAO = new CategoryDAO();
%>
<%
	//비동기로 요청을 시도하는 클라이언트를 위해, html 문서 전체를 
	//응답할 필요없고, 클라이언트가 원하는 데이터만 골라서 보내주면 된다.
	//왜? 클라이언트는 화면 전체를 원하지 않는다...
	List categoryList=categoryDAO.selectAll();
	//ut.print(categoryList);
	
	//쌩고생 스타일 
	//개발자가  json 문자열을 직접 처리 

	//java는 json표기를 이해할 수 없으므로, 문자열 취급하여
	//전송해보자 
	StringBuilder sb = new StringBuilder();
	sb.append("{");
	sb.append("\"name\":\"zino\",");
	sb.append("\"price\":100");
	sb.append("}	");
	
	out.print(sb.toString());		
%>








