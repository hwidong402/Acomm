<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커에 인포윈도우 등록하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4611b2688b283a9862933471078a1361"></script>
<script>
//버스 시스템 인증키
var key="0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";
var bstopid="";
	function findcode() {
		upstop.onclick = function() {
			if (confirm("즐겨찾는 정류장을 등록하시겠습니까?")) {
				alert("등록 성공");
				return true;
			} else {
				alert("등록 취소");
				return false;
			}
		}
	}
$(function() {
	// JSON으로 만들 리스트 생성
	var incontent="";

	//접속된 아이디의 apt 좌표
	var lat=${apt.apt_lat};	
	var lon=${apt.apt_lon};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
$.ajax({
	url:"list.bus",
	success : function(x){
		
		
for (var i = 0; i < x.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        title:x[i].stop_id,// 실시간 버스 시간 검색에 사용할 id값 불러오는 용
    	map: map, // 마커를 표시할 지도
        position: new kakao.maps.LatLng(x[i].stop_lat,x[i].stop_lon) // 마커의 위치
    });
var icontent="<div>"+x[i].stop_name+"</div>"
    // 마커에 표시할 인포윈도우를 생성합니다 
 var infowindow = new kakao.maps.InfoWindow({
        content: icontent, // 인포윈도우에 표시할 내용
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
    	//클릭한 마커에 저장된 버스정류장 id 불러오기
    	bstopid=marker.getTitle();
    	//클릭한 정류장 이름 담는 변수
    	var stopname="";
    	//정류장 id로 이름 가져오는 ajax
    	$.ajax({
			url:"stopsearch.bus",
			data:{ stop_id:bstopid},
			success : function(x){
			stopname=x.stop_name;	
			}
		})
		
    	//버스 정류장 도착정보 불러오기
    	$.ajax({
			url : "http://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey="+key+"&bstopid="+bstopid,
					success : function(x) {
				var title = "<h3>"+stopname+"</h3>"+"<a href=upstop.bus?stop_id="+bstopid+" id='upstop'><button onclick='findcode()'>즐겨찾기 등록</button></a>";
				var table = "<table class="+"table table-dark table-striped"+"><tr><td style='width:80px;'>버스번호</td><td style='width:80px;'>남은 시간</td><td style='width:100px;'>남은 정류장</td></tr>"; // table 만드는 기능
				$(x).find("item").each(function () {
					var no=$(this).find("lineno").text();
					var min=$(this).find("min1").text();
					var station=$(this).find("station1").text();
					var info = "<tr><td>"+no+"</td><td>"+min+"</td><td>"+station+"</td></tr>"; //table 항목 추가하기
					table+=info;
				})
				table+="</table>";
				//클릭한 마커의 정류장 관련 정보를 인포윈도우에 담기 
					infowindow.setContent(title+table);
			}
		  })
		  //ㅈ
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