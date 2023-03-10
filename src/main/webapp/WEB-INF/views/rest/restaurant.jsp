<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주변 상가 정보</title>
<style type="text/css">
.child-one{
position: relative;
bottom : 750px;
/* top: 50px; */ 
left:90%;
z-index: 3;
width : 10%;
}
</style>
<!-- Google tag (gtag.js) -->
<%@ include file="../common/innerHead.jsp" %>
<!-- jquery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- kakao map api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4611b2688b283a9862933471078a1361"></script>
<script>
//var selectedinfowindow="";
var restid="";
$(function() {
//상가 등록페이지 버튼 만들기

	
//지도 만들기 상가표시
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
	var onebutton = "<a href=restone.rest?rest_id="+restid+"><button class='btn btn-primary'>상세보기</button></a>";
	
	$('#restone').html(onebutton);
	$.ajax({
		url:"search.rest",
		data:{ rest_id:restid},
		success : function(x){
		restname=x.rest_name;
	//인포윈도우에 추가할 내용	
var incontent="<div style='white-space: nowrap;'><a class=btn btn-primary data-bs-toggle=offcanvas href=#offcanvasExample role=button aria-controls=offcanvasExample><h4>"+restname+"ㅣ - "+"</h4></a></div>"
    	infowindow.setContent(incontent);
		//더보기 클릭시 정보창 제목 변경
		$('#offcanvasExampleLabel').html(restname);
		}
	});	
	//좌측 뷰 내용 초기화 및 평점
	$.ajax({
		url : "list.reply",
		data : {rest_id:restid},
				success : function(x) {
					$('#avescore').html("");
					$('#myreply').html("나의 후기가 없습니다."+"<a href=replywrite2.rest?rest_id="+restid+"><button class='btn btn-success'>후기작성</button></a>");
					$('#replylist').html("다른 사람들의 후기가 없습니다.");
				//var other=false;
				var sumscore=0;
				var review="<table class=table><tr><td colspan='4'>후기</td></tr>";
			for (var i = 0; i <x.length; i++) {
				sumscore+=x[i].rere_score;
				/* var writer=	x[i].rere_writer;//작성자 닉네임		
				var aptcode= x[i].apt_code;//작성자 apt 코드		
				var membercode= x[i].member_code;// 작성자 멤버 코드		
				var rerecontent= x[i].rere_content;//작성한 내용
				var rerescore= x[i].rere_score;	// 작성한 평점 */
				 /* if(${member_code }==membercode){
				var myreview = "<table class=table><tr><td colspan='4'>나의 후기</td></tr><tr><td colspan='2'>"+writer+"</td><td>"+rerescore+"</td><td><button>리뷰삭제</button></td></tr><tr><td colspan='4'>"+rerecontent+"</td></tr></table>";
					$('#myreply').html(myreview);
				}else{
					other=true;
					review += "<tr><td colspan='2'>"+writer+"</td><td>평점</td><td>"+rerescore+"</td></tr><tr><td colspan='4'>"+rerecontent+"</td></tr>";
				}//else end */
				}//for end
					/* review+="</table>";
					if(other){
					$('#replylist').html(review);
				}  */
					if(x.length!=0){
						$('#avescore').html("전체평점:"+(sumscore/x.length).toFixed(2)+"/5");
					}
		}//success end
	  })//ajax end
	  
	  $.ajax({
	url:"myreview.reply",
	data:{ rest_id:restid},
	success : function(x){
		console.log(x.length);
		if(x.length>5){
		$('#myreply').html(x);
		//내 리뷰의 삭제 버튼 기능 등록하기
		$(function() {
			$('#delete').click(function() {
			var	rereid=$('#delete').attr("name");
			console.log(rereid);
				$.ajax({
					url:"replydelete2.rest",
					data:{rere_id:rereid},
					success : function(x){
						//viewretry();
						$('#myreply').html("나의 후기가 없습니다."+"<a href=replywrite2.rest?rest_id="+restid+"><button class='btn btn-success'>후기작성</button></a>");
					}
				})//ajax end
			
			}) //click end
		})// new document end
	}// if end
	}// success end
})// myreview ajax end
	  //다른사람 리뷰 들고오기
	  $.ajax({
			url:"otherreview.reply",
			data:{rest_id : restid },
			success : function(x){
				if(x.length>15){
				$('#replylist').html(x);
				}//if end
			}//success end
		})//다른사람 리뷰 end	  
		//상세정보 띄우기 버튼 
       infowindow.open(map, marker);
	//	selectedinfowindow=infowindow;
    }//return function end
}// make ClickListener end
/* function makeClickListener2(selectedinfowindow) {
    return function() {
        selectedinfowindow.close();
    };
} */
//testbutton end
//상가등록 버튼 추가
if(${member.member_cls}==1){
	$('#insert').html("<a href=restwrite.rest><button class='btn btn-primary'>상가 등록</button></a>");
}
})//document end


    /* function viewretry() {
	$.ajax({
		url : "list.reply",
		data : {rest_id:restid},
				success : function(x) {
					$('#avescore').html("");
					$('#myreply').html("나의 후기가 없습니다."+"<a href=replywrite2.rest?rest_id="+restid+"><button>후기작성</button></a>");
					$('#replylist').html("다른 사람들의 후기가 없습니다.");
				var other=false;
				var sumscore1=0;
				var review="<table class=table><tr><td colspan='4'>후기</td></tr>";
			for (var i = 0; i <x.length; i++) {
				sumscore+=x[i].rere_score;
				}
					if(x.length!=0){
						$('#avescore').html("전체평점:"+(sumscore1/x.length).toFixed(2)+"/5");
					}
		}//success end
	  })//ajaxend
	  
	  $.ajax({
	url:"myreview.reply",
	data:{ rest_id:restid},
	success : function(x){
		
		if(x.length>5){
		$('#myreply').html(x);
		//내 리뷰의 삭제 버튼 기능 등록하기
		$(function() {
				$('#delete').click(function() {
					var	rereid=$('#delete').attr("name");
						$.ajax({
							url:"replydelete2.reply",
							data:{rere_id:rereid},
							success : function(x){
								viewretry();
							}//success end
						})	//inner ajax end
			})//click end
		})//document end
		
		}//	if end
	}//success end
})//ajax end
	  //다른사람 리뷰 들고오기
	  $.ajax({
			url:"otherreview.rest",
			data:{ rest_id:restid},
			success : function(x){
				if(x.length>15){
				$('#replylist').html(x);
				}//if end
			}//success end
		})
	} */
</script>
</head>
<body>
	<%@ include file="../common/navbar.jsp" %>
	<!-- main -->
	
	<main class="container">
		<div class="parent" >
			<div id="map" style="width:100%;height:800px; z-indx:1;"></div>
			<div id="insert" class="child-one"></div>
		</div>
		<!-- <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
		  Button with data-bs-target
		</button> -->
		
		<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
		  <div class="offcanvas-header">
		    <h5 class="offcanvas-title" id="offcanvasExampleLabel" style='font-weight:bolder;'>제목</h5>
		    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <div class="offcanvas-body" id="restinfo" style="overflow:auto">
		    <div>
		    <span id="avescore"></span>
		    <span id="restone"></span>
		    </div>
		    <br>
		    <div id="myreply" style='border: solid 1px;'></div>
		    <div id="replylist"></div>
		  </div>
		</div>
	</main>
	
	 <!-- footer -->
	 <%@ include file="../common/footer.jsp" %>
</body>
</html>