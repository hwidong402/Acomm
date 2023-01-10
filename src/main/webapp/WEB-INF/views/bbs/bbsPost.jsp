<%@page import="java_cup.parser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.jav4.acomm.bbs.BbsVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#up {
	text-align: right;
}
</style>
<script type="text/javascript">
	function findcode() {
		deleteBtn.onclick = function() {
			if (confirm("게시글을 삭제하시겠습니까")) {
				alert("게시글삭제");
				return true;
			} else {
				alert("삭제취소");
				return false;
			}
		}
	}
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
<%-- 	<div>
		<form action="bbsReply?bbs_id=${post.bbs_id}" method="post">
			<input name="member_code" value="${post.member_code}" readonly="readonly">
			<input name="member_nick" value="${post.member_nick}" readonly="readonly">
			<textarea name="reply_content" id="reply_content" placeholder="댓글"></textarea>
			<button id="replyBtn">등록</button>
		</form>	    
	</div> --%>
	<div>
		<textarea name="reply_content" id="reply_content" placeholder="댓글"></textarea>
		<button id="replyBtn">등록</button>
	</div>
	
	 
	<script type="text/javascript">
	// 페이지 열자마자 한번 해주고
	$(function() {
		getBbsReply();
	}
	// 버튼누름
	$(document).ready(function() {
	  $('#replyBtn').click(function() {
	    var reply = $('#reply').val();
	    $.ajax({
	    	  type: "POST",
	    	  url: 'bbsReply?bbs_id='+${post.bbs_id},
	    	  data:  {'reply': reply, 'member_nick':${post.member_nick}, 'member_code':${post.member_code}},
	    	  success: function(response) {
	    	    // Do something with the response from the server
	    	    getBbsReply();
	    	  }
	    	});
	  });
	});
	
	
	function getBbsReply(){
    $.ajax({
       url : "bbsReply?bbs_id="+${post.bbs_id},
       success : function(data) {
          console.log(data)
          $('#bbsReply').html(data);
       }
	
	// 등록 버튼을 클릭하면 
	// bbsReplyList만 재시작
	
	
	</script>
	

</body>
</body>
</html>