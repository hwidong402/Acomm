<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>
	<div class="col ">
	  <div class="card radiusShadow">
	    <div class="card-body">
			<div class="d-grid">
				<button id="cateBtn"class="btn btn-outline-info" onclick="location.href='openBbsCate?bbs_cate=${cate}'" type="button">
					${cate} 게시판
				</button>
			</div>
			<c:forEach var="list5" items="${list5}">
				<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<div class="d-flex w-100 justify-content-between">
								<%-- <small>${list5.bbs_like_count}</small> --%>
								<small>${list5.member_nick}</small>
								<small><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${list5.bbs_date}"/></small>
						</div>
						<h5 class="ellipsis">
							<a href="openBbsPost?bbs_id=${list5.bbs_id}">${list5.bbs_title}</a>
						</h5>
					</div>
				</div>
			</c:forEach>
	    </div>
	  </div>
	</div>
</body>
</html>