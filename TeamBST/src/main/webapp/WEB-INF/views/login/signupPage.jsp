<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="../resources/css/signup.css" rel="stylesheet"> <!--signup.css 파일 연결 -->
  <!--  <script src="../resources/js/kakao_login.js"></script>  -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/signup_script.js"></script>
    <script src="https://developers.kakao.com/sdk/kakao.min.js"></script><!-- 카카오 SDK 파일-->
</head>
<body>
	<h1><a href="/main/main">개바리조</a></h1>
   
      <div class="signup-box">
        <div class="social-login">
            <p>kakao 계정으로 계속하기</p>
            <a href="javascript:kakaoLogin();"></a>
            <img src="../resources/img/kakao_signup_icon.png" alt="kakao image">
        </div><!-- social-login-->

        <!-- 경계선-->
        <hr class="hr-5">

        <h2>회원가입</h2> <!-- signup.jsp 연결 -->
        <form id="signupForm" action="/login/signupPage" method="post" >
            <div class="form-group">
               <!-- 이름 -->
                <div class="form-group">
                <label for="name"></label>
                <input type="text" class="in-b"  id="user_name" name="user_name" autocomplete="off" placeholder="이름 *" >
                </div>

                 <!-- 아이디-->
                <label for="userid"></label>
                <div class="btn-group"> <!-- 아이디 중복확인 버튼-->
                  <input type="text" id="user_id" name="user_id" maxlength="16" placeholder="아이디 *">
                  <button type="button" class="check-button" name="idCheck" id="idCheck" >중복확인</button>
                 </div>
                
            	
                <!-- 비밀번호-->
                <div class="form-group">
                <label for="password"></label>
                <input type="password" class="in-b"  id="password" name="user_pwd" maxlength='16' placeholder="비밀번호(8~16자의 영문,숫자,특수기호) *" >
                </div>
              <!-- 비밀번호 확인-->
                <label for="confirm-password"></label>
                <input class="in-b" type="password" id="confirm-password" name="user_confirm-password" placeholder="비밀번호 확인 *" >
    
    		 <!-- 생년월일 -->
    			 <div class="form-group">
    			 <label for="birth"></label>
        		날짜 : <input type="date" id="date" max="2077-06-20" min="1900-01-01" name="user_birth">
    			 </div>
    			 
                <!--닉네임-->
                <label for="nickname"></label>
                <div class="btn-group"> <!-- 닉네임 중복확인-->
                  <input type="text" id="user_nick" name="user_nick" maxlength="12" placeholder="닉네임 *" >
                  <button type="button" class="check-button" name="nickCheck" id="nickCheck" >중복확인</button>
                </div>
                
                <!-- 이메일-->
                <label for="email"></label>
                <div class="btn-group">
                  <input type="email" id="user_email" name="user_email" placeholder="이메일 *">
                  <button type="button" class="check-button" name="emailCheck" id=emailCheck>중복확인</button> 
                </div>        

                <!-- 휴대폰 번호-->
                <label for="phone"></label>
                <div class="btn-group">
                  <input type="tel" id="phone" name="user_phone" placeholder="휴대폰번호">
                  <button type="button" class="sendCode" onclick="sendCode()" value="인증번호받기">인증번호 전송</button> <!-- 휴대전화 인증번호 전송버튼-->
               		<div style="display: none;" class="successMessage">
               			<b>인증 번호가 발송 되었습니다</b>
               		</div>
				</div>

                <!-- 휴대폰 인증번호 입력 칸-->
             <label for="verification"></label> 
                <div class="btn-group">
                  <input type="text" name="phoneCode" id="phoneCode">
                  	<button type="button" onclick="checkMessage()" value="인증번호 확인">확인</button>
                 	<div style="display:none;" class="successMessge">
						<b>인증 성공!</b>
                	</div>	
                  <button type="button" class="phoneCode" value="재전송" onclick="phoneCode()">재전송</button>
					<div style="display: none;" class="sendCodeMessage">
                 		<b>인증 번호가 발송되었습니다</b>
					</div>
                </div>
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
                <button type="submit" id="signupbtn" class="submit-btn">가입하기</button>
              </label>
              <label>
                <button type="button" id="submit-btn" class="login-btn" onclick="location.href='/login/loginPage'">로그인</button>
              </label>
            </div>
        </form> <!-- signupForm-->
    </div> <!-- signup-box-->
	<script>
	// 로그인 버튼 클릭 시 체크박스 검사
		$("#submit-btn").click(function(event) {
			if (!$("#terms").is(":checked")) {
				event.preventDefault(); // 폼 제출 방지
				alert("필수 체크 항목입니다");
			} else {
				// 여기서 폼을 제출할 수 있습니다.
				alert("회원가입 완료"); // 폼 제출 성공 시 메시지
			}
		});
		//----------------------------------------
		$("#user_name").click(function(event){
			checkName();
		})
		
		
		// 아이디 중복체크검사 
		$("#idCheck").click(function(event) {
			checkId();
		});
		
		// 닉네임 중복체크검사 
		$("#nickCheck").click(function(event) {
			checkNick();
		});
		
		//이메일 중복체크 검사
		$("#emailCheck").click(function(event){
			checkEmail();	
			alert("클릭");
		});
		
		
		//-------------------------------------------
		
		//이름유효성확인
		function regMemberName(user_name) { //이름--> 유효성
		   var regExp = /^[가-힣]{1,10}$/;
		   return regExp.test(user_name);
		}
		
		//아이디 유효성
		function regMemberid(user_id) { //아이디 //영문자 또는 숫자 조합  6~16자
			 if (user_id.indexOf(' ') >= 0) {
			        return false; // 공백 문자가 있는 경우 유효하지 않음
			    }
     	  		 var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,16}$/;
 		    		return regExp.test(user_id);   
		}
		
		//닉네임 유효성 
		function regMemberNick(user_nick){ //닉네임 // 공백,특수문자,숫자 제외 영어 한글 가능 3글자~12자
			var regExp =/^[a-zA-Z가-힣]{3,12}$/;
			return regExp.test(user_nick);
			
		}
		
		//이메일 유효성 
		function regMemberEmail(user_email){ //이메일 //공백, 특수문자,한글 제외 
			var regExp= /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			return regExp.test(user_email);
		}
		
		//--------------------------------------
		// 이름에서 valuechange 
		const user_name = document.getElementById("user_name");
		user_name.addEventListener("change", function(e) {
			var user_name = document.getElementById("user_name").value;
			
			regMemberName(user_name);
			if(!regMemberName(user_name)) {
                   //document.querySelector("#failid").style.display = "block";
                   document.getElementById("user_name").value = '';
                   alert('이름을 입력해주세요');
                   return;
                   
			}      
		}); 
		// 아이디박스에서 valuechange 
		const user_id = document.getElementById("user_id");
		user_id.addEventListener("change", function(e) {
			var user_id = document.getElementById("user_id").value;
			
			regMemberid(user_id);
			if(!regMemberid(user_id)) {
                   //document(이문서의).querySelector("#failid")(태그의 아이디, 클래스, 태그div, input 다 찾을수).style(스타일은).display(보이기/안보이기) = "block";(보이게)
                   //document(이문서의).getElementById(태그의 아이디에).value(값은) = '' 이야
                   document.getElementById("user_id").value = ''; 
                   alert('6~16자의 영문자와 숫자를 조합해서 입력해주세요. ');
                   return;
			}      
		}); 
		// 닉네임박스에서 valuechange 
		const user_nick = document.getElementById("user_nick");
		user_nick.addEventListener("change", function(e) {
			var user_nick = document.getElementById("user_nick").value;
			
			regMemberNick(user_nick);
			if(!regMemberNick(user_nick)) {
                   document.getElementById("user_nick").value = ''; 
                   alert('4~12자리 영어 또는 한글로 입력해주세요 ');
                   return;
			}      
		}); 

		//이메일박스에서 valuechange
		const user_email = document.getElementById("user_email");
		user_email.addEventListener("change", function(e) {
			var user_email = document.getElementById("user_email").value;
			
			regMemberEmail(user_email);
			if(!regMemberEmail(user_email)) {
                   document.getElementById("user_email").value = ''; 
                   alert('이메일을 입력해주세요 ');
                   return;
			}      
		}); 
		

	</script>
</body>
</html>
	