<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${apt_name.name}에 오신것을 환영합니다!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
*{
	text-align: center; /* 가로가운데 정렬 */
	vertical-align: middle; /* 세로가운데 정렬 */
}
#header{
	margin-top:20px;
}

a {
	text-decoration: none;
	color:black;
	}
li {
	margin:20px;
}

#nav{  
	font: 25px 궁서 bold;
	margin:20px;
	border:1px solid blue;
} 

#my_box, #apt_img, #apt_img_logo, #apt_name{
	display:inline-block;
	margin:20px;
}
</style>
</head>
<body>

<div>
	<div id="header">
		<img id="apt_img_logo" src= "resources/img/${member.code}_logo.jpg" alt="${member.code}_logo" height="50">
		<h2 id="apt_name">${apt.name}</h2>
	</div>
	<div id="nav">
		<!-- Links -->
	   	 <ul class="nav justify-content-center"> 
	      <li class="nav-item">
	        <a href="introduce.jsp">아파트 소개</a>
	      </li>
	      <li class="nav-item">
	        <a href="notification.jsp">공지사항</a>
	      </li>
	      <li class="nav-item">
	        <a href="open.bbs">커뮤니티</a>
	      </li>
	      <li class="nav-item">
	        <a href="matjip.jsp">주변 맛집</a>
	      </li>
	   	 </ul>
	</div>
	<div id="content">
		<img id="apt_img" src= "resources/img/${member.code}.jpg" height="370" width="600">
		<table id="my_box">
			<tr>
				<td colspan="2">
					<img src= "resources/img/${member.name}.jpg" alt="${member.name}" height="250" >
				</td>
			</tr>
			<tr>
				<td colspan="2" >
					<p style="font-size: 17px;">
					반갑습니다.${member.name}님<br>
					내가 사는 곳이 중심이 되는 곳 A-Comm에 오신 걸 환영합니다.
					</p>
				</td>
			</tr>
			<tr>
				<td>
					<a href="myinfo.jsp"><button class="btn btn-outline-primary" style="width: 200px; ">내 정보</button></a>
					<a href="m_logout"><button class="btn btn-outline-danger" style="width: 200px;">로그아웃</button></a>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>