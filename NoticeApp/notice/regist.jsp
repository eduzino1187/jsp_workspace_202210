<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.edu.noticeapp.repository.NoticeDAO"%>
<%@ page import="com.edu.noticeapp.domain.Notice"%>
<%!
	NoticeDAO noticeDAO=new NoticeDAO();
%>
<%
	//스크립틀릿은 요청이 들어올때마다 실행되는 영역\
	Notice notice = new Notice();
	request.setCharacterEncoding("utf-8");

	notice.setTitle(request.getParameter("title"));
	notice.setWriter(request.getParameter("writer"));
	notice.setContent(request.getParameter("content"));

	int result = noticeDAO.insert(notice);
	out.print("result is "+result);

	//목록 페이지 나오게...
if(result>0){
%>
<script>
	alert("등록완료");
	location.href="/notice/list.jsp";
</script>
<%}else{%>
<script>
	alert("등록실패");
	history.back();
</script>
<%}%>