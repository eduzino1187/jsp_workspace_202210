<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%	
	String savePath="C:/jsp_workspace/GalleryProject/src/main/webapp/data/";
	int maxSize=1024*1024*5;
	
	MultipartRequest multi=new MultipartRequest(request, savePath, maxSize,"utf-8");

	//기존 파일을 지운다.
	File oriFile = new File(savePath+multi.getParameter("filename"));
	if(oriFile.delete()){
		
	};
	
%>