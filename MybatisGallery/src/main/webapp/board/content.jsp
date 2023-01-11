<%@page import="board.domain.Board"%>
<%@page import="board.repository.BoardDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	BoardDAO boardDAO = new BoardDAO();
%>
<%
	String board_idx = request.getParameter("board_idx");
	Board board=boardDAO.select(Integer.parseInt(board_idx));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<%@ include file="/inc/header_link.jsp"%>
<script type="text/javascript">
function regist(){
	$("#form1").attr({
		"action":"/board/regist", 
		"method":"post",
		//application/x-www-form-urlencoded 디폴트
		"enctype":"multipart/form-data"
	});		
	$("#form1").submit();
}

$(function(){
	ClassicEditor
		.create(document.querySelector("#content") )
		.catch( error => {
	       console.error( error );
	   } );	
	
	//버튼에 이벤트 연결 
	$($("button")[0]).click(function(){
		regist();
	});
	
	$($("button")[1]).click(function(){
		alert("목록보기");
	});
});
	
	
	
</script>

</head>
<body>
	
	<div class="container mt-2">
		<form id="form1">
			<div class="row text-center">
				<h3>글내용보기</h3>		
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" value="<%=board.getTitle() %>" name="title">		
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" value="<%=board.getWriter() %>" name="writer">		
			</div>
			<div class="row mt-2">
				<textarea style="width:100%;" id="content" name="content"><%=board.getContent()%></textarea>						
			</div>
			
			<div class="row mt-2">
				이미지 넣기
			</div>
			
			<div class="row mt-2">
				<input type="file" class="form-control" name="file">		
			</div>
			<div class="row mt-2">
				<div class="col text-center">
					<button class="btn btn-warning">글등록</button>		
					<button class="btn btn-warning">글목록</button>		
				</div>
			</div>
		</form>	
	</div>
	
</body>
</html>
