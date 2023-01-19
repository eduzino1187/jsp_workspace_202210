<%@page import="com.jspshop.domain.Admin"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String[] sizeList={"XS","S","M","L","XL","XXL"};
	String[] colorList={"베이지","네이비","브라운","블랙"};
%>
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
	                    	<select class="form-control" id="category"></select>
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
							<%for(int i=0;i<sizeList.length;i++){ %>
						    <div class="icheck-primary d-inline">
						        <input type="checkbox" id="checkboxPrimary<%=i%>" name="size" value="<%=sizeList[i]%>">
						        <label for="checkboxPrimary<%=i%>"><%=sizeList[i]%></label>
						    </div>
							<%} %>
	                  	</div>
	                  	
						<div class="form-group">
							<%for(int i=0;i<colorList.length;i++){ %>
						    <div class="icheck-primary d-inline">
						        <input type="checkbox" id="color<%=i%>" name="size" value="<%=colorList[i]%>">
						        <label for="color<%=i%>"><%=colorList[i]%></label>
						    </div>
							<%} %>
	                  	</div>
	                  	
						<div class="form-group">
	                    	<textarea id="detail" class="form-control" ></textarea>
	                  	</div>
						<div class="form-group">
	                    	<input type="file" class="form-control" multiple  id="file"/>
	                  	</div>
	                  	
	                  	<div class="row form-group" id="preview"></div>
	                  	
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
		let tag=[];   // <ImageBox/> UI 컴포넌트를 누적할 배열
		let previewRoot; //리엑트에 의해 렌더링될 컨테이너 요소		
		let fileList=[]; //파일정보를 가진 배열 
		let oriFiles; //원래 유저가 선택한 파일배열 원본

		function removeImg(e, index){
			//시각적인 삭제 처리
			$(e.target).parent().parent().remove();
			
			//원본 배열에서, 해당 파일을 추출한다
			let file=oriFiles[index];

			//추출한 파일이 삭제정보 배열에서 몇번째 index인지 조사한다
			let sel_index = fileList.indexOf(file); 

			fileList.splice( sel_index , 1);
		}

		function createCategoryOption(result){
			console.log(result);
			let op="<option value='0'>상품분류</option>";
			
			for(let i=0; i<result.length;i++){ //json 배열만큼 반복
				
				let category=result[i];//카테고리 하나 꺼내기
				op+="<option value='"+category.category_idx+"'>"+category.cateogry_name+"</option>";
			}
			$("#category").html(op);								
		}
		
		function getCategoryList(){
			$.ajax({
				url:"/admin/category/category_list.jsp",
				type:"GET",
				success:function(result, status, xhr){
					//옵션 채우기 
					createCategoryOption(result);
				}
			});					
		}
		
		//사용자가 선택한 파일들을 매개변수로 받자!
		function previewImg(){ //3개
			tag=[];

			for(let i=0;i<fileList.length;i++){
				let reader = new FileReader();
				
				reader.onload=function(e){ //파일이 읽혀지면..
					//e에는 읽은 파일에 대한 정보가 들어있다...
					tag.push( <ImageBox key={i} src={e.target.result} index={i}/>);

					if(i >= fileList.length-1){ //마지막 이미지에 도달하면...					
						previewRoot.render(tag);
					}

				};
				reader.readAsDataURL( fileList[i]);//읽을 대상 파일
			}			
		}
		
		$(function(){
			previewRoot = ReactDOM.createRoot(document.getElementById("preview"));
			getCategoryList();
			
			$("#detail").summernote({
				height:200
			});	
			
			$("#file").change(function(){
				//this.files; //파일컴포넌트에서 선택한 파일의 보유한 배열 
							//이 배열은 read only
				console.log("당신이 선택한 파일 수는 ", this.files.length);
				oriFiles=this.files;

				//this.files는 이미 자바스크립트의 파일배열로써, 읽기만 가능하다
				//따라서 수정가능한 배열이 되려면, this.files 안에 있는 File들을
				//꺼내서, 일반배열로 옮겨 버리면 된다..
 				for(let i=0;i<this.files.length;i++){
					fileList.push(this.files[i]);
				}
				previewImg();
			});
			
		});		
	</script>
</body>
</html>









