<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="news.util.PageManager"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%! PageManager pm=new PageManager(); %>
<%
	List newsList=new ArrayList();
	newsList.add("사과");
	newsList.add("딸기");
	newsList.add("바나나");
	newsList.add("포도");
	
	pm.init(newsList, request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/header_link.jsp"%>
</head>
<body>
	<div class="container">
		<table class="table mt-3 border table-hover">
			<thead class="thead-dark">
				<tr>
					<th width="5%">No</th>
					<th width="60%">뉴스제목</th>
					<th width="10%">작성자</th>
					<th width="10%">등록일</th>
					<th width="15%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<%
					int curPos=pm.getCurPos();
					int num=pm.getNum(); 				
				%>
				<%for(int i=1;i<=pm.getPageSize();i++){ %>
				<%if(num<1)break;%>
				<tr>
					<td><%=num-- %></td>
					<td>오늘은 날씨가 화창하겠습니다 [25] </td>
					<td>김어준</td>
					<td>john@example.com</td>
					<td>456</td>
				</tr>
				<%} %>
				<tr>
					<td colspan="5">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="javascript:void(0);">◀</a></li>
							<%for(int i=pm.getFirstPage();i<=pm.getLastPage();i++){ %>
								<%if(i>pm.getTotalPage())break; %>
								<li class="page-item active"><a class="page-link" href="javascript:void(0);"><%=i%></a></li>
							<%} %>
							<li class="page-item"><a class="page-link" href="javascript:void(0);">▶</a></li>
						</ul>					
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<button type="button" class="btn btn-secondary">글쓰기</button>			
					</td>
				</tr>
			</tbody>
		</table>
		
	</div>
</body>
</html>



