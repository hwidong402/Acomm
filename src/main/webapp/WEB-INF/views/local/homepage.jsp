<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${apt.apt_name}에오신것을환영합니다!</title>
<!-- innerHead -->
<%@ include file="../common/innerHead.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	//var key = "0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";//인증키
	var key = "KYz4a7bdo60awWOrCRJVLCc8CBx2lX1r0aiohUQ%2FHk2cCcnePEh1hr8T6B9oNFfoqINkgMEFQRpEtuu7ZChX4Q%3D%3D";//인증키
	var bstopid=${member.stop_id}+"";
	
	//정류장 즐겨찾기 미등록 id
	$(function() {
	if(bstopid==""){
		$('#bus').append(
		"<a href=busstopmap5.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button class='btn btn-primary'>즐겨찾는 정류장을 등록해주세요!</button></a>"
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
						$('#bus').append(
								"<a href=busstopmap5.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button class='btn btn-secondary'>즐겨찾는 정류장 변경하기</button></a>"
										);
						var table = "<table class="+"table table-dark table-striped"+"><tr><td style='white-space:nowrap;'>버스번호</td><td style='white-space:nowrap;'>남은 시간</td><td style='white-space:nowrap;'>남은 정류장</td></tr>"; // table 만드는 기능
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

<link rel="stylesheet" href="resources/css/style.css">
<style type="text/css">
div{
/* border: 1px solid blue; */
}
* {
	/* text-align: center; /* 가로가운데 정렬 */
	/* vertical-align: middle;  *//* 세로가운데 정렬 */ */
}

/* #header {
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
} */
</style>
</head>
<body>
	<!-- 최상단 nav -->
	<%@ include file="../common/navbar.jsp" %>	
 	<!-- main -->
 	<main class="container">
	 	<br>
	 	<br>
	 	<div id="header" class='radiusShadow' style="text-align: center;  background: white;" > <!-- 아파트이름 -->
			<br>
			<h1 id="apt_name" style="font-weight: bold;">${apt.apt_name}</h1>
			<br>
		</div> <!-- 아파트이름 --> 
		<br>
		<div id="infobus" style="float: left; width: 25%">
			<div id="content" style="width: 100%;"> <!-- 내정보 -->
				<table id="my_box">
					<tr>
						<td colspan="2">
						<img src="resources/img/picture.png" class="circle">
						
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p style="font-size: 17px;">
								반갑습니다.${member.member_name}님<br> A-Comm에
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
							 <a href="m_logout"><button class="btn btn-outline-danger" style="width: 200px;">로그아웃</button></a></td>
					</tr>
				</table>
			</div> <!-- 내정보 -->
			<div id="buslogic" style="width: 100%;"> <!-- 버스정류장 -->
			<!-- 도착정보 결과 -->
				<div id="bus" style="width: 100%; height: 350px; overflow: auto;"></div>
			</div> <!-- 버스정류장 -->
		</div> <!-- infobus -->
		
		
		<div id="noti" style="float: right; width: 70%;"> <!-- 공지사항 -->
			<!-- 슬라이드 광고 -->
			<%@ include file="../common/slideAD.jsp" %>
			<div id="notiList"></div>
		</div> <!-- 공지사항 -->
	</main>
	<!-- footer -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
