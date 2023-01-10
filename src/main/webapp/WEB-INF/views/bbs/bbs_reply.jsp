<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	<!-- 댓글 -->
	<div class="container mt-5 text-center">
		<table class="table">
			<tr style="border: 1px solid blue">
				<td>reply_id</td>
				<td>reply_content</td>
				<td>member_code</td>
				<td>member_nick</td>
				<td>reply_date</td>
				<td>삭제버튼</td>
			</tr>
			<c:forEach var="bbsReply" items="${bbsReply}">
			<tr>
				<td>${bbsReply.reply_id}</td>
				<td>${bbsReply.reply_content}</td>
				<td>${bbsReply.member_code}</td>
				<td>${bbsReply.member_nick}</td>
				<td>${bbsReply.reply_date}</td>
				<td><button>삭제버튼</button></td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>