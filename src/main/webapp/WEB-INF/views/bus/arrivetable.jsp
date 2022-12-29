<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>전체 게시글 갯수 : ${count}개</h3>
<hr color="blue">
<%int pages= (int)request.getAttribute("pages");
	for(int p=1; p<= pages; p++){
%>
<a href=bbsAll?page=<%=p%> >
	<button><%=p %></button>
</a>
<%} %>
<table class="table">
<tr>
<th>노선번호</th>
<th>남은 시간</th>
<th>남은 정거장</th>
</tr>
<c:forEach var="dto" items="${list}">
<tr>
<td>${dto.lineno}</td>
<td>${dto.}</td>
<td>${dto.}</td>
</tr>
  </c:forEach>
</table> --%>