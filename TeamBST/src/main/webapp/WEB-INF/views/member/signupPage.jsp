<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="../resources/css/signup.css" rel="stylesheet"> <!--signup.css 파일 연결 -->
    <script src="../resources/js/signup_script.js"></script>
    <script src="https://developers.kakao.com/sdk/kakao.min.js"></script><!-- 카카오 SDK 파일-->
</head>
<body>
   
      <div class="signup-box">
        <div class="social-login">
            <p>kakao 계정으로 계속하기</p>
            <a href="javascript:kakaoLogin();"></a>
            <img src="../resources/img/kakao_signup_icon.png" alt="kakao image">
        </div><!-- social-login-->

        <!-- 경계선-->
        <hr class="hr-5">

        <h2>회원가입</h2> <!-- signup.jsp 연결 -->
        <form id="signupForm" action="/member/signupPage" method="post" onsubmit="return validateForm()">
            <div class="form-group">
               <!-- 이름 -->
                <div class="form-group">
                <label for="name"></label>
                <input type="text" class="in-b"  id="name" name="user_name" placeholder="이름 *" >
                </div>

                 <!-- 아이디-->
                <label for="username"></label>
                <div class="btn-group"> <!-- 아이디 중복확인 버튼-->
                  <input type="text" id="id" name="user_id" placeholder="아이디 *" >
                  <button type="button" class="check-button" onclick="checkDuplicate('id')">중복확인</button>
                 </div>
            
                <!-- 비밀번호-->
                <div class="form-group">
                <label for="password"></label>
                <input type="password" class="in-b"  id="password" name="user_pwd" maxsize='16' placeholder="비밀번호(8~16자의 영문,숫자,특수기호) *" >
                </div>
              <!-- 비밀번호 확인-->
                <label for="confirm-password"></label>
                <input class="in-b" type="password" id="confirm-password" name="user_confirm-password" placeholder="비밀번호 확인 *" >
    
                <!--닉네임-->
                <label for="nickname"></label>
                <div class="btn-group"> <!-- 닉네임 중복확인-->
                  <input type="text" id="nickname" name="user_nick" placeholder="닉네임 *" >
                  <button type="button" class="check-button" onclick="checkDuplicate('nickname')" >중복확인</button>
                </div>
                
                <!-- 이메일-->
                <label for="email"></label>
                <div class="btn-group">
                  <input type="email" id="email" name="user_email" placeholder="이메일 *">
                  <button type="button" class="check-button" onclick="checkDuplicate('email')">중복확인</button> 
                </div>        

                <!-- 휴대폰 번호-->
                <label for="phone"></label>
                <div class="btn-group">
                  <input type="tel" id="phone" name="user_phone" placeholder="휴대폰번호">
                  <button type="button" class="check-button" onclick="sendCode()">인증번호 전송</button> <!-- 휴대전화 인증번호 전송버튼-->
                </div>

                <!-- 휴대폰 인증번호 입력 칸-->
             <label for="verification"></label> 
                <div class="btn-group">
                  <input type="text" id="verification" name="verification" placeholder="인증번호 입력 *">
                  <button type="button" class="verifyCode" onclick="verifyCode()">확인</button>
                  <button type="button" class="resendCode" onclick="resendCode()">재전송</button>
                </div>
	           </div> 	<!-- div - form-group 끝-->

            <!-- 개인정보 수집 동의 체크 => 서비스 이용약관 -->
            <div class="terms">
              <label>
                <input type="checkbox" id="terms" name="user_info_agree"  value="1">
                (필수)개인정보 수집 및 이용에 동의
              </label>
            </div>
            
            <!-- 개인정보 유효기간 체크 => 개인정보 처리방침 -->
            <div class="privacy">
                <p>개인정보 유효기간 선택
                  <label><input type="radio" id="privacy-period" name="user_serv_agree" value="1" >1년</label>
                  <label><input type="radio" id="privacy-period"  name="user_serv_agree" value="2" >3년</label>
                  <label><input type="radio" id="privacy-period" name="user_serv_agree" value="3" >회원탙퇴시</label>
                </p>
            </div>
            
                <!-- 가입하기 & 로그인 버튼-->
            <div id="signup_n_login">
              <label>
                <button type="submit" id="submit-btn" class="submit-btn" >가입하기</button>
              </label>
              <label>
                <button type="button" id="submit-btn" class="login-btn" onclick="location.href='/member/loginPage'">로그인</button>
              </label>
            </div>
        </form> <!-- signupForm-->
    </div> <!-- signup-box-->
  
 
</body>
</html>