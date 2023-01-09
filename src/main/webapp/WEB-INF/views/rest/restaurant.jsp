<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주변 상가 정보</title>
<!-- 상가 정보 띄우기용 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- kakao map api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4611b2688b283a9862933471078a1361"></script>
<script>

$(function() {
//상가 등록페이지 버튼 만들기

	if(${vo2.member_cls}==1){
		$('#insert').html("<a href=restwrite.rest?apt_lat=${vo.apt_lat}&apt_lon=${vo.apt_lon}><button>상가 등록</button></a>")
	}
	
	
//지도 만들기 상가표시
	//접속된 아이디의 apt 좌표
	var lat=${vo.apt_lat};	
	var lon=${vo.apt_lon};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
$.ajax({
	url:"list.rest",
	success : function(x){
		
		
for (var i = 0; i < x.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        title:x[i].rest_id,// 상가 검색에  사용할 id값 마커에 인자에 등록
    	map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(x[i].rest_lat,x[i].rest_lon) // 상가리스트의 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
 var infowindow = new kakao.maps.InfoWindow({
       
  		removable :true
 });
  	
    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow ) );
}//marker for문 end
	}//success end
})//list.bus ajax end
function makeClickListener(map, marker, infowindow ) {
    return function() {
    	// 레스토랑 이름 변수 
    	var restname="";
	restid=marker.getTitle();
	
	$.ajax({
		url:"search.rest",
		data:{ rest_id:restid},
		success : function(x){
		restname=x.rest_name;
	//인포윈도우에 추가할 내용	
var incontent="<div style='white-space: nowrap;'><h4>"+restname+"ㅣ - "+"</h4></div><a class=btn btn-primary data-bs-toggle=offcanvas href=#offcanvasExample role=button aria-controls=offcanvasExample> 더보기</a>"
    	infowindow.setContent(incontent);
		//더보기 클릭시 정보창 제목 변경
		$('#offcanvasExampleLabel').html(restname);
		}
	})	

//상세정보 띄우기 버튼 
  
        infowindow.open(map, marker);
    
    }//return function end
}// make ClickListener end

})
</script>
    
</head>
<body>
<div id="insert"></div>
<div id="map" style="width:100%;height:800px;"></div>
<!-- <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
  Button with data-bs-target
</button> -->

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel">제목</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body" id="restinfo" style="overflow:auto">
    <div>
      Some text as placeholder. In real life you can have the elements you have chosen. Like, text, images, lists, etc.
    </div>
    <div class="dropdown mt-3">
      <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
        Dropdown button
      </button>
      <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">Action</a></li>
        <li><a class="dropdown-item" href="#">Another action</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>