<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4611b2688b283a9862933471078a1361"></script>
<script>
var key="0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";//인증키
var bstopid="";
$(function() {
	// JSON으로 만들 리스트 생성

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
        title:x[i].rest_id,// 실시간 버스 시간 검색에 사용할 id값 불러오는 용
    	map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(x[i].rest_lat,x[i].rest_lon) // 마커의 위치
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
    	var restname
  /*   	restid=marker.getTitle();
    	var stopname
    	$.ajax({
			url:"search.rest",
			data:{ rest_id:restid},
			success : function(x){
			restname=x.rest_name;	
			}
		}) */
		
    	
        infowindow.open(map, marker);
    	
    };
}
/* $('#upstop').click(function () {
	$.ajax({
		url:"upstop.bus",
		data: {
			stop_id : bstopid
		},
		success: function(x) {
			
		}
	})
}) */
})
</script>
    
</head>
<body>
<div id="map" style="width:100%;height:800px;"></div>
</body>
</html>