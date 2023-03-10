<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${rest.rest_name}상세정보</title>
<!-- innerHead -->
<%@ include file="../common/innerHead.jsp" %>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- kakao map api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4611b2688b283a9862933471078a1361"></script>
<script>

$(function() {
 	//후기목록 들고오기
	$.ajax({
		url : "list.reply",
		data : {rest_id : ${rest.rest_id }},
				success : function(x) {
				var sum = 0;
				if(x.length>0){
			for (var i = 0; i <x.length; i++) {
				sum+= x[i].rere_score;	// 작성한 평점
			}
			$('#score').html("전체평점:"+(sum/x.length).toFixed(2)+"/5");
				}//if end
		} 
		//success end
	  }) 
	  //list.reply ajax end
	  //나의 후기 검색
		 $.ajax({
			url:"myreviewone.reply",
			data:{ rest_id:${rest.rest_id }},
			success : function(x){
				console.log(x.length);
				if(x.length>5){
				$('#myreply').html(x);
			}// if end
			}// success end
		})// myreview ajax end
	  //긍정후기 
	   $.ajax({
			url:"posreview.reply",
			data:{rest_id : ${rest.rest_id }},
			success : function(x){
				if(x.length>15){
				$('#posreply').html(x);
				}//if end
			}//success end
		})//긍정 리뷰 ajax end
		//부정후기
		 $.ajax({
				url:"negreview.reply",
				data:{rest_id : ${rest.rest_id }},
				success : function(x){
					if(x.length>15){
					$('#negreply').html(x);
					}//if end
				}//success end
			})//부정 리뷰ajax end
			
	var lat=${rest.rest_lat}+"";
	var lon=${rest.rest_lon}+"";
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(lat, lon); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
})
//document end


</script>
</head>
<body>
	<!-- 네비게이션 --> 
	<%@ include file="../common/navbar.jsp" %>
	<!-- main -->
 	<main class="container">
	
		<div style="text-align: center;">
			<h2 id="restlavel">${rest.rest_name}</h2>
			<div id="score"></div>
			<br>
		</div>
		<!-- 나의 후기 --> 
		<div id="reply" style="text-align: center;">
			<h3 style="background:#0DCAF0">후기</h3>
			<div id= "myreply">
				나의 후기가 없습니다.<a href="replywrite.rest?rest_id=${rest.rest_id}"><button class="btn btn-success">후기작성</button></a>
			</div>
		</div>
		<br>
		
		<!-- 긍부정 -->
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-2 g-3" style="text-align: center;">
			<div>
				<div style="background: #44f028">
					<h4>긍정적인 후기</h4>
				</div>
				<div id="posreply">
					긍정적 후기가 없습니다.
				</div>
			</div>	
			<div>
				<div style="background: #ff4500">
					<h4>부정적인 후기</h4>
				</div>
				<div id="negreply">
					부정적 후기가 없습니다.
				</div>
			</div>
		</div>
		
		<br>
		<!-- 지도  -->
		<div id="map" style="width:100%;height:350px;"></div>
		
	</main>
	 <!-- footer -->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>