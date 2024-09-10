<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>  -->  
	<link href="${pageContext.request.contextPath}/resources/css/adminLogin.css" rel="stylesheet"  />
     <script src="${pageContext.request.contextPath}/resources/js/adminLogin_script.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">

</head>
<body>
	<div class="logo">
		<a href="/admin/admin"> <img src="${pageContext.request.contextPath}/resources/images/logo1.png"
			alt="야모해" style="width: 100px; height: auto;"> <span
			class="hi-melody-regular">야모해~!</span>
		</a>
	</div>

	<div class="login-box">
		<h2>Login</h2>
		<form id="loginForm" action="/login/AdminLoginPage" method="post">

			<!-- 아이디 입력-->
			<label for="adminId"></label> <input type="text" id="admin_id"
				name="admin_id" placeholder="아이디" required>

			<!-- 패스워드 입력-->
			<label for="adminPwd"></label> <input type="password" id="admin_pwd"
				name="admin_pwd" maxlength='16' placeholder="비밀번호" required>

			<!-- 아이디 저장-->
			<div class="save-id">
				<input type="checkbox" id="rememberId" class="checked"> <label
					for="rememberId">아이디 저장하기</label>
			</div>

			<!-- 로그인 버튼-->
			<input type="submit" id="login-btn" value="로그인">

			<!-- 아이디찾기 비밀번호찾기 회원가입 화면 이동 버튼-->
			<div class="options">
				<a href="/login/AdminFindid">아이디 찾기</a> 
				<a href="/login/AdminFindpw">비밀번호찾기</a> 
				<a href="/login/AdminSignupPage">회원가입</a>
			</div>
		</form>

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
                if ($("#admin_id").val() && $("#admin_pwd").val()) {
                    $("input[type='submit']").addClass("active");
                } else {
                    $("input[type='submit']").removeClass("active");
                }
            }

            $("#admin_id, #admin_pwd").on("keyup change", toggleSubmitButton);

            var key = getCookie("key");
            $("#admin_id").val(key); 
              
            if($("#admin_id").val() != ""){
                $("#rememberId").attr("checked", true); 
            }
              
            $("#rememberId").change(function(){ 
                if($("#rememberId").is(":checked")){ 
                    setCookie("key", $("#user_id").val(), 7); 
                }else{ 
                    deleteCookie("key");
                }
            });
              
            $("#admin_id").keyup(function(){ 
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