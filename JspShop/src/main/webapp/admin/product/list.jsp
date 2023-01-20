<%@page import="com.jspshop.util.PageManager"%>
<%@page import="com.jspshop.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.jspshop.mybatis.MybatisConfig"%>
<%@page import="com.jspshop.repository.ProductDAO"%>
<%@page import="com.jspshop.domain.Admin"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%!
	MybatisConfig mybatisConfig = MybatisConfig.getInstance();
	ProductDAO productDAO=new ProductDAO();
	PageManager pm=new PageManager();
%>
<%
	SqlSession sqlSession = mybatisConfig.getSqlSession();
	productDAO.setSqlSession(sqlSession);
	
	List<Product> productList=productDAO.selectAll();
	pm.init(productList, request);//페이징 계산 맡기기
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
						<div class="card">
						    <div class="card-header">
						        <h3 class="card-title">Responsive Hover Table</h3>
						
						        <div class="card-tools">
						            <div class="input-group input-group-sm" style="width: 150px;">
						                <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
						
						                <div class="input-group-append">
						                    <button type="submit" class="btn btn-default">
						                        <i class="fas fa-search"></i>
						                    </button>
						                </div>
						            </div>
						        </div>
						    </div>
						    <!-- /.card-header -->
						    <div class="card-body table-responsive p-0">
						        <table class="table table-hover text-nowrap">
						            <thead>
						                <tr>
						                    <th>No</th>
						                    <th>카테고리</th>
						                    <th>상품명</th>
						                    <th>브랜드</th>
						                    <th>가격</th>
						                    <th>할인가</th>
						                </tr>
						            </thead>
						            <tbody>
						                <tr>
						                    <td>183</td>
						                    <td>John Doe</td>
						                    <td>11-7-2014</td>
						                    <td><span class="tag tag-success">Approved</span></td>
						                    <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
						                </tr>
						            </tbody>
						        </table>
						    </div>
						    <!-- /.card-body -->
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

</body>
</html>









