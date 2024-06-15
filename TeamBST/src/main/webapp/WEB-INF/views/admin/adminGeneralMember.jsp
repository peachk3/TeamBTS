<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



      <button type="button" class="community" onclick="location.href='/admin/adminMember'">회원현황</button> <br>
      <button type="button" class="community" onclick="location.href='/admin/adminGeneralMember'">일반회원</button> <br>
      <button type="button" class="community" onclick="location.href='/admin/adminWithdrawMember'">탈퇴회원</button>


<table border="1">
	<tr>
		<td>no</td>
		<td>아이디</td>
		<td>이름</td>
		<td>닉네임</td>
		<td>이메일</td>
		<td>전화번호</td>
		<td>가입일자</td>
	</tr>
	<c:forEach var="vo" items="${generalMemberList}">
		<tr>
			<td>넘버</td>
			<td>${vo.user_id }</td>
			<td>${vo.user_name }</td>
			<td>${vo.user_nick }</td>
			<td>${vo.user_phone }</td>
			<td>${vo.user_email }</td>
			<td>${vo.user_birth }</td>
		</tr>
	</c:forEach>
</table>










</body>
</html>