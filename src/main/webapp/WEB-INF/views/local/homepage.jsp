<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Google tag (gtag.js) -->
<%@ include file="../common/innerHead.jsp" %>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BXH0MBY7NR');
</script>
<meta charset="UTF-8">
<title>${apt.apt_name}에오신것을환영합니다!</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	var key = "0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";//인증키
	var bstopid=${member.stop_id}+"";
	
	//정류장 즐겨찾기 미등록 id
	$(function() {
	if(bstopid==""){
		$('#bus').append(
		"<a href=busstopmap5.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button>즐겨찾는 정류장을 등록해주세요!</button></a>"
				);
	}//if null end
	else{
		//정류장 이름 불러오기
		$.ajax({
			url:"stopsearch.bus",
			data:{ stop_id:bstopid},
			success : function(x){
				$('#bus').append("<h3>"+x.stop_name+"</h3>");
			}
		})//정류장 정보 불러오는 ajax end
	// 실시간 버스 도착정보 ajax
		$.ajax({
					url : "http://apis.data.go.kr/6260000/BusanBIMS/stopArrByBstopid?serviceKey="
							+ key + "&bstopid="+bstopid,
					success : function(x) {
						var table = "<table class="+"table table-dark table-striped"+"><tr><td>버스번호</td><td>남은 시간</td><td>남은 정류장</td></tr>"; // table 만드는 기능
						$(x).find("item").each(
								function() {
									var no = $(this).find("lineno").text();
									var min = $(this).find("min1").text();
									var station = $(this).find("station1")
											.text();
									var info = "<tr><td>" + no + "</td><td>"
											+ min + "</td><td>" + station
											+ "</td></tr>"; //table 항목 추가하기
									table += info;
								})
						$('#bus').append(table + "</table>");//테이블 입력
				$('#bus').append(
						"<a href=busstopmap5.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button>즐겨찾는 정류장 변경하기</button></a>"
								);
					}
				})//도착정보 ajax end
	}//if notnull end
	})//document end
	
	/* function list5(){ */
	      $.ajax({
	         url : "bbsList5?bbs_cate=noti",
	         success : function(data) {
	            console.log(data)
	            $('#notiList').html(data);
	         }
	      });
	/* } */
</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="resources/css/style.css">
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
div{
/* border: 1px solid blue; */
}
* {
	/* text-align: center; /* 가로가운데 정렬 */
	vertical-align: middle; /* 세로가운데 정렬 */ */
}

#header {
	margin-top: 20px;
}

a {
	text-decoration: none;
	color: black;
}

li {
	margin: 20px;
}

#my_box, #apt_img, #apt_img_logo, #apt_name {
	display: inline-block;
	margin: 20px;
}
</style>
</head>
<body>
<!-- nav -->
<%@ include file="../common/navbar.jsp" %>
<div id="full" style="padding-left: 3%; padding-right: 3%"> <!-- 홈페이지 전체화면 -->
<div id="header"> <!-- 아파트이름 -->
	<h2 id="apt_name">${apt.apt_name}</h2>
</div> <!-- 아파트이름 -->
<div id=infobus" style="float: left; width: 20%">
<div id="content" style="width: 100%;"> <!-- 내정보 -->


<table id="my_box">
				<tr>
					<td colspan="2">
					<img src="resources/img/sim.jpg" class="circle">
					
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p style="font-size: 17px;">
							반갑습니다.${member.member_name}님<br> 내가 사는 곳이 중심이 되는 곳 A-Comm에
							오신 걸 환영합니다.
						</p>
					</td>
				</tr>
				<tr>
					<td>
					<c:choose>
							<c:when test="${member.member_cls==0}">
								<a href="myinfo"><button
										class="btn btn-outline-primary" style="width: 200px;">내정보</button></a>
							</c:when>
							<c:when test="${member.member_cls==1}">
								<a href="everyinfo"><button
										class="btn btn-outline-primary" style="width: 200px;">회원관리</button></a>
							</c:when>
					</c:choose>
						 <a href="m_logout"><button class="btn btn-outline-danger"
								style="width: 200px;">로그아웃</button></a></td>
				</tr>

			</table>
</div> <!-- 내정보 -->
<div id="buslogic" style="width: 100%;"> <!-- 버스정류장 -->
<!-- 도착정보 결과 -->
<div id="bus" style="width: 100%; height: 350px; overflow: auto;"></div>
</div> <!-- 버스정류장 -->
</div> <!-- infobus -->

<div id="noti" style="float: right; width: 70%;"> <!-- 공지사항 -->
<div class="position-relative text-center bg-light">
      <h3 class="fw-normal">바로 여기!</h3>
      <p class="lead fw-normal">당신이 보고있는 지금 이 자리에 광고하세요</p>
 	</div>
<div id="notiList"></div>

</div> <!-- 공지사항 -->

</div> <!-- 전체화면 -->


		
	
	
	
	<%-- <div>
	<img id="apt_img" src="resources/img/lobby_entrance.jpg"
			<img id="apt_img" src="resources/img/${member.apt_code}.jpg"
				height="370" width="600">
				</div> --%>
</body>
</html>
