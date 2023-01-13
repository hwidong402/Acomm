<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_cup.parser"%>
<%@ page import="com.jav4.acomm.bbs.BbsVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#up {
	text-align: right;
}
</style>
<script type="text/javascript">

	// post 삭제 경고
	function deleteWarning() {
		deletePost.onclick = function() {
			if (confirm("게시글을 삭제하시겠습니까")) {
				alert("게시글삭제");
				return true;
			} else {
				alert("삭제취소");
				return false;
			}
		}
	}
	/* function replyWarning() {
		replyDeleteBtn.onclick = function() {
			if (confirm("게시글을 삭제하시겠습니까")) {
				alert("게시글삭제");
				return true;
			} else {
				alert("삭제취소");
				return false;
			}
		}
	} */
	
	// page 시작하자마자 BbsReply 가져와줌
	window.onload = function() {
		getBbsReply();
	 }
	// BbsReply 들고오는 func
	function getBbsReply(){
		$(function() { 
			$.ajax({
				url : "getBbsReply?bbs_id="+${post.bbs_id},
				success : function(data) {
					console.log("들고온 데이터 = " + data)
					 $('#bbsReply').html(data);
				}
			}); // ajax
		}); // function
	}; //getBbsReply()
	
	
	// insertBbsReply 버튼누름 > reply_content를 bbsReply에 insert
	$(function() {
		$('#insertBbsReply').click(function() {
			var reply_content = $('#reply_content').val();
			$.ajax({
				type: "POST",
				url: 'insertBbsReply?bbs_id='+${post.bbs_id},
				data: {'reply_content': reply_content},
				success: function(data) {
					getBbsReply(); // bbsReply 들고와줌
					document.getElementById("reply_content").value=''; // reply_content 비우기
				},
				error : function() {
					alert("error")
				}
			}); // ajax
		}); //click
	}); // function
		
	$(function() {
		// replyDelete 클래스 버튼누름 > id의 값을 들고 옴 > reply_id를 비교해서 지움
		$('.deleteBbsReply').click(function() {
			var reply_id = $(this).attr('id');
			console.log(reply_id);
			$.ajax({
				type: "POST",
				url: 'deleteBbsReply',
				data: {'reply_id': reply_id},
				success: function(data) {
					getBbsReply(); // bbsReply 들고와줌
				},
				error : function() {
					alert("error")
				}
			}); // ajax
		}); //click
	}); // function
	
		
</script>
</head>
<body>
	<!-- 최상단 nav -->
	<%@ include file="../navbar.jsp" %>

	<!-- 헤더? -->
	<div class="container p-3 my-3 text-center">
		<h1>게시글 상세보기</h1>
	</div>
	
	<hr>
	<!-- 버튼 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<a href="openBbsCate?bbs_cate=${post.bbs_cate}"><button class="btn btn-warning">뒤로가기</button></a>
			</div>
			<div class="col-sm-4"></div>
			<div id="up" class="col-sm-4">
				<%
					// 세션 member_code와 게시글의 member_code가 같아야 수정삭제가 보임
					BbsVO post = (BbsVO)request.getAttribute("post");
					if (session.getAttribute("member_code").equals(post.getMember_code())) {
				%>
				<a href="openBbsUpdate?bbs_id=${post.bbs_id}"><button class="btn btn-info">수정</button></a>
				<a href="deletePost?bbs_id=${post.bbs_id}" id="deleteBtn"><button class="btn btn-danger" onclick="findcode()" >삭제</button></a>
				<%
					}
				%>
			</div>
		</div>
	</div>
	
	<hr>
	<!-- 본문 -->
	<div class="container mt-5 text-center">
		<table class="table">
			<tr style="border: 1px solid blue">
				<td>포스트 아이디</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>공지?</td>
				<td>카테고리</td>
				<td>조회수</td>
				<td>좋아요</td>
			</tr>
			<tr style="border: 1px solid blue">
				<td>${post.bbs_id}</td>
				<td>${post.bbs_title}</td>
				<td>${post.member_nick}</td>
				<td>${post.bbs_notice}</td>
				<td>${post.bbs_cate}</td>
				<td>${post.bbs_count}</td>
				<td><%-- ${post.bbs_like} --%></td>
			</tr>
			<tr>
				<td colspan="7">내용</td>
			</tr>
			<tr>
				<td colspan="7">${post.bbs_content}</td>
			</tr>
		</table>
	</div>
	
	<!-- 댓글 목록 영역 -->
	<div id="bbsReply" class="container mt-5 text-center"></div>
	
	<!-- 댓글작성 영역 -->
	<div class="container mt-5 text-center">
		<div class="mb-3">
			<textarea name="reply_content" id="reply_content" placeholder="댓글" class="form-control" rows="2"></textarea>
		</div>
		<div>
			<button id="insertBbsReply" class="btn btn-primary">등록</button>
			<br>
		</div>
	</div>

</body>
</body>
</html>