<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>

  <!-- 타이틀 -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>야모해</title>
  
  <!-- PLUGINS CSS STYLE -->
  <!-- Bootstrap -->
  <link href="${pageContext.request.contextPath }/resources/plugins/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
  <!-- Themefisher Font -->  
  <link href="${pageContext.request.contextPath }/resources/plugins/themefisher-font/style.css" type="text/css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="${pageContext.request.contextPath }/resources/plugins/font-awsome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
  <!-- Magnific Popup -->
  <link href="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.css" type="text/css" rel="stylesheet">
  <!-- Slick Carousel -->
  <link href="${pageContext.request.contextPath }/resources/plugins/slick/slick.css" type="text/css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/plugins/slick/slick-theme.css" type="text/css" rel="stylesheet">
  <!-- CUSTOM CSS -->
  <link href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css" rel="stylesheet">

  <!-- FAVICON -->
  <link href="${pageContext.request.contextPath }/resources/images/favicon.png" type="text/css" rel="stylesheet">
  
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
</head>

<body>
<nav>
			<c:choose>
				<c:when test="${empty sessionScope.user_id}">
					<!-- 로그인하지 않은 경우 -->
					<a href="/login/loginPage">로그인</a>
					<a href="/login/signupPage">회원가입</a>
				</c:when>
				<c:when test="${sessionScope.user_id == 'admin'}">
					<!-- 관리자일 경우 -->
					<a href="/admin/admin">마이페이지</a>
					<form id="logoutForm" action="${pageContext.request.contextPath}/login/logout" method="post" style="display: inline;">
                    <button type="submit" class="logout-button">로그아웃</button>
                    </form>
				</c:when>
				<c:otherwise>
					<!-- 일반사용자일 경우 -->
					<a href="/mypage/mypage">마이페이지</a>
					<form id="logoutForm" action="${pageContext.request.contextPath}/login/generalLogout" method="post" style="display: inline;">
                    <button type="submit" class="logout-button">로그아웃</button>
                    </form>
				</c:otherwise>
			</c:choose>
	
</nav>
<body class="body-wrapper">


<!--========================================
=            Navigation Section            =
=========================================-->

<nav class="navbar main-nav border-less fixed-top navbar-expand-lg p-0">
  <div class="container-fluid p-0">
      <!-- logo -->
      <a class="navbar-brand" href="/admin/adminMember">
        <img src="/resources/images/logo1.png" alt="logo">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="fa fa-bars"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link active" aria-current="page"
						href="/admin/adminSchedule">경기일정<span>/</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/adminMember">회원<span>/</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="/admin/adminNotice">고객센터</a></li>
				</ul>
				<c:choose>
					<c:when test="${empty sessionScope.user_id}">
						<!-- 로그인하지 않은 경우 -->
					<button onclick="location.href='/login/loginPage';"
							class="login-btn btn-1">로그인</button>
					<button onclick="location.href='/login/signupPage';"
							class="signup-btn btn-1">회원가입</button>
					</c:when>
					<c:when test="${sessionScope.user_id == 'admin'}">
						<!-- 관리자일 경우 -->
						<button onclick="location.href='/admin/admin';"
							class="login-btn btn-1">관리자페이지</button>
						<form id="logoutForm" action="${pageContext.request.contextPath}/login/adminLogout" method="post" style="display: inline;">
	                    	<button type="submit" class="signup-btn btn-1">로그아웃</button>
	                    </form>
					</c:when>
					<c:otherwise>
						<!-- 일반사용자일 경우 -->
						<button onclick="location.href='/mypage/mypage';"
							class="login-btn btn-1">마이페이지</button>
						<form id="logoutForm" action="${pageContext.request.contextPath}/login/generalLogout" method="post" style="display: inline;">
							<button type="submit" class="signup-btn btn-1">로그아웃</button>
						</form>
					</c:otherwise>
				</c:choose>
		<!-- 햄버거 메뉴 -->
		<div id="menuToggle">
	      <input type="checkbox" />
		      <span></span>
		      <span></span>
		      <span></span>
		      <ul id="menu">
        <li class="dropdown">
            <a class="dropdown-toggle" href="/main/main#stadium">구장  /  구단</a>
            <div class="dropdown-menu">
            	<div class="dropdown-column">
					<p><a href="/main/main#stadium" style="color:mediumslateblue;"><b>구장</b></a></p>            	
                    <a href="#" data-stadium-id="GC">고척 스카이돔</a>
                    <a href="#" data-stadium-id="GJ">광주 챔피언스 필드</a>
                    <a href="#" data-stadium-id="DG">대구 라이온즈파크</a>
                    <a href="#" data-stadium-id="DJ">대전 이글스파크</a>
                    <a href="#" data-stadium-id="SJ">부산 사직야구장</a>
                    <a href="#" data-stadium-id="JS">서울 잠실야구장</a>
                    <a href="#" data-stadium-id="SW">수원 KT위즈파크</a>
                    <a href="#" data-stadium-id="IC">인천 랜더스필드</a>
                    <a href="#" data-stadium-id="CW">창원 NC파크</a>
                </div>
                
            	<div class="dropdown-column">
                    <p><a href="/main/team" style="color:mediumslateblue;"><b>구단</b></a></p>
                    <a href="/main/teamPage?team_id=kia">KIA</a>
                    <a href="/main/teamPage?team_id=lg">LG</a>
                    <a href="/main/teamPage?team_id=samsung">삼성</a>
                    <a href="/main/teamPage?team_id=dosan">두산</a>
                    <a href="/main/teamPage?team_id=ssg">SSG</a>
                    <a href="/main/teamPage?team_id=kt">KT</a>
                    <a href="/main/teamPage?team_id=hanhwa">한화</a>
                    <a href="/main/teamPage?team_id=lotte">롯데</a>
                    <a href="/main/teamPage?team_id=kiwoom">키움</a>
                    <a href="/main/teamPage?team_id=nc">NC</a>
                </div>
            </div>
        </li>
		        <a href="/main/main"><li>Home</li></a>
		        <a href="#"><li>About</li></a>
		        <a href="#"><li>Info</li></a>
		      </ul>
	    </div>
      </div>
  </div>
</nav>
<hr>

<!-- Hidden form for POST request -->
<form id="stadiumForm" action="/ticketing/ticketing" method="post" style="display: none;">
    <input type="hidden" name="stad_id" id="stadiumInput">
</form>

   <script>
        document.addEventListener('DOMContentLoaded', function() {
            var dropdownToggle = document.querySelector('.dropdown-toggle');
            var dropdown = document.querySelector('.dropdown');

            dropdownToggle.addEventListener('click', function(e) {
                e.preventDefault();
                dropdown.classList.toggle('show');
            });

            document.addEventListener('click', function(e) {
                if (!dropdown.contains(e.target)) {
                    dropdown.classList.remove('show');
                }
            });
        });
        
        document.querySelectorAll('.dropdown-menu a[data-stadium-id]').forEach(anchor => {
            anchor.addEventListener('click', function(event) {
                event.preventDefault();
                const stadiumId = this.getAttribute('data-stadium-id');
                document.getElementById('stadiumInput').value = stadiumId;
                document.getElementById('stadiumForm').submit();
            });
        });
        
        document.querySelectorAll('.container a').forEach(anchor => {
            anchor.addEventListener('click', function(event) {
                event.preventDefault();
                const stadiumId = this.getAttribute('data-stadium-id');
                document.getElementById('stadiumInput').value = stadiumId;
                document.getElementById('stadiumForm').submit();
            });
        });
    </script>
<!--====  End of Navigation Section  ====-->