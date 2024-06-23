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
  <link href="${pageContext.request.contextPath }/resources/images/favicon.png" type="text/css" rel="shortcut icon">
  
  <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
  <style>
  	#nav { font-family:'arial'; }
	#nav ul{ width:100%; margin:0; padding:0; }
	#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:40px;}
	#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:100px; text-indent:30px; color:#000; font-weight:bold; text-decoration:none; }
	#nav ul.menu li a:hover{ background:#eee; }
	#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:#ccc; }
	#nav ul.menu li .sub a:hover{ background:#444; color:#fff; }
	</style>

  	}
  </style>
  	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#nav ul.sub").hide();
			$("#nav ul.menu li").click(function(){
				$("ul",this).slideToggle("fast");
			});
		});
	</script>
</head>

<body class="body-wrapper">


<!--========================================
=            Navigation Section            =
=========================================-->

<nav class="navbar main-nav border-less fixed-top navbar-expand-lg p-0">
  <div class="container-fluid p-0">
      <!-- logo -->
      <a class="navbar-brand" href="/main/main">
        <img src="/images/logo.png" alt="logo">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="fa fa-bars"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link"
						href="/ticketing/ticketing?stad_id=All">예매하기 <span>/</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/community/community">거래게시판<span>/</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="/announcement/announcement">고객센터</a></li>
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
						</form>
					</c:when>
					<c:otherwise>
						<!-- 일반사용자일 경우 -->
						<a href="/mypage/mypage">마이페이지</a>
						<form id="logoutForm" action="${pageContext.request.contextPath}/login/generalLogout" method="post" style="display: inline;">
							<button type="submit" class="signup-btn btn-1">로그아웃</button>
						</form>
					</c:otherwise>
				</c:choose>
				<div id="menuToggle">
	      <input type="checkbox" />
	      <span></span>
	      <span></span>
	      <span></span>
	      <ul id="menu">
	        <a href="#"><li>Home</li></a>
	        <a href="#"><li>Home</li></a>
	        <a href="#"><li>About</li></a>
	        <a href="#"><li>Info</li></a>
	        <a href="#"><li>Contact</li></a>
	        <a href="https://erikterwan.com/" target="_blank"><li>Show me more</li></a>
	      </ul>
	    </div>
      </div>
  </div>
</nav>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
</script>

<!--====  End of Navigation Section  ====-->