<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<td>${user_id }</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>${user_pwd }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${UserDTO.user_name }</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${UserDTO.user_nick }</td>
	</tr>
	<tr>
		<td>휴대번호</td>
		<td>${UserDTO.user_phone }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${UserDTO.user_email }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${UserDTO.user_birth }</td>
	</tr>
</table>
<input type="button" value="메인으로" class="btn" onclick="location.href='/main/main'">
<input type="button" value="정보수정" class="btn" onclick="location.href='/mypage/updateForm'">
<form action="/mypage/deleteMember" method="post">
    <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요" required>
    <input type="submit" value="회원탈퇴">
</form>
</body>
</html>