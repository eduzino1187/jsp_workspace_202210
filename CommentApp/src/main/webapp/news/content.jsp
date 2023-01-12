<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/header_link.jsp"%>
<script type="text/javascript">
$(function(){
	$($("button")[0]).click(function(){ //등록버튼
		$("#form1").attr({
			"action":"/news/regist", 
			"method":"post"
		});
		$("#form1").submit();
	});	
	
	$($("button")[1]).click(function(){//목록버튼
		$(location).attr("href","/news/list.jsp");
	});
});
</script>
</head>
<body>
	<div class="container mt-3 border">
		<h2 class="text-center">뉴스기사 등록</h2>
		<form id="form1">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter title" name="title">
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter title" name="writer">
			</div>
			
			<div class="form-group">
				<textarea class="form-control" placeholder="내용입력" name="content"></textarea>
			</div>
			
			<div class="form-group text-center">
				<button type="button" class="btn btn-secondary">등록</button>
				<button type="button" class="btn btn-secondary">목록</button>
			</div>
		</form>
		
		<form id="form2">
			<div class="form-group row">
				<div class="col-md-6">
					<input type="text" class="form-control" placeholder="Enter title" name="title">
				</div>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="Enter title" name="title">
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-secondary">등록</button>					
				</div>				
			</div>
		</form>	
			
		<table class="table">
		    <thead>
		      <tr>
		        <th>Firstname</th>
		        <th>Lastname</th>
		        <th>Email</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>John</td>
		        <td>Doe</td>
		        <td>john@example.com</td>
		      </tr>
		    </tbody>
		</table>			
	</div>
</body>
</html>



