<%@page import="com.jav4.acomm.bbs_reply.BbsReplyVO"%>
<%@page import="com.jav4.acomm.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>
	<!-- 댓글 -->
	<c:forEach var="bbsReply" items="${bbsReply}">
		<div class="list-group">
			<div class="list-group-item list-group-item-action">
				<div class="d-flex w-100 justify-content-between">
					<!-- 앞쪽 --> 
					<div>
						<small>${bbsReply.member_nick}</small><span>&nbsp;&nbsp;</span>
						<small style="color : gray" ><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${bbsReply.reply_date}"/></small>
					</div>
					<!-- 뒤쪽 --> 
					<%-- <%
					// 세션 member_code와 reply의 member_code가 같아야 수정삭제가 보임
					if (session.getAttribute("member_code").equals(bbsReply.member_code)) {
					%> --%>
					<!-- 삭제기능 미구현 -->
					<button id="${bbsReply.reply_id}" class="deleteBbsReply btn btn-outline-danger btn-sm" type="button" disabled>삭제</button>
					<%-- <%
					}
					%>  --%>
				</div>
				<h5> ${bbsReply.reply_content} </h5>
			</div>
		</div>
	</c:forEach>
</body>
</html>