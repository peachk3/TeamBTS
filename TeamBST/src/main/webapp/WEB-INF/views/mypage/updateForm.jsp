<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>회원정보수정</legend>
		<form action="/mypage/updateForm" method="post" name="fr">
			아이디 <input type="text" name="user_id" value="${resultDTO.user_id }" readonly><br>
			비밀번호 <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요" required><br>
			이름 <input type="text" name="user_name" value="${resultDTO.user_name } "><br>
			닉네임<input type="text" name="user_nick" value="${resultDTO.user_nick } "><br>
			휴대번호<input type="text" name="user_phone" value="${resultDTO.user_phone }"><br>
			이메일 <input type="email" name="user_email" value="${resultDTO.user_email }"><br>
			생년월일<input type="date" name="user_birth" value="${resultDTO.user_birth }"><br>
			<input type="submit" class="btn" value="회원정보수정하기">
			<input type="button" class="btn" value="마이페이지" onclick="location.href='/mypage/mypage'">
		</form>
	</fieldset>
</body>
</html>