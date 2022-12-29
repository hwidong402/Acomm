<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
 <c:forEach items="${list}" var="one">
  		${one.apt_name}
  		<br>
</c:forEach>