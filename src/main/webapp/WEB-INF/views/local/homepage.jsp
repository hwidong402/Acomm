<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${apt.apt_name}에오신것을환영합니다!</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	var key = "0QABlWOjjNUTH6AflytlfpxXTM2vig%2FbrTph8sbBtvWn80oDTHnmpv%2FzKgQOReCP6x%2BEWLnHq%2B6Pg4SsOYhopQ%3D%3D";//인증키
	var bstopid=${member.stop_id}
	//정류장 즐겨찾기 미등록 id
	$(function() {
	if(bstopid==null){
		$('#bus').append(
		"<a href=busstopmap5.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button>즐겨찾는 정류장을 등록해주세요!</button></a>"
				);
	}//if null end
	if(bstopid!=null){
		//정류장 이름 불러오기
		$.ajax({
			url:"stopsearch.bus",
			data:{ stop_id:bstopid},
			success : function(x){
				$('#bus').append("<h3>"+x.stop_name+"</h3>");
			}
		})
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
				})//ajax end
	}//if notnull end
	})//document end
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
div{
border: 1px solid blue;
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

#nav {
	font: 25px 궁서 bold;
	margin: 20px;
	border: 1px solid blue;
}

#my_box, #apt_img, #apt_img_logo, #apt_name {
	display: inline-block;
	margin: 20px;
}
</style>
</head>
<body>
	<div>
		<div id="header">
<%-- 			<img id="apt_img_logo"
				src="resources/img/${member.apt_code}_logo.jpg"
				alt="${member.apt_code}_logo" height="50"> --%>
			<h2 id="apt_name">${apt.apt_name}</h2>
		</div>
		<div id="nav">
			<!-- Links -->
			<ul class="nav justify-content-center">
				<li class="nav-item"><a href="introduce.jsp">아파트 소개</a></li>
				<!-- <li class="nav-item"><a href="notification.jsp">공지사항</a></li> -->
				<li class="nav-item"><a href="open.aptsell">부동산</a></li>
				<li class="nav-item"><a href="openBbs">커뮤니티</a></li>
				<li class="nav-item"><a href="matjip?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}">주변 맛집</a></li>
			</ul>
		</div>
		<div id="content" style="width: 600px;">
			
			<table id="my_box">
			
				<tr>
					<td colspan="2"><%-- <img
						src="resources/img/${member.member_name}.jpg"
						alt="${member.member_name}" height="250"> --%></td>
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
		</div>
	</div>
	<div id="buslogic" style="width: 600px;">
<!-- 		<a
			href=bus/busstopmap.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button>다른
				정류장 보기1</button></a> <a
			href=bus/busstopmap2.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button>다른
				정류장 보기2</button></a> <a
			href=bus/busstopmap3.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button>다른
				정류장 보기3</button></a> --> 
			<!--
				<a href=busstopmap4.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button >다른
				정류장 보기4</button></a>
				<a	href=busstopmap5.bus?apt_lat=${apt.apt_lat}&apt_lon=${apt.apt_lon}><button >다른
				정류장 보기5</button></a> -->
		<!-- 도착정보 결과 -->
		<div id="bus" style="width: 600px; height: 350px;"></div>
	</div>
	<div>
	공지사항 <br><br><br><br><br><br><br><br>
	</div>
	<div>
	<img id="apt_img" src="resources/img/lobby_entrance.jpg"
			<%-- <img id="apt_img" src="resources/img/${member.apt_code}.jpg" --%>
				height="370" width="600">
				</div>
</body>
</html>
