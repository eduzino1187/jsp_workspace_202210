<%@page import="gallery.domain.Gallery"%>
<%@page import="gallery.repository.GalleryDAO"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	GalleryDAO galleryDAO=new GalleryDAO();
%>
<%
	String gallery_idx = request.getParameter("gallery_idx");
	Gallery gallery=galleryDAO.select(Integer.parseInt(gallery_idx));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function edit(){
	$("form").attr("method","post");
	
	if( $("input[type='file']").val().length >0){ //파일업로드
		$("form").attr("action","/gallery/edit_file.jsp");
		$("form").attr("enctype","multipart/form-data");
	}else{
		$("form").attr("action","/gallery/edit.jsp");
	}
	$("form").submit();
}

$(function(){
	$($("input[type='button']")[0]).click(function(){
		edit();
	});
	
	$($("input[type='button']")[1]).click(function(){
		
	});
	
});
</script>

</head>
<body bgcolor="yellow">
	<form>
		<input name="gallery_idx" value="<%=gallery.getGallery_idx()%>">
		<input name="filename" value="<%=gallery.getFilename()%>">
		<table>
			<tr>
				<td>
					<input type="text" placeholder="제목입렵" name="title" value="<%=gallery.getTitle()%>">
				</td>	
			</tr>
			<tr>
				<td>
					<input type="text" placeholder="작성자 입력" name="writer" value="<%=gallery.getWriter()%>">
				</td>	
			</tr>
			<tr>
				<td>
					<textarea placeholder="내용입력" name="content"><%=gallery.getContent() %></textarea>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="file" name="file">
				</td>	
			</tr>
			<tr>
				<td>
					<input type="button" value="등록">
					<input type="button" value="목록">
				</td>	
			</tr>
		</table>
	</form>

</body>
</html>

