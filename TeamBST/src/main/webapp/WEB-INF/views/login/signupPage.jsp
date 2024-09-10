<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/signup.css" rel="stylesheet"> <!--signup.css 파일 연결 -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
    
  <!--  <script src="../resources/js/kakao_login.js"></script>  -->
   <!--  <script src="https://developers.kakao.com/sdk/kakao.min.js"></script>카카오 SDK 파일 -->
	
</head>
<body>
      <div class="signup-box">
	     <div class="logo"> 
	      	<a href="/admin/admin"> <img src="${pageContext.request.contextPath}/resources/images/logo1.png"
				alt="야모해" style="width: 100px; height: auto;"> <span
				class="hi-melody-regular">야모해~!</span>
			</a>
       	 </div><!-- <div class="logo"> --> 
		
        <!-- 경계선-->
        <hr class="hr-5">

        <h2>회원가입</h2> <!-- signup.jsp 연결 -->
        <form id="signupForm" action="/login/signupPage" method="post" >
            <div class="form-group">
               <!-- 이름 -->
                <div class="form-group">
                <label for="name"></label>
                <input type="text" class="in-b"  id="user_name" name="user_name" autocomplete="off" placeholder="이름 *"  >
                </div>

                 <!-- 아이디-->
                <label for="userid"></label>
                <div class="btn-group"> <!-- 아이디 중복확인 버튼-->
                  <input type="text" id="user_id" name="user_id" maxlength="16" placeholder="아이디 *">
                  <button type="button" class="check-button" name="idCheck" id="idCheck">중복확인</button>
                 </div>
            	
                <!-- 비밀번호-->
                <div class="form-group">
                <label for="user_pwd"></label>
                	<input type="password" class="in-b"  id="user_pwd" name="user_pwd" maxlength='16' placeholder="비밀번호(8~16자의 영문,숫자,특수기호) *"  >
                </div>
              <!-- 비밀번호 확인-->
                <label for="pwdCheck "></label>
				<div class="btn-group">
					<input class="in-b" type="password" id="pwdCheck" name="pwdCheck"
						placeholder="비밀번호 확인 *" required>
					<button type="button" class="button-primary" id="pwdDcheck">확인</button>
				</div>

				<div class="form-group">
				<fieldset>
					<legend>생년월일</legend>
					<label for="birth"></label> <input type="date" id="date"
						name="admin_birth" max="2077-06-20" min="1900-01-01">
				</fieldset>
				</div>
				
				<!--닉네임-->
				<label for="nickname"></label>
				<div class="btn-group">
					<!-- 닉네임 중복확인-->
					<input type="text" id="user_nick" name="user_nick" maxlength="12"
						placeholder="닉네임 *">
					<button type="button" class="check-button" name="nickCheck"
						id="nickCheck">중복확인</button>
				</div>

				<!-- 핸드폰-->
                <label for="phone"></label>
                <div class="btn-group">
                  <input type="text" id="user_phone" name="user_phone" placeholder="010-1234-5678">
                 	 <button type="button" class="check-button" id="phoneCheck" name="phoneCheck">중복확인</button> 
                </div>        
                
               
                <!-- 이메일 -->
                <label for="email"></label>
                <div class="btn-group"> <!-- 닉네임 중복확인-->
                  <input type="email" id="user_email" name="user_email"  placeholder="이메일 *" >
                  <button type="button" class="check-button" name="emailCheck" id="emailCheck" >중복확인</button>
                   <!-- <button type="button" class="verify-button" id="verifyCheck" >인증번호 전송</button>
            		    <div style="display: none;" class="sendCodeMessage">
                 			<b>인증 번호가 발송되었습니다</b>
						</div> -->
                </div>
                
        
            
             <!--    <!-- 이메일 인증번호 입력 칸-->
       <!--       <label for="verification"></label> 
                <div class="btn-group">
                  <input type="text" name="emailCode" id="emailCode">
                  	<button type="button" name="Demailcode" id="Demailcode"  value="인증번호 확인">확인</button>
                 	<div style="display:none;" class="successMessge">
						<b>인증 성공!</b>
                	</div>	
                </div>  -->
	     </div> 	<!-- div - form-group 끝-->

            <!-- 개인정보 수집 동의 체크 => 서비스 이용약관 -->
            <div class="terms">
              <label>
                <input type="checkbox" id="terms" name="user_info_agree"  value="Y">
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
                <button type="submit" id="signup-btn" class="signup-btn">가입하기</button>
              </label>
              <label>
                <button type="button" id="submit-btn" class="login-btn" onclick="location.href='/login/loginPage'">로그인</button>
              </label>
            </div>
        </form> <!-- signupForm-->
        <script>
        $(document).ready(function() {
            $('#pwdDcheck, #aidCheck, #aphoneCheck, #aemailCheck, #signup-btn, #login-btn').click(function() {
                $(this).toggleClass('clicked');
            });
        });
    </script>
        <script src="../resources/js/signup_script.js"></script>  
    </div> <!-- signup-box-->
</body>
</html>
	