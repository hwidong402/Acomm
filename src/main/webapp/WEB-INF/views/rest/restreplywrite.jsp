<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
</head>
<body>
<div id="writearea">
<form action="">
<input id="membercode" name="member_code" type="hidden" value=${member.member_code }>
<input id="membernick" name="rere_write" type="hidden" value=${member.member_nick }>
<input id="aptcode" name="apt_code" type="hidden" value=${apt.apt_code }>
<input id="restid" name="rest_id" type="hidden" value=${rest.rest_id }>
<table>
<tr>
<td>평점</td>
<td><select name="rere_score">
<option value="0.0">0.0점</option>
<option value="0.5">0.5점</option>
<option value="1.0">1.0점</option>
<option value="1.5">1.5점</option>
<option value="2.0">2.0점</option>
<option value="2.5">2.5점</option>
<option value="3.0">3.0점</option>
<option value="3.5">3.5점</option>
<option value="4.0">4.0점</option>
<option value="4.5">4.5점</option>
<option value="5.0">5.0점</option>
</select></td>
</tr>
<tr>
<td colspan="2">후기</td>
</tr>
<tr>
<td><input type="text" name="rere_content"></td>
</tr>
</table>
</form>
</div>
</body>
</html>