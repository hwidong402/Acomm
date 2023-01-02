<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<select onchange="document.getElementById('apt_name').value = this.options[this.selectedIndex].value">   
<c:forEach items="${list}" var="one">
          <option value="${one.apt_name}">${one.apt_name}</option>
</c:forEach>
</select> <br>
<a href="enroll.jsp">가입하기</a>