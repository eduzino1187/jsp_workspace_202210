<%@page import="com.mvc3.domain.Emp"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	List<Emp> empList = (List)request.getAttribute("empList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
			    <table class="table">
			        <thead class="thead-dark">
			            <tr>
			                <th></th>
			                <th>부서명</th>
			                <th>사원명</th>
			                <th>급여</th>
			            </tr>
			        </thead>
			        <tbody>
			        	<%for(Emp emp : empList){ %>
			            <tr>
			            	<td>
			            		<input type="checkbox" name="deptno" value="<%=emp.getEmpno()%>">
			            	</td>
			                <td><%=emp.getDept().getDname() %></td>
			                <td><%=emp.getEname() %></td>
			                <td><%=emp.getSal() %></td>
			            </tr>
						<%} %>
						<tr>
							<td colspan="4">
								<button type="button" class="btn btn-warning">Warning</button>	
							</td>
						</tr>
			        </tbody>
			    </table>
			
			</div>
		</div>
	</div>
</body>
</html>





