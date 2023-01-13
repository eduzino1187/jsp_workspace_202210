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
	xhttp.open("GET", "/store2/category_list.jsp");
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			
			//문자열에 불과한 데이터를, 파싱하여 실제 JSON 내장객체로 변환
			let jsonList=JSON.parse(this.responseText);
			//console.log(json.name, json.price);
			createOptionList(jsonList);
		}	
	}
	xhttp.send();//호스팅 환경인 크롬브라우저가 요청 출발!!
}


function createOptionList(categoryList){
	$("#category_idx").empty();
	
	console.log(categoryList.length);
	
	let op ="<option value='0'>선택하세요</option>";
	for(let i=0;i<categoryList.length;i++){
		let category = categoryList[i];
		
		//기존 옵션 다 지우고, 새로 넣기
		op+="<option value='"+category.category_idx+"'>"+category.category_name+"</option>";
	}
	$("#category_idx").html(op);
}

function getStoreList(map){
	
	for(let i=0;i<5;i++){
		var marker = new google.maps.Marker({
			  position:new google.maps.LatLng(51.3+i, -0.120850),
			  animation:google.maps.Animation.BOUNCE
		});
		marker.setMap(map);
	}
}

function regist(){
	let xhttp = new XMLHttpRequest();
	xhttp.open("POST", "/store2/regist.jsp");
	
	let data="lati="+$("input[name='lati']").val();
	data+="&longi="+$("input[name='longi']").val();
	data+="&category_idx="+$("select[name='category_idx']").val();
	data+="&store_name="+$("input[name='store_name']").val();
	
	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			alert(this.responseText);		
		}
	}
	xhttp.send(data);
}


function loadMap(){
	var mapProp= {
		center:new google.maps.LatLng(51.508742,-0.120850),
		zoom:5,
	};
	let map = new google.maps.Map(document.getElementById("map"),mapProp);
	
	getStoreList(map);
}

$(function(){
	$("#bt_regist").click(function(){
		regist();
	});	
	
	getCategoryList();
});

</script>
</head>
<body>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-2 border">
				
				<form id="form1">
					<div class="form-group mt-2">
						<input class="form-control" placeholder="위도" name="lati">
					</div>
					<div class="form-group mt-2">
						<input class="form-control" placeholder="경도" name="longi">
					</div>
					<div class="form-group mt-2">
						<select class="form-control" id="category_idx" name="category_idx">
							<option>선택하세요</option>
						</select>
					</div>
					<div class="form-group mt-2">
						<input class="form-control" placeholder="상호명" name="store_name">
					</div>
				</form>
				<div class="form-group mt-2">
					<button id="bt_regist" type="button" class="form-control">맛집등록</button>
				</div>
				<!-- 맛집 목록  -->
				<div class="row p-3" style="overflow:scroll">
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



