<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.jav4.acomm.bbs.BbsVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update bbs ${post.bbs_id}</title>
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
		<h1>게시글 수정</h1>
	</div>

	<!-- 버튼 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<a href="openBbsPost?bbs_id=${post.bbs_id}">
					<button class="btn btn-warning">뒤로가기</button>
				</a>
			</div>
		</div>
	</div>
	
	<hr>
	<!-- 본문 -->
	<div class="container mt-5">
		<form action="updatePost?bbs_id=${post.bbs_id}" method="post" > <!-- 왜 얘로 정보가 안넘어갈까? -->

			<div class="mb-3">
				<label class="form-label">제목</label> 
				<input class="form-control" name="bbs_title" value="${post.bbs_title}">
			</div>
			<div class="mb-3">
				<label class="form-label">본문</label>
				<textarea name="bbs_content" class="form-control"rows="10">${post.bbs_content}</textarea>
			</div>
			<div hidden="hidden">
				<span>닉네임</span> 
				<input name="member_nick" value="${post.member_nick}" readonly="readonly"
					style=" border: none;&:focus {outline: none;}">
			</div>
			<div class="input-group mb-3">
				<label class="input-group-text" for="inputGroupSelect01">cate</label>
				<select name="bbs_cate" class="form-select" id="inputGroupSelect01">
					<option value="${post.bbs_cate}"selected>${post.bbs_cate}</option>
					<option></option>
					<!-- <hr> ??? -->
					<option value="info">info</option>
					<option value="free">free</option>
					<option value="market">market</option>
					<option value="sugg">sugg</option>
					<option value="worry">worry</option>
				</select>
			</div>

			<%
			// 세션 member_code와 게시글의 member_code가 같아야 수정삭제가 보임
			int member_cls = (int) request.getAttribute("member_cls");
			if (member_cls == 1) {
			%>
			<div class="mb-3">
				<div>
					<input type="radio" id="nomal" name="bbs_notice" value="0" checked>
					<label for="nomal">일반글</label>
				</div>

				<div>
					<input type="radio" id="noti" name="bbs_notice" value="1">
					<label for="noti">공지글</label>
				</div>
			</div>
			<%
			}
			%>

			<!-- 폼의 bbs컬럼에 넣을 값들을 수정하는곳으로 맵핑 -->
			<button type="submit" class="btn btn-primary">수정완료</button>
		</form>
	</div>
	</main>

    <!-- footer -->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>