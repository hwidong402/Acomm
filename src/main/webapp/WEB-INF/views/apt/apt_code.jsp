<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <select name="apt_code" class="apt_code" style="width: 300px;"> -->
<select onchange="document.getElementById('apt_name').value = this.options[this.selectedIndex].label" name="apt_code" class="apt_code" style="width: 300px;">  
<c:forEach items="${list}" var="one">
          <option label="${one.apt_name}" value="${one.apt_code}">${one.apt_name}</option>
          <%-- <option value="${one.apt_city}">${one.apt_name}</option> --%>
</c:forEach>
</select>