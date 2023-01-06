<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <% 
    	int member = (Integer)session.getAttribute("member_code"); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../resources/css/bbshot.css">
</head>
<script type="text/javascript">
	var check = ${vo.bbs_id}
	$(function() {
		if (check == null) {
			$('#b1').css({'background-color' : 'blue'});
			$('#b1').click(function() {
				$.ajax({
					url : "bbshotlike?bbs_id=${vo2.bbs_id}&member_code=${vo2.member_code}",
					success : function(data) {
						console.log(data)
						$('#b1').css({'background-color' : 'red'});
						check = "ok";
						console.log(check)
					}
				}); // 1 ajax
			}) // 1 b1 click
		} // null 끝
		if (check != null) {
			$('#b1').css({'background-color' : 'red'});
			$('#b1').click(function() {
				$.ajax({
					url : "bbslikedel?bbs_id=${vo.bbs_id}",
					success : function(data) {
						console.log(data)
						$('#b1').css({'background-color' : 'blue'});
						check = null
					}
				}); // ajax 끝
			}) // 삭제 b1
		}
		
		$('#b1').click(function() {
			$.ajax({
				url : "bbshotlike?bbs_id=${vo.bbs_id}",
				success : function(data) {
					console.log(data)
					$('#b1').css({'background-color' : 'red'});
					check = "ok";
					console.log(check)
					if (check == "ok") {
						$('#b1').click(function() {
							$.ajax({
								url : "bbslikedel?bbs_id=${vo.bbs_id}",
								success : function(data) {
									console.log(data)
									$('#b1').css({'background-color' : 'blue'});
									check = ""
								}
							}); // ajax 끝
						}) // 삭제 b1
					} else if (check == "") { // if
						$('#b1').click(function() {
							$.ajax({
								url : "bbshotlike?bbs_id=${vo.bbs_id}",
								success : function(data) {
									console.log(data)
									$('#b1').css({'background-color' : 'red'});
									check = "ok"
								}
							}); // ajax 끝
						}) // 다시 추가 b1
					} // else if
				} // success
	
			}); // 1 ajax
		}) // 1 b1 click

		
	}); // body 
	
	
</script>
<body>
	<div id="bbshotall">

			<table border="1">
					<tr>
					<td>번호</td>	
					<td>제목</td>
					<td>날짜</td>	
					<td>글쓴이</td>
					<td>내용</td>
					<td>파일</td>	
					<td>코드</td>	
					<td>공지사항여부</td>
					<td>카테고리</td>
					<td>조회수</td>
					</tr>
					<tr>
					<td>${vo.bbs_id}</td>
					<td>${vo.bbs_title}</td>
					<td>${vo.bbs_date}</td>
					<td>${vo.bbs_writer}</td>
					<td>${vo.bbs_content}</td>
					<td>${vo.bbs_file}</td>
					<td>${vo.apt_code}</td>
					<td>${vo.bbs_notice}</td>
					<td>${vo.bbs_cate}</td>
					<td>${vo.bbs_count}</td>
					</tr>
					<tr>
						<td colspan="10">
							<%-- <a href="bbshotlike?bbs_id=${vo.bbs_id}"> --%>
								<button id="b1">좋아요</button>
							<!-- </a> -->
						</td>
					</tr>
					<tr>
						<td colspan="10">
							<%-- <a href="bbshotlike?bbs_id=${vo.bbs_id}"> --%>
								<button id="b2">좋아요 취소</button>
							<!-- </a> -->
						</td>
					</tr>
			</table>

	</div>
</body>
</html>