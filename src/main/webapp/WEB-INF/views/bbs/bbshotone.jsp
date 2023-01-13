<%@page import="com.jav4.acomm.bbs.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="../../resources/css/bbshot.css"> -->
</head>
<script type="text/javascript">
	$(function() {
		
		/* 유지보수로 페이지 새로고침을 막아보는 함수 설정 */
		/* function refresh() {
			$.ajax({
				url : "bbs/bbshotall",
				success : function(data) {
					console.log(data)
					$('#hotlist').html(data);
				}
			});
		} */
		
		
		// 여기 조건이냐
		$('#b1').click(function() {
			var bbsid = $('#bbsid').val();
			var bbsmembercode = $('#bbsmembercode').val();
			// 여기 조건이냐
			if ((bbsid == "") && (bbsmembercode == "")) {
				$('#b1').css({'background-color' : 'yellow'});
				$.ajax({
					url : "bbshotlike?bbs_id=${vo.bbs_id}",
					success : function(data) {
						console.log(data)
						document.location.href = document.location.href;
					}
				}); // 1 ajax
			} //if
			if ((bbsid != "") && (bbsmembercode != "")) {
				$('#b1').css({'background-color' : 'pink'});
				//$('#b1').click(function() {
					$.ajax({
						url : "bbslikedel?bbs_id=${vo.bbs_id}",
						success : function(data) {
							console.log(data)
							document.location.href = document.location.href;
						}
					}); // ajax 끝
				//}) // 삭제 b1
			} // 두 번째 if 끝
		}) // b1 click 
	}) // body 
	
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
					<td>좋아요</td>
					</tr>
					<tr>
					<td>${vo.bbs_id}</td>
					<td>${vo.bbs_title}</td>
					<td><fmt:formatDate pattern="yyyy년MM월dd일 hh시 mm분" value="${vo.bbs_date}"/></td>
					<td>${vo.member_nick}</td>
					<td>${vo.bbs_content}</td>
					<td>${vo.bbs_file}</td>
					<td>${vo.apt_code}</td>
					<td>${vo.bbs_notice}</td>
					<td>${vo.bbs_cate}</td>
					<td>${vo.bbs_count}</td>
					<td>${vo.bbs_like_count}</td>
					<td>
							<button id="b1">좋아요</button>
					</td>
					</tr>
			</table>
			<table>
				<tr>
					<td>bbslike like_id</td>
					<td>bbslike bbs_id</td>
					<td>bbslike member_code</td>
				</tr>
			<%-- <c:forEach var="vo2" items="${vo2}"> --%>
				<tr>
					<td> ${vo2.like_id}</td>
					<td><input id="bbsid" value="${vo2.bbs_like_id}"></td>
					<td><input id="bbsmembercode" value="${vo2.member_code}"></td>
				</tr>
			<%-- </c:forEach> --%>
			</table>

	</div>
</body>
</html>