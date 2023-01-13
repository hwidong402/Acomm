<%@page import="com.jav4.acomm.bbs_reply.BbsReplyVO"%>
<%@page import="com.jav4.acomm.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	
	
</script>
<body>
	<!-- 댓글 -->
	<div class="container mt-5 text-center">
		<table class="table">
			<tr style="border: 1px solid blue">
				<td>member_nick</td>
				<td>reply_id</td>
				<td>reply_content</td>
				<td>member_code</td>
				<td>reply_date</td>
				<td>삭제버튼</td>
			</tr>
			<c:forEach var="bbsReply" items="${bbsReply}">
			<tr>
				<td>${bbsReply.member_nick}</td>
				<td>${bbsReply.reply_id}</td>
				<td>${bbsReply.reply_content}</td>
				<td>${bbsReply.member_code}</td>
				<td>${bbsReply.reply_date}</td>
				<td>
				<%-- <%
					// 세션 member_code와 reply의 member_code가 같아야 수정삭제가 보임
					if (session.getAttribute("member_code").equals(bbsReply.member_code)) {
				%> --%>
				<button id="${bbsReply.reply_id}" class="deleteBbsReply btn btn-danger">삭제</button>
				<!-- onclick="replyWarning()" -->
				<%-- <%
					}
				%>  --%>
				</td>
				
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>