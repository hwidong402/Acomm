<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4611b2688b283a9862933471078a1361"></script>
<script>
var lat=${vo.apt_lat};
var lon=${vo.apt_lon};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//list 크기
//var length=${list.size()};

//불러온 리스트 항목 마다 위경도 마커 찍기
<c:forEach var="dto" items="${list}">
var lat3=${dto.stop_lat};
var lon3=${dto.stop_lon};
var markerPosition  = new kakao.maps.LatLng(lat3,lon3 ); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
	
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
  </c:forEach>
/* for (var i = 0; i < ${list.size()}; i++) {
var lat2=${list[i].stop_lat};
var lon2=${list[i].stop_lon};
// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(lat2,lon2 ); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
} */

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
<!-- list 불러오기 실험용 -->
 <%-- <table class="table">
<tr>
<th>정류소 id</th>
<th>정류소 이름</th>
<th>정류소 위도</th>
<th>정류소 경도</th>
</tr>
<c:forEach var="dto" items="${list}">
<tr>
<td>${dto.stop_id}</td>
<td>${dto.stop_name}</td>
<td>${dto.stop_lat}</td>
<td>${dto.stop_lon}</td>
</tr>
  </c:forEach>
</table>  --%>
</body>
</html>