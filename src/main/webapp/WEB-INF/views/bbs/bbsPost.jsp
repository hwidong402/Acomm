<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java_cup.parser"%>
<%@ page import="com.jav4.acomm.bbs.BbsVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 ${post.bbs_id}</title>
<!-- innerHead -->
<%@ include file="../common/innerHead.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	
	// likebtn 생성
	$(function() {
			var bbsid = $('#bbsid').val();
			var bbsmembercode = $('#bbsmembercode').val();
			
			if ((bbsid == "") && (bbsmembercode == "")) {
				$('#likebtn').html("<button id='b1' class='btn btn-outline-danger'>좋아요</button>");
			} //if
			if ((bbsid != "") && (bbsmembercode != "")) {
				$('#likebtn').html("<button id='b1' class='btn btn-danger'>좋아요</button>");
			} // 두 번째 if 끝
	}) // body 
	
	// likebtn 클릭
	$(function() {
		 $('#b1').click(function() {
			var bbsid = $('#bbsid').val();
			var bbsmembercode = $('#bbsmembercode').val();
			if ((bbsid == "") && (bbsmembercode == "")) {
				$.ajax({
					url : "bbs/bbshotlike?bbs_id=${post.bbs_id}",
					success : function(data) {
						console.log(data)
						document.location.href = document.location.href;
					}
				}); // 1 ajax
			} //if
			if ((bbsid != "") && (bbsmembercode != "")) {
					$.ajax({
						url : "bbs/bbslikedel?bbs_id=${post.bbs_id}",
						success : function(data) {
							console.log(data)
							document.location.href = document.location.href;
						}
					}); // ajax 끝
			} // 두 번째 if 끝
		 }) // b1 click 
	}) // body 
	
		
</script>
</head>
<body>
	<!-- 최상단 nav -->
	<%@ include file="../common/navbar.jsp" %>	
 	<!-- main -->
 	<main class="container">

	<!-- 헤더? -->
	<div class="container p-3 my-3 text-center">
		<h1>게시글 상세보기</h1>
	</div>
	
	<!-- 버튼 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<a href="openBbsCate?bbs_cate=${post.bbs_cate}"><button class="btn btn-warning">뒤로가기</button></a>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4 txtR">
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
	<div class="card radiusShadow">
		<!-- title section -->
		<div class="list-group">
			<div class="list-group-item list-group-item-action">
				<div class="d-flex w-100 justify-content-between">
					<!-- 앞쪽 --> 
					<div>
						<small>${post.member_nick}</small><br>
						<small style="color : gray" ><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${post.bbs_date}"/></small>
					</div>
					<!-- 뒤쪽 --> 
					<button type="button" class="btn btn-outline-primary btn-sm" disabled>${post.bbs_cate}</button>
				</div>
				<h2> ${post.bbs_title} </h2>
			</div>
		</div>
		<div class="container mt-5">
			${post.bbs_content}
		</div>
		
		<!-- 히든으로 보이지 않음 -->
	<table class="table">
	<!-- 검색 한 값을 대조를 위해 hidden 속성으로 넘겨 줌 -->
		<tr style="border: 1px solid blue" hidden="hidden">
			<td>bbslike like_id</td>
			<td>bbslike bbs_id</td>
			<td>bbslike member_code</td>
		</tr>
	<%-- <c:forEach var="vo2" items="${vo2}"> --%>
		<tr style="border: 1px solid blue" hidden="hidden">
			<td>${post2.like_id}</td>
			<td><input id="bbsid" value="${post2.bbs_like_id}"></td>
			<td><input id="bbsmembercode" value="${post2.member_code}"></td>
		</tr>
	<%-- </c:forEach> --%>
	</table>
	
		<div class="container mt-5">
			<!-- 조회수 -->
			<small>${post.bbs_count}</small>
			<!-- 눈 모양 svg -->
			<svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg" class="sc-XhUPp kiNLFp">
				<path d="M8.99963 3.37524C5.24963 3.37524 2.04713 5.70774 0.749634 9.00024C2.04713 12.2927 5.24963 14.6252 8.99963 14.6252C12.7496 14.6252 15.9521 12.2927 17.2496 9.00024C15.9521 5.70774 12.7496 3.37524 8.99963 3.37524ZM8.99963 12.7502C6.92963 12.7502 5.24963 11.0702 5.24963 9.00024C5.24963 6.93024 6.92963 5.25024 8.99963 5.25024C11.0696 5.25024 12.7496 6.93024 12.7496 9.00024C12.7496 11.0702 11.0696 12.7502 8.99963 12.7502ZM8.99963 6.75024C7.75463 6.75024 6.74963 7.75524 6.74963 9.00024C6.74963 10.2452 7.75463 11.2502 8.99963 11.2502C10.2446 11.2502 11.2496 10.2452 11.2496 9.00024C11.2496 7.75524 10.2446 6.75024 8.99963 6.75024Z"></path>
			</svg>
			<span>&nbsp;&nbsp;</span>
			<!-- 좋아요 -->
			<small>${post.bbs_like_count}</small>
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
			<span>&nbsp;&nbsp;</span>
			<span id="likebtn"> </span>
		</div>
		
		<!-- 댓글 목록 영역 from bbsReply -->
		<div id="bbsReply" class="container mt-5"></div>
		
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
	
	
	</main>

    <!-- footer -->
    <%@ include file="../common/footer.jsp" %>
</body>
</body>
</html>