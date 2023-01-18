<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<!-- 상가 정보 띄우기용 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<!-- jquery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div id="writearea"class="container mt-5 text-center">
<form action="replyinsert2.rest">
<input id="membercode" name="member_code" type="hidden" value="${member.member_code }">
<input id="membernick" name="rere_writer" type="hidden" value="${apt.apt_name }">
<input id="aptcode" name="apt_code" type="hidden" value="${apt.apt_code }">
<input id="restid" name="rest_id" type="hidden" value="${rest.rest_id }">

<div class="mb-3">
<h3>후기 작성</h3>
<br><br>
<span>평점</span>
<select name="rere_score">
<option value="0.0">0.0점</option>
<option value="0.5">0.5점</option>
<option value="1.0">1.0점</option>
<option value="1.5">1.5점</option>
<option value="2.0">2.0점</option>
<option value="2.5">2.5점</option>
<option value="3.0">3.0점</option>
<option value="3.5">3.5점</option>
<option value="4.0">4.0점</option>
<option value="4.5">4.5점</option>
<option value="5.0">5.0점</option>
</select></div>
<div class="mb-3">
<label class="form-label">후기</label>
<textarea class="form-control" rows="5" name="rere_content" required="required"></textarea>
</div>
<div>
<button class ="btn btn-primary">후기 등록</button>
</div>
</form>
<a href="matjip"><button class ="btn btn-danger">맛집 홈으로</button></a>
</div>

</body>
</html>