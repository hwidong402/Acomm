<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>
	<div class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 overflow-hidden">
		<div class="d-grid">
			<button class="btn btn-outline-info"
				onclick="location.href='openBbsCate?bbs_cate=${cate}'" type="button">${cate} 더보기</button>
		</div>
		<c:forEach var="list5" items="${list5}">
			<div class="list-group">
				<div class="list-group-item list-group-item-action">
					<div class="d-flex w-100 justify-content-between">
						<small>${list5.member_nick}</small> <small><fmt:formatDate pattern="yyyy-MM-dd" value="${list5.bbs_date}"/></small>
					</div>
					<h5 class="ellipsis">
						<a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a>
					</h5>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>