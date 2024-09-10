<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
   <!--  <script src="../resources/js/signup_script.js"></script>   --> <!-- 경로 안 먹어서 jsp 파일에 코드 넣음 -->
    
 	<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     
     <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
    
</head>
<body>
	  <div  class="logo">
		<a href="/main/main">
			 <img src="${pageContext.request.contextPath}/resources/images/logo1.png" alt="야모해" style="width: 100px; height: auto;">
			 <span class="hi-melody-regular">야모해~!</span>
		</a>
	</div>	
	
    <div class="login-box">
  
    <h2>Login</h2>
     <form id="loginForm" action="/login/loginPage" method="post" >

        <!-- 아이디 입력-->
        <label for="userId"></label>
        <input type="text" id="user_id" name="user_id" placeholder="아이디" required>
		
        <!-- 패스워드 입력-->
        <label for="userPwd"></label>
        <input type="password" id="user_pwd" name="user_pwd" maxlength='16' placeholder="비밀번호" required>

        <!-- 아이디 저장-->
        <div class="save-id">
            <input type="checkbox" id="rememberId" class="checked" >
            <label for="rememberId">아이디 저장하기</label>
        </div>

        <!-- 로그인 버튼-->
         <input type="hidden" name="redirect" value="${param.redirect}">
        <input type="submit" value="로그인">

        <!-- 아이디찾기 비밀번호찾기 회원가입 화면 이동 버튼-->
        <div class="options">
            <a href="/login/findId">아이디 찾기</a> 
            <a href="/login/findPwd">비밀번호 찾기</a>
            <a href="/login/signupPage">회원가입</a>
        </div>
    </form>

<!--         경계선
        <hr class="hr-5">

    카카오톡 로그인 버튼
    <button class="kakao-login-button" onclick="kakaoLogin()">
        <img src="../resources/img/kakao.png" alt="카카오 로그인 아이콘">
    </button>
    
   -->
   </div>
   
   
 <script type="text/javascript">
        <%-- alertMessage가 존재할 경우에만 alert 창을 띄움 --%>
        <% if (session.getAttribute("alertMessage") != null) { %>
            alert("<%= session.getAttribute("alertMessage") %>");
        <% 
            // alert를 한 번 띄운 후 session에서 해당 메시지를 삭제
            session.removeAttribute("alertMessage");
           %>
        <% } %>
        
    </script>
    
    <!-- 아이디 저장  -->
    <script>
	  $(document).ready(function() {
            function toggleSubmitButton() {
                if ($("#user_id").val() && $("#user_pwd").val()) {
                    $("input[type='submit']").addClass("active");
                } else {
                    $("input[type='submit']").removeClass("active");
                }
            }

            $("#user_id, #user_pwd").on("keyup change", toggleSubmitButton);

            var key = getCookie("key");
            $("#user_id").val(key); 
              
            if($("#user_id").val() != ""){
                $("#rememberId").attr("checked", true); 
            }
              
            $("#rememberId").change(function(){ 
                if($("#rememberId").is(":checked")){ 
                    setCookie("key", $("#user_id").val(), 7); 
                }else{ 
                    deleteCookie("key");
                }
            });
              
            $("#user_id").keyup(function(){ 
                if($("#rememberId").is(":checked")){ 
                    setCookie("key", $("#user_id").val(), 7); 
                }
            });
        });
          
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
          
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
          
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1) end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
	</script>

</body>
</html>