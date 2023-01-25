<%@page import="com.jav4.acomm.restaurant.RestReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 List<RestReplyVO> replylist=(List<RestReplyVO>)request.getAttribute("reply");

if(replylist.size()!=0){
%>
<div class="container mt-5 text-center">
		<table class="table">
<c:forEach var="rereply" items="${reply}">
			<tr style='background: #d3d3d3;'><td colspan='3'>${rereply.rere_writer }</td><td>평점 : ${rereply.rere_score }</td></tr><tr><td colspan='4'>${rereply.rere_content }</td></tr>
		</c:forEach>
</table>
</div>
<%}else{}%>