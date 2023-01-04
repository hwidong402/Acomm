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
			<div class="col-sm-4">
				<a href="openBbsCate?bbs_cate=${post.bbs_cate}"><button class="btn btn-danger">뒤로가기</button></a>
			</div>
			<div class="col-sm-4" >
				<form action="insertPost">
					<table class="table">
						<tr>
							<td>제목</td>
							<td><input name="bbs_title"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input name="bbs_writer" value="${id}" readonly>
							</td>
						</tr>
						<tr>
							<td colspan="2">내용</td>
						</tr>
						<tr>
							<td colspan="2"><textarea name="bbs_content" rows="5" cols="40"></textarea></td>
						</tr>
						<tr>
							<td>file(null)</td>
							<td><input name="bbs_file">
							</td>
						</tr>
						<tr>
							<td>apt_code</td>
							<td><input name="apt_code" value="${code}" readonly>
							</td>
						</tr>
						<tr>
							<td>notice</td>
							<td><input name="bbs_notice" >
							</td>
						</tr>
						<tr>
							<td>cate</td>
							<td><input name="bbs_cate" value="${bbs_cate}" readonly>
							</td>
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
</body>
</html>