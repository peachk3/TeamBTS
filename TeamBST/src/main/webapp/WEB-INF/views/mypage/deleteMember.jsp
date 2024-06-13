<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
    <fieldset>
        <legend>회원탈퇴</legend>
        <form action="/mypage/deleteMember" method="post" name="fr">
            아이디 <input type="text" name="user_id" value="${userDTO.user_id}" readonly><br>
            비밀번호 <input type="password" name="user_pwd" placeholder="비밀번호를 입력하세요" required><br>
            <input type="submit" class="btn" value="회원탈퇴">
            <input type="button" class="btn" value="취소" onclick="history.back();">
        </form>
    </fieldset>
</body>
</html>
