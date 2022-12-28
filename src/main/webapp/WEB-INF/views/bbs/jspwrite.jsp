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
</head>
<style>
.back{
text-align: center;
}
</style>
<body>
	<!-- 글쓰기 버튼 클릭시 이동할 글쓰기 페이지 -->
	<div class="container p-5 my-5 text-center bg-primary text-white">
		<h1>게시글 작성</h1>
	</div>
	<div class="container mt-5 text-center">
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4" >
				<form action="create.bbs">
					<table class="table">
						<tr>
							<td>글아이디</td>
							<td><input name="id"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input name="title"></td>
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
							<td colspan="2"><textarea name="content" rows="5" cols="40"></textarea></td>
						</tr>
						<tr>
							<td colspan="2" >
								<button type="submit"  class="btn btn-primary">작성하기</button> <br>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="back">
							<a href="back.bbs"><button  class="btn btn-danger">뒤로가기</button></a>
	</div>
</body>
</html>