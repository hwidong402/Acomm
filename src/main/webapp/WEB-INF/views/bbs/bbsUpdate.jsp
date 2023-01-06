<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
.back {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container p-5 my-5 text-center bg-primary text-white">
		<h2>게시글 수정</h2>
	</div>
	<div class="container mt-5 text-center">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<form action="updatePost">
					<table class="table">
						<tr>
							<td>글아이디</td>
							<td><input name="bbs_id" value="${post.bbs_id}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="bbs_writer" value="${post.bbs_writer}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input name="bbs_title" value="${post.bbs_title}"></td>
						</tr>
						<tr>
							<td>cate</td>
							<td>
								<select class="form-select" aria-label="Default select example">
								  <option value="${post.bbs_cate}"selected>${post.bbs_cate}</option>
								  <option value="info">info</option>
								  <option value="free">free</option>
								  <option value="market">market</option>
								  <option value="sugg">sugg</option>
								  <option value="worry">worry</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>noti=아직 안불러옴</td>
							<td>
								<div class="form-check form-switch">
								  <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
								  <label class="form-check-label" for="flexSwitchCheckDefault">Default switch checkbox input</label>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<td colspan="2"><textarea cols="40" rows="5" name="bbs_content">${post.bbs_content}</textarea></td>
						</tr>
					</table>
					<!-- 폼의 bbs컬럼에 넣을 값들을 수정하는곳으로 맵핑 -->
					<button class="btn btn-primary">수정완료</button>
				</form>
			</div>
		</div>
	</div>
	<!--수정하지 않고 뒤로가기 호출하면서 bbs에서 검색할 id값을 주기 -->
	<div class="back">
		<a href="openBbsPost?bbs_id=${post.bbs_id}">
			<button class="btn btn-danger">뒤로가기</button>
		</a>
	</div>
</body>
</html>