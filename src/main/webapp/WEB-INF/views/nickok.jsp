<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>${result}
<!--     
    1. enroll.jsp의 member_id에 값을 입력
    2. enroll.jsp의 자바스크립트에서 data로 member_id를 여기로 보내는 ajax실행 
    3. MemberController.java.에서 ckok.jsp가 mapping된 구문 실행
    4. 중복이면 result를 yes, 중복이 아니면 result를 no로 모델값을 보냄
    5. 받아오는 데 성공했으면 받은 모델값을 x로 이하 스크립트 실행 
    6. x가 no이면 중복이 아닐 때의 조건문을 실행
    7. x가 yes이면 중복일 때의 조건문을 실행
     -->