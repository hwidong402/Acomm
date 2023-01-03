<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커에 인포윈도우 등록하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4611b2688b283a9862933471078a1361"></script>
<script>
var key="0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";//인증키
var bstopid="";
$(function() {
	// JSON으로 만들 리스트 생성
	var incontent="";
	var testList = new Array() ;
	// 모델로 받은 list에서 객체 꺼내서 변환용 array에 넣기
	<c:forEach var="dto" items="${list}">
		// 객체 생성
		var data = new Object() ;
		 data.content ="<div>${dto.stop_name}</div>";
		 //정류소id
		 data.id =${dto.stop_id};
		 //정류소 kakaomap용 좌표
		 data.latlng  = new kakao.maps.LatLng(${dto.stop_lat},${dto.stop_lon});
		//객체 넣기
		 testList.push(data);
		</c:forEach>
	// String 형태로 변환
	var jsonData = JSON.stringify(testList) ;
	//접속된 아이디의 apt 좌표
	var lat=${lat};	
	var lon=${lon};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 켜져있는 infowindow를 저장하기 위한 객체
var selectedinfowindow="";
for (var i = 0; i < testList.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        title:testList[i].id,// 실시간 버스 시간 검색에 사용할 id값 불러오는 용
    	map: map, // 마커를 표시할 지도
        position: testList[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
 var infowindow = new kakao.maps.InfoWindow({
        content: testList[i].content, // 인포윈도우에 표시할 내용
  		removable :true
 });
  	
    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow ) );
}
function makeClickListener(map, marker, infowindow ) {
    return function() {
    	var stopname= infowindow.getContent();
    	bstopid=marker.getTitle();
    	infowindow.setContent("");
    	$.ajax({
			url : "http://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey="+key+"&bstopid="+bstopid,
					success : function(x) {
				var title = stopname+"<br><button id=upstop>즐겨찾기 등록</button>";
				var table = "<table class="+"table table-dark table-striped"+"><tr><td>버스번호</td><td>남은 시간</td><td>남은 정류장</td></tr>"; // table 만드는 기능
				$(x).find("item").each(function () {
					var no=$(this).find("lineno").text();
					var min=$(this).find("min1").text();
					var station=$(this).find("station1").text();
					var info = "<tr><td>"+no+"</td><td>"+min+"</td><td>"+station+"</td></tr>"; //table 항목 추가하기
					table+=info;
				})
				table+="</table>";
					infowindow.setContent(title+table);
			}
		  })
        infowindow.open(map, marker);
    	
    };
}

});
</script>
    
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
</body>
</html>