<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.jav4.acomm.bbs.BbsVO"%>
<%@page import="com.jav4.acomm.member.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 cate ${bbs_cate}</title>
<!-- innerHead -->
<%@ include file="../common/innerHead.jsp" %>
</head>
<body>
	<!-- 최상단 nav -->
	<%@ include file="../common/navbar.jsp" %>	
 	<!-- main -->
 	<main class="container">
	
	<!-- 헤더? -->
	<div class="container p-3 my-3 text-center">
		<h1>hot cate</h1>
	</div>
	
	<!-- 버튼 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<!-- <a href="openBbs"><button class="btn btn-warning">뒤로가기</button></a> -->
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
	<hr>
	<!-- 본문 -->
	<div class="card radiusShadow">
			<c:forEach var="list" items="${hotlist}">
				<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
							<!-- 앞쪽 --> 
							<div>
								<small>${list.member_nick}</small>
								<span>&nbsp;&nbsp;</span>
								<small style="color : gray" ><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${list.bbs_date}"/></small>
							</div>
							<!-- 뒤쪽 --> 
							<div>
								<!-- 조회수 -->
								<small>${list.bbs_count}</small>
								<!-- 눈 모양 svg -->
								<svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg" class="sc-XhUPp kiNLFp">
									<path d="M8.99963 3.37524C5.24963 3.37524 2.04713 5.70774 0.749634 9.00024C2.04713 12.2927 5.24963 14.6252 8.99963 14.6252C12.7496 14.6252 15.9521 12.2927 17.2496 9.00024C15.9521 5.70774 12.7496 3.37524 8.99963 3.37524ZM8.99963 12.7502C6.92963 12.7502 5.24963 11.0702 5.24963 9.00024C5.24963 6.93024 6.92963 5.25024 8.99963 5.25024C11.0696 5.25024 12.7496 6.93024 12.7496 9.00024C12.7496 11.0702 11.0696 12.7502 8.99963 12.7502ZM8.99963 6.75024C7.75463 6.75024 6.74963 7.75524 6.74963 9.00024C6.74963 10.2452 7.75463 11.2502 8.99963 11.2502C10.2446 11.2502 11.2496 10.2452 11.2496 9.00024C11.2496 7.75524 10.2446 6.75024 8.99963 6.75024Z"></path>
								</svg>
								<span>&nbsp;&nbsp;</span>
								<!-- 좋아요 -->
								<small>${list.bbs_like_count}</small>
								<!-- 하트 모양 svg -->
								<svg width="18" height="18" viewBox="0 0 28 28" fill="url(#paint0_radial_476_976)" xmlns="http://www.w3.org/2000/svg" class="sc-hOqqkJ bKiBMa gray">
									<path d="M14 23.5178C14.2569 23.5178 14.6324 23.3202 14.9387 23.1225C20.4625 19.5652 24 15.3953 24 11.1759C24 7.52964 21.4802 5 18.3281 5C16.3617 5 14.8893 6.08696 14 7.70751C13.1304 6.08696 11.6482 5 9.68182 5C6.51976 5 4 7.52964 4 11.1759C4 15.3953 7.54743 19.5652 13.0613 23.1225C13.3676 23.3202 13.7431 23.5178 14 23.5178Z"></path>
									<defs>
										<radialGradient id="paint0_radial_476_976" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(14 9.5) rotate(90) scale(14.0178 15.1398)">
										<stop stop-color="#FF0000"></stop>
										<stop offset="0.0001" stop-color="#FF0000"></stop>
										<stop offset="1" stop-color="#DF0000"></stop></radialGradient>
									</defs>
								</svg>
							</div> <!-- 뒤쪽 끝 -->
						</div>
						<h5 class="ellipsis">
							<a href="openBbsPost?bbs_id=${list.bbs_id}">${list.bbs_title}</a>
						</h5>
					</div>
				</div>
			</c:forEach>
	</div>
	</main>
    <!-- footer -->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>