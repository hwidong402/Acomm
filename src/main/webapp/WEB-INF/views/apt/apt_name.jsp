<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">
	var name = document.getElementById('apt_name').value;
	b2.onclick = function(){
		 if (confirm(name+"우리아파트 회원가입으로 이동할까요?")) {
			 	alert("우리아파트 회원가입으로 이동합니다.");
	            return true;
	        } else {
	            alert("아파트를 다시 검색해주세요.");
	            return false;
	        }
	}
</script>





<%-- <select onchange="document.getElementById('apt_name').value = this.options[this.selectedIndex].value" style="width: 350px;">   
<c:forEach items="${list}" var="one">
          <option value="${one.apt_name}">${one.apt_name}</option> --%>
          <select onchange="document.getElementById('apt_name').value = this.options[this.selectedIndex].label" name="apt_code" class="apt_code" style="width: 300px;">  
<c:forEach items="${list}" var="one">
          <option label="${one.apt_name}" value="${one.apt_code}">${one.apt_name}</option>
</c:forEach>
</select> <br>
<button type="submit" id="b2">우리 아파트 회원가입</button>