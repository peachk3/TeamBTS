<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
  <!-- adminSignup.js 파일연결 안 되서 jsp 파일에 다 집어넣음 -->
    <link href="../resources/css/adminSignup.css" rel="stylesheet"> <!--signup.css 파일 연결 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
 
    
  
</head>
<body>
	<div class="signup-box">
	     <div class="logo"> 
	      	<a href="/TeamBST/admin/admin"> <img src="../resources/images/logo1.png"
				alt="야모해" style="width: 100px; height: auto;"> <span
				class="hi-melody-regular">야모해~!</span>
			</a>
       	 </div><!-- <div class="logo"> --> 
		
        <!-- 경계선-->
        <hr class="hr-5">
        
        <h2>회원가입</h2> <!-- signup.jsp 연결 -->
        <form id="AdminSignupForm" action="/TeamBST/login/AdminSignupPage" method="post">
            <div class="form-group">
               <!-- 이름 -->
                <div class="form-group">
                <label for="name"></label>
                <input type="text" class="in-b"  id="admin_name" name="admin_name" autocomplete="off" placeholder="이름 *"  >
                </div>

                 <!-- 아이디-->
                <label for="adminid"></label>
                <div class="btn-group"> <!-- 아이디 중복확인 버튼-->
                  <input type="text" id="admin_id" name="admin_id" maxlength="16" placeholder="아이디 *">
                  <button type="button" class="check-button" name="aidCheck" id="aidCheck">중복확인</button>
                 </div>
            
                <!-- 비밀번호-->
                <div class="form-group">
                <label for="admin_pwd"></label>
                	<input type="password" class="in-b"  id="admin_pwd" name="admin_pwd" maxlength='16' placeholder="비밀번호(8~16자의 영문,숫자,특수기호) *"  >
                </div>
              <!-- 비밀번호 확인-->
                 <label for="pwdCheck "></label>
                	<div class="btn-group">
               	 		<input class="in-b" type="password" id="apwdCheck" name="apwdCheck" placeholder="비밀번호 확인 *" required >
               	 		<button type="button" class="button-primary" id = "pwdDcheck" >확인</button>
    		 		</div>
    		 		 
				<fieldset>
					<legend>생년월일</legend>
						<label for="birth"></label>
					 		<input type="date" id="date" name="admin_birth" max="2077-06-20" min="1900-01-01">
				</fieldset>

				<!-- 휴대폰 번호-->
                 <label for="phone"></label>
                <div class="btn-group">
                  <input type="text" id="admin_phone" name="admin_phone" placeholder="010-1234-5678">
                  <button type="button" class="check-button" id="aphoneCheck" name="aphoneCheck">중복확인</button> 
                </div>    
                
                   <!-- 이메일 -->
                <label for="email"></label>
                <div class="btn-group"> <!-- 닉네임 중복확인-->
                  <input type="email" id="admin_email" name="admin_email"  placeholder="이메일 *" >
                  <button type="button" class="check-button" name="aemailCheck" id="aemailCheck" >중복확인</button>
                 <!--   <button type="button" class="verify-button" id="verifyCheck" >인증번호 전송</button>
            		    <div style="display: none;" class="sendCodeMessage">
                 			<b>인증 번호가 발송되었습니다</b>
						</div> -->
                </div>      


              <!-- 이메일 인증번호 입력 칸-->
             <!-- <label for="verification"></label> 
                <div class="btn-group">
                  <input type="text" name="aemailCode" id="aemailCode">
                  	<button type="button" name="Demailcode" id="Demailcode"  value="인증번호 확인">확인</button>
                 	<div style="display:none;" class="successMessge">
						<b>인증 성공!</b>
                	</div>	
                </div> -->
	           </div> 	<!-- div - form-group 끝-->

            <!-- 개인정보 수집 동의 체크 => 서비스 이용약관 -->
            <div class="terms">
              <label>
                <input type="checkbox" id="terms" name="admin_info_agree" value="Y">
                (필수)개인정보 수집 및 이용에 동의  
              </label>
            </div>
	
			    <!-- 가입하기 & 로그인 버튼-->
            <div id="signup_n_login">
              <label>
                <button type="submit" id="signup-btn" class="signup-btn">가입하기</button>
              </label>
              <label>
                <button type="button" id="login-btn" class="login-btn" onclick="location.href='/TeamBST/login/AdminLoginPage'">로그인</button>
              </label>
            </div>
        </form> <!-- signupForm-->
    </div> <!-- signup-box-->
	 <script>
        $(document).ready(function() {
            $('#pwdDcheck, #aidCheck, #aphoneCheck, #aemailCheck, #signup-btn, #login-btn').click(function() {
                $(this).toggleClass('clicked');
            });
        });
    </script>
<script src="../resources/js/adminSignup.js"></script>
</body>
</html>