<%@page import="com.jav4.acomm.restaurant.RestReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 RestReplyVO reply=(RestReplyVO)request.getAttribute("reply");
if(reply!=null){
%><table class=table><tr><td colspan='4'>나의 후기</td></tr><tr><td colspan='2'>${reply.rere_writer }</td><td>${reply.rere_score }점</td><td><button id='delete' name='${reply.rere_id }' class='btn btn-danger'>삭제</button></td></tr><tr><td colspan='4'>${reply.rere_content }</td></tr></table>
<%}else{}%>