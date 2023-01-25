<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.jav4.acomm.member.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
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
		<h1>게시글 작성</h1>
	</div>

	<!-- 버튼 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<a href="openBbsCate?bbs_cate=${bbs_cate}">
					<button class="btn btn-danger">뒤로가기</button>
				</a>
			</div>
		</div>
	</div>
	
	<hr>
	<!-- 본문 -->
	<div class="container mt-5 text-center">
		<form action="insertPost">
			
			<table class="table" hidden="hidden">
				<tr style="border: 1px solid blue">
					<td>code</td>
					<td>nick</td>
					<td>아파트 코드</td>
					<!-- <td>파일</td> -->
				</tr>
				<tr style="border: 1px solid blue">
					<td><input name="member_code" value="${member.member_code}" readonly="readonly"></td>
					<td><input name="member_nick" value="${member.member_nick}" readonly="readonly"></td>
					<td><input name="apt_code" value="${member.apt_code}" readonly></td>
					<!-- <td><input name="bbs_file"></td> -->
				</tr>
			</table>
			<div class="mb-3">
				<%
				// 세션 member_code와 게시글의 member_code가 같아야 수정삭제가 보임
				MemberVO member = (MemberVO)request.getAttribute("member");
				int member_cls = member.getMember_cls();
				if (member_cls == 1) {
				%>
				<div>
					<input type="radio" id="nomal" name="bbs_notice" value="0" >
					<label for="nomal">일반글</label>
					<input type="radio" id="noti" name="bbs_notice" value="1" checked>
					<label for="noti">공지글</label>
				</div>
				<%
				}
				%>
			</div>
			<div class="mb-3">
				<select name="bbs_cate" class="form-select" >
					<option value="${bbs_cate}"selected>${bbs_cate}</option>
					<option value="info">info</option>
					<option value="free">free</option>
					<option value="market">market</option>
					<option value="sugg">sugg</option>
					<option value="worry">worry</option>
				</select>
			</div>
			
			<div class="mb-3">
				<label class="form-label">제목</label> 
				<input class="form-control" name="bbs_title" value="">
			</div>
			<div class="mb-3">
				<label class="form-label">본문</label>
				<textarea name="bbs_content" class="form-control"rows="10"></textarea>
			</div>
			<div>
				<button type="submit"  class="btn btn-primary">작성하기</button> <br>
			</div>
		</form>		
	</div>
	</main>

    <!-- footer -->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>