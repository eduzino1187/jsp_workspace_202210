<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#map{
	width:100%;
	height:100%;
}
</style>
<script type="text/javascript">
//맛집의 카테고리 가져오기 (비동기 방식으로 데이터만 백그라운드로 가져오기)
function getCategoryList(){
	let xhttp=new XMLHttpRequest(); //ajax의 비동기 통신 객체 
	xhttp.open("GET", "/store/category_list.jsp");
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			
			//문자열에 불과한 데이터를, 파싱하여 실제 JSON 내장객체로 변환
			let json=JSON.parse(this.responseText);
			console.log(json.name, json.price);			
		}	
	}
	
	xhttp.send();//호스팅 환경인 크롬브라우저가 요청 출발!!
}

function loadMap(){
	var mapProp= {
		center:new google.maps.LatLng(51.508742,-0.120850),
		zoom:5,
	};
	var map = new google.maps.Map(document.getElementById("map"),mapProp);
}

$(function(){
	$("#bt_regist").click(function(){
		alert();
	});	
	
	getCategoryList();
});

</script>
</head>
<body>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-2 border">
				<div class="form-group mt-2">
					<input class="form-control" placeholder="위도">
				</div>
				<div class="form-group mt-2">
					<input class="form-control" placeholder="경도">
				</div>
				<div class="form-group mt-2">
					<select class="form-control" id="category">
						<option>선택하세요</option>
					</select>
				</div>
				<div class="form-group mt-2">
					<input class="form-control" placeholder="상호명">
				</div>
				<div class="form-group mt-2">
					<button id="bt_regist" type="button" class="form-control">맛집등록</button>
				</div>
				<!-- 맛집 목록  -->
				<div style="overflow:scroll">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th>상호명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>John</td>
							</tr>
						</tbody>
					</table>					
				</div>
			</div>
			<div class="col-md-10 border">
				<div id="map"></div>
			</div>
		</div>
	</div>
</body>
</html>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvMU0cLUh7RzN2dNM0Cm85NNPvgPryMY8&callback=loadMap"></script>



