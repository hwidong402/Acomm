<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<form action="up.bbs">
					<table class="table">
						<tr>
							<td>글아이디</td>
							<td><input name="id" value="${dto.id}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input name="title" value="${dto.title}"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="writer" value="${id}" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<td colspan="2"><textarea cols="40" rows="5" ></textarea></td>
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
		<a href="back2.bbs?id=${dto.id}">
			<button class="btn btn-danger">뒤로가기</button>
		</a>
	</div>
</body>
</html>