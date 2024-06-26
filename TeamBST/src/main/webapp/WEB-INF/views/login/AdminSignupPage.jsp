<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- <script src="../resources/js/adminSignup.js"></script> --><!-- adminSignup.js 파일연결 안 되서 jsp 파일에 다 집어넣음 -->

    <link href="${pageContext.request.contextPath }/resources/css/adminSignup.css" type="text/css" rel="stylesheet"> <!--signup.css 파일 연결 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
  
</head>
<body>
	<h1><a href="/main/main">개바리조</a></h1>
   
      <div class="signup-box">
  
        <h2>회원가입</h2> <!-- signup.jsp 연결 -->
        <form id="AdminSignupForm" action="/login/AdminSignupPage" method="post">
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
    		 		 
                <!-- 생년월일 -->
                <div class="form-group">
    			 <label for="birth"></label>
        		날짜 : <input type="date" id="date" max="2077-06-20" min="1900-01-01" name="admin_birth">
    			 </div>
                
                <!--닉네임-->
                 <label for="nickname"></label>
                <div class="btn-group"> <!-- 닉네임 중복확인-->
                  <input type="text" id="admin_nick" name="admin_nick" maxlength="12" placeholder="닉네임 *" >
                  <button type="button" class="check-button" name="anickCheck" id="anickCheck"  >중복확인</button>
                </div>
               
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
                   <button type="button" class="verify-button" id="verifyCheck" >인증번호 전송</button>
            		    <div style="display: none;" class="sendCodeMessage">
                 			<b>인증 번호가 발송되었습니다</b>
						</div>
                </div>      


              <!-- 이메일 인증번호 입력 칸-->
             <label for="verification"></label> 
                <div class="btn-group">
                  <input type="text" name="aemailCode" id="aemailCode">
                  	<button type="button" name="Demailcode" id="Demailcode"  value="인증번호 확인">확인</button>
                 	<div style="display:none;" class="successMessge">
						<b>인증 성공!</b>
                	</div>	
                </div>
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
                <button type="button" id="login-btn" class="login-btn" onclick="location.href='/login/AdminLoginPage'">로그인</button>
              </label>
            </div>
        </form> <!-- signupForm-->
    </div> <!-- signup-box-->
 
   <script>
  
				//이름
				function regMemberName(admin_name) {
					var regExp = /^[가-힣]{1,10}$/;
					return regExp.test(admin_name);
				}

				function checkName() {
					var admin_name = $('#admin_name').val();
					if (!regMemberName(admin_name)) {
						$('#admin_name').val('');
						alert('유효하지 않은 이름입니다.');
					} else {
						alert('사용가능한 이름입니다. ');
					}
				}

				// 이름 필드에서 포커스가 벗어날 때마다 checkName 함수를 호출합니다.
				$('#admin_name').on('blur', function() {
					checkName();
				});
				//아이디
				function regMemberId(admin_id) { // 아이디는 영문자 또는 숫자 조합 6~16자
					if (admin_id.indexOf(' ') >= 0) {
						return false; // 공백 문자가 있는 경우 유효하지 않음
					}
					var regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,16}$/;
					return regExp.test(admin_id);
				}

				// 아이디 중복체크
				$('#aidCheck').click(function(event) {
					var id = document.getElementById("admin_id").value;

					if (!regMemberId(id)) {
						document.getElementById("admin_id").value = '';
						alert('6~16자의 영문자와 숫자를 조합해서 입력해주세요.');
						return;
					} else {
						$.ajax({
							url : '/login/aidCheck?admin_id=' + id, // Controller에서 요청 받을 주소
							type : 'get', // get 방식으로 전달
							success : function(res) { // 컨트롤러에서 넘어온 cnt값을 받는다
								if (res == 0) {
									alert('사용 가능한 아이디입니다.');
								} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
									alert("이미 존재하는 아이디입니다.");
									$('#admin_id').val('');
								}
							},
							error : function() {
								alert("에러입니다");
							}
						});
					}
				});

				//닉네임
				//닉네임 유효성 검사
				function regMemberNick(admin_nick) { //닉네임 // 공백,특수문자,숫자 제외 영어 한글 가능 3글자~12자
					var regExp = /^[a-zA-Z가-힣]{3,12}$/;
					return regExp.test(admin_nick);
				}

				//닉네임 중복체크

				$('#anickCheck').click(function(event) {
					var nick = document.getElementById("admin_nick").value;
					regMemberNick(nick);

					if (!regMemberNick(nick)) {
						document.getElementById("admin_nick").value = '';
						alert('4~12자리 영어 또는 한글로 입력해주세요 ');
						return;

					} else {
						$.ajax({
							url : '/login/anickCheck?admin_nick=' + nick, //Controller에서 요청 받을 주소
							type : 'get', //get 방식으로 전달
							success : function(res) { //컨트롤러에서 넘어온 cnt값을 받는다 
								if (res == 0) {
									alert('사용 가능한 닉네임입니다. ');
								} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
									alert("이미 존재하는 닉네임입니다. ");
									$('#admin_nick').val(''); //입력란 초기화
								}
							},
							error : function() {
								alert("시스템 에러입니다");
							}
						});
					}
					;
				});

				//비밀번호		
				//패스워드 유효성
				function regMemberPassword(admin_pwd) { //패스워드 //8~16자 영문,숫자,특수기호 숫자최소 1 특수기호최소 1
					var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
					return regExp.test(admin_pwd);
				}
				$('.button-primary').click(function(event) {
					event.preventDefault(); // 폼 제출 막기
					var apwd = document.getElementById("admin_pwd").value;
					var cpwd = document.getElementById("apwdCheck").value;

					if (!regMemberPassword(apwd)) {
						document.getElementById("admin_pwd").value = '';
						alert('비밀번호는 8~16자의 영문, 숫자, 특수기호를 포함해야 합니다.');
						return;
					}
					if (apwd != cpwd) {
						document.getElementById("apwdCheck").value = '';
						alert('비밀번호가 일치하지 않습니다.');
						return;
					} else {
						alert('비밀번호가 일치합니다.');
					}
				});

				//핸드폰
				//핸드폰 유효성 
				$(document)
						.ready(
								function() {
									let isPhoneVerified = false; // 중복 확인 여부 저장

									function regMemberPhone(phone) {
										var regExp = /^010-\d{4}-\d{4}$/;
										return regExp.test(phone);
									}

									function checkPhone() {
										var phone = document
												.getElementById("admin_phone").value;
										if (!regMemberPhone(phone)) {
											document
													.getElementById("admin_phone").value = '';
											alert('유효하지 않은 핸드폰 번호입니다.');
											return;
										}

										$
												.ajax({
													url : '/login/aphoneCheck',
													type : 'get',
													data : {
														admin_phone : phone
													},
													success : function(res) {
														if (res == 0) {
															alert('유효한 핸드폰 번호입니다.');
														} else {
															alert("이미 사용하고 있는 핸드폰 번호입니다.");
															$('#admin_phone')
																	.val('');
														}
													},
													error : function() {
														alert("시스템 에러입니다");
													}
												});
									}

									$('#aphoneCheck').click(function(event) {
										event.preventDefault();
										checkPhone();
									});

									// 이메일 유효성 검사
									function regMemberEmail(admin_email) { //이메일 //공백, 특수문자,한글 제외 
										var regExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
										return regExp.test(admin_email);
									}

									// 이메일 중복 체크
									$('#aemailCheck')
											.click(
													function(event) {
														event.preventDefault();
														var email = document
																.getElementById("admin_email").value;

														if (!regMemberEmail(email)) {
															$('#admin_email')
																	.val('');
															alert('유효한 이메일을 입력해주세요.');
															return;
														}

														$
																.ajax({
																	url : '/login/aemailCheck?admin_email='
																			+ email,
																	type : 'get', //get 방식으로 전달
																	success : function(
																			res) {
																		if (res == 0) {
																			alert('사용 가능한 이메일입니다.');
																		} else if (res == 1) { // cnt가 1일 경우 -> 이미 존재하는 이메일
																			alert("이미 사용하고 있는 이메일입니다.");
																			$(
																					'#admin_email')
																					.val(
																							'');
																		} else {
																			alert("유효하지 않은 이메일 형식입니다.");
																		}
																	},
																	error : function() {
																		alert("시스템 에러입니다");
																	}
																});
													});
								});
				$('#signup-btn')
						.click(
								function(event) {
									event.preventDefault(); // 기본 동작 방지

									// 폼 데이터 수집
									var formData = {
										admin_name : $('#admin_name').val(),
										admin_id : $('#admin_id').val(),
										admin_pwd : $('#admin_pwd').val(),
										apwdCheck : $('#apwdCheck').val(),
										admin_birth : $('#date').val(),
										admin_nick : $('#admin_nick').val(),
										admin_email : $('#admin_email').val(),
										admin_phone : $('#admin_phone').val(),
										aemailCode : $('#aemailCode').val(),
										admin_info_agree : $('#terms').is(
												':checked') ? 'Y' : 'N',
									};

									// AJAX 요청 보내기
									$.ajax({
										type : 'POST',
										url : '/login/AdminSignupPage',
										data : JSON.stringify(formData),
										contentType : 'application/json',
										success : function(response) {

										},
										error : function() {
											alert('시스템 오류가 발생했습니다.');
										}
									});
								});
			</script>
</body>
</html>