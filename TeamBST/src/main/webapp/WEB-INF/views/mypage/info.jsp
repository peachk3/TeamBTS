<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">

	<tr>
		<td>아이디</td>
		<td>${resultDTO.user_id }</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td class="masked-password">********</td> <!-- 비밀번호 마스킹 -->
	</tr>
	<tr>
		<td>이름</td>
		<td>${resultDTO.user_name }</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${resultDTO.user_nick }</td>
	</tr>
	<tr>
		<td>휴대번호</td>
		<td>${resultDTO.user_phone }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${resultDTO.user_email }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${resultDTO.user_birth }</td>
	</tr>
</table>
<input type="button" value="메인으로" class="btn" onclick="location.href='/main/main'">
<input type="button" value="정보수정" class="btn" onclick="location.href='/mypage/updateForm'">
<input type="button" value="회원탈퇴" class="btn" onclick="location.href='/mypage/deleteMember'">

</form>
</body>
</html>