<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	
</script>
<script type="text/javascript">

	function changetype() {
		var num = document.getElementById("aptname").selectedIndex;
		var f = document.getElementById("b2");
		f.type= "submit";
		if(num == 0){
			f.type= "hidden";
		}
	}

	function findcode() {
		
		var num = document.getElementById("aptname").selectedIndex;
		var arr = document.getElementById("aptname").options;
		//alert("Index " + arr[num].index + " : " + arr[num].text);
		//var aname = document.getElementById('apt_name').value;
		var name = arr[num].text

		console.log(name)
		console.log(num)
		//console.log(aname)
		
		
		b2.onclick = function() {

			if (confirm("선택하신 아파트가 " + name + "이(가) 맞으신가요?")) {
				alert(name + " 회원가입으로 이동합니다.");
				return true;
			} else {
				alert("아파트를 다시 검색해주세요.");
				return false;
			}

			/* 			if (name == null) { */
			/* 				if (confirm("선택하신 아파트가 " + name + "이(가) 맞으신가요?")) {
			 alert("우리아파트 회원가입으로 이동합니다.");
			 return true;
			 } else {
			 alert("아파트를 다시 검색해주세요.");
			 return false;
			 } */
			/* 			} else {
			 return false;
			 } */

		}

	}
</script>






<select onclick="findcode()"
	onchange="document.getElementById('apt_name').value = this.options[this.selectedIndex].label;changetype()"
	id="aptname" name="apt_code" class="apt_code"
	style="width: 500px; color: black;">
	<option>아파트를 선택해주세요.</option>
	<c:forEach items="${list}" var="one">
		<option label="${one.apt_name}" value="${one.apt_code}">${one.apt_name}</option>
	</c:forEach>
</select>
<br>

<input type="hidden" value="우리아파트 회원가입" id="b2" class="btn btn-primary btn-lg">