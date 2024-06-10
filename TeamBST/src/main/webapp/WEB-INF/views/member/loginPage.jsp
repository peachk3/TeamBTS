<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
 	<link href="../resources/css/login.css" rel="stylesheet">
     <script src="../resources/js/login_script.js"></script>
    
</head>
<body>
    <div class="login-box">
    <h2>Login</h2>
     <form action="./loginPage" method="post" id="login-form">

        <!-- 아이디 입력-->
        <label for="userId"></label>
        <input type="text" id="user_id" name="user_id" placeholder="아이디" required>

        <!-- 패스워드 입력-->
        <label for="userPwd"></label>
        <input type="password" id="user_pwd" name="user_pwd" maxsize='16' placeholder="비밀번호" required>

        <!-- 아이디 저장-->
        <div class="save-id">
            <input type="checkbox" id="rememberId" class="checked">
            <label for="rememberId">아이디 저장하기</label>
        </div>

        <!-- 로그인 버튼-->
        <input type="submit" value="로그인">

        <!-- 아이디찾기 비밀번호찾기 회원가입 화면 이동 버튼-->
        <div class="options">
            <a href="#">아이디 찾기</a> 
            <a href="#">비밀번호 찾기</a>
            <a href="signupPage">회원가입</a>
        </div>
    </form>

        <!-- 경계선-->
        <hr class="hr-5">

    <!-- 카카오톡 로그인 버튼 -->
    <button class="kakao-login-button" onclick="kakaoLogin()">
        <img src="../resources/img/kakao.png" alt="카카오 로그인 아이콘">
    </button>
    </div>
  

</body>
</html>