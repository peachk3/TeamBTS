<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="../resources/css/adminLogin.css" rel="stylesheet">
     <script src="../resources/js/adminLogin_script.js"></script>
 <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>  -->  
     
     <%@ include file="../admin/admin.jsp" %>
</head>
<body>
	
	<a href="/main/main"><h1>개바리조</h1></a>
	
    <div class="login-box">
    <h2>Login</h2>
     <form id="loginForm" action="/login/AdminloginPage" method="post" >

        <!-- 아이디 입력-->
        <label for="adminId"></label>
        <input type="text" id="admin_id" name="admin_id" placeholder="아이디" required>
		
        <!-- 패스워드 입력-->
        <label for="adminPwd"></label>
        <input type="password" id="admin_pwd" name="admin_pwd" maxsize='16' placeholder="비밀번호" required>

   
        <!-- 로그인 버튼-->
        <input type="submit" id="login-btn" value="로그인" >
        <c:if test="${msg=='failure'}">
        	<div style="color: red">
        		아이디 또는 비밀번호가 일치하지 않습니다
        	</div>
        </c:if>
		
		<c:if test="${msg=='logout' }">
			<div style="color: red">
				로그아웃되었습니다
			</div>
		</c:if>
		
        <!-- 아이디찾기 비밀번호찾기 회원가입 화면 이동 버튼-->
        <div class="options">
            <a href="AdminFindid.html">아이디 찾기</a> 
            <a href="AdminFindpw.html">비밀번호 찾기</a>
            <a href="AdminSignupPage">회원가입</a>
        </div>
    </form>

    </div>
</body>
</html>