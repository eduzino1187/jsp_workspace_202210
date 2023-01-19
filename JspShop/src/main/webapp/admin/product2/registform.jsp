<%@page import="com.jspshop.domain.Admin"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>
<%@ include file="/admin/inc/header_link.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Preloader -->
		<%@ include file="/admin/inc/preloader.jsp" %>
		
		<!-- Navbar -->
		<%@ include file="/admin/inc/navbar.jsp" %>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="/admin/inc/sidebar_left.jsp" %>
		
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="col">
						
						<div class="form-group">
	                    	<select class="form-control">
	                    		<option value="0">카테고리 선택</option>
	                    	</select>
	                  	</div>
						<div class="form-group">
	                    	<input type="email" class="form-control" placeholder="상품명">
	                  	</div>
						<div class="form-group">
	                    	<input type="email" class="form-control" placeholder="브랜드">
	                  	</div>
						<div class="form-group">
	                    	<input type="number" class="form-control" placeholder="가격">
	                  	</div>
						<div class="form-group">
	                    	<input type="number" class="form-control" placeholder="할인가">
	                  	</div>
						<div class="form-group">
	                    	<textarea id="detail" class="form-control" ></textarea>
	                  	</div>
	                  	
                        <div class="form-group">
	                        <div class="custom-file">
	                            <!--파일박스는 실제 보여지지 않음 -->
	                            <input type="file" class="custom-file-input" id="file" multiple>
	                            
	                            <!--아래의 라벨은 파일박스처럼 생김 -->
	                            <!-- <label class="custom-file-label" for="exampleInputFile">Choose file</label> -->
	                        </div>
	                        <span class="btn btn-success col-12 fileinput-button" onClick="triggerFile()">
	                            <i class="fas fa-plus"></i>
	                            <span>Add files</span>
	                        </span>
                        </div>

	                  	<div class="row form-group" id="preview">
	                  		미리보기 영역
	                  	</div>
                        
						<div class="form-group">
	                    	<button type="button" class="btn btn-primary">등록</button>
	                  	</div>
	                  	
					</div>					
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<%@ include file="/admin/inc/footer.jsp" %>		

		<!-- Control Sidebar -->
		<%@ include file="/admin/inc/sidebar_right.jsp" %>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<%@ include file="/admin/inc/footer_link.jsp" %>
	<script type="text/babel">
		function ImageBox(props){
			return (
				<div className={"col-sm-2 border"}>
					<div>
						<a href="#" onClick={(e)=>removeImg(e, props.index)}>X</a>
					</div>					
					<img src={props.src} width="100px" />	
				</div>
			);
		}
	</script>
	
	<script type="text/babel">
		let tag=[];
		let previewRoot;
		let fileList=[];

		function removeImg(a, index){
			console.log(a, index);
			fileList.splice(index, 1);

			$(a.target).parent().parent().remove();

		}

		//사용자가 선택한 파일들을 매개변수로 받자!
		function previewImg(){
			
			for(let i=0;i<fileList.length;i++){
				let reader = new FileReader();
				
				reader.onload=function(e){ //파일이 읽혀지면..
					//e에는 읽은 파일에 대한 정보가 들어있다...
					tag.push( <ImageBox key={i} src={e.target.result} index={i} />);
				
					if(tag.length >= fileList.length){
						previewRoot.render(tag);		
					}
					
				};
				reader.readAsDataURL( fileList[i]);//읽을 대상 파일
			}			
		}
		
		$(function(){
			previewRoot = ReactDOM.createRoot(document.getElementById("preview"));
			
			$("#detail").summernote({
				height:200
			});
			
			$("#file").change(function(){
				this.files; //파일컴포넌트에서 선택한 파일의 보유한 배열 
							//이 배열은 read only
				console.log("당신이 선택한 파일 수는 ", this.files.length);

				for(let i=0;i<this.files.length;i++){
					fileList.push(this.files[i]);
				}

				previewImg();
			});
		});
		
		function triggerFile(){
			$("#file").trigger("click");
		}
		
	</script>
</body>
</html>









