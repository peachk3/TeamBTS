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
        <li class="nav-item">
          <a class="nav-link" href="/ticketing/ticketing?stad_id=All">예매하기
            <span>/</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/community/community">거래게시판<span>/</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="sponsors.html">고객센터</a>
        </li>
      </ul>
      <button onclick="location.href='/login/loginPage';" class="login-btn btn-1">
        로그인
      </button>
      <button onclick="location.href='/login/signupPage';" class="signup-btn btn-1">
        회원가입
      </button>
      <div id="menuToggle">
	      <input type="checkbox" />
	      <span></span>
	      <span></span>
	      <span></span>
	      <ul id="menu">
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

<!--====  End of Navigation Section  ====-->



<!--============================
=            Banner            =
=============================-->

<section class="banner bg-banner-one overlay">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<!-- Content Block -->
				<div class="block">
					<h1>야모해</h1>
					<h2>ITWILL</h2>
					<h6>7강의실 2조</h6>
					<!-- Action Button -->
					<a href="/ticketing/ticketing?stad_id=All" class="btn btn-white-md">get ticket now</a>
				</div>
			</div>
		</div>
	</div>
</section>
	
<!--====  End of Banner  ====-->

<!--==============================
=            Schedule            =
===============================-->

<section class="section schedule">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-title">
					<h3>Event <span class="alternate">Schedule</span></h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusm tempor incididunt ut labore</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="schedule-tab">
					<ul class="nav nav-pills text-center">
					  <li class="nav-item">
					    <a class="nav-link active" href="#nov20" data-toggle="pill">
					    	Day-01
					    	<span>20 November 2017</span>
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov21" data-toggle="pill">
							Day-02
					    	<span>21 November 2017</span>
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov22" data-toggle="pill">
							Day-03
					    	<span>22 November 2017</span>
					    </a>
					  </li>
					</ul>
				</div>
				<div class="schedule-contents bg-schedule">
					<div class="tab-content" id="pills-tabContent">
					  <div class="tab-pane fade show active schedule-item" id="nov20">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">Time</div>
					  			<div class="speaker">Speaker</div>
					  			<div class="subject">Subject</div>
					  			<div class="venue">Venue</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">9.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-one.jpg" alt="speaker-thumb-one">
										<span class="name">Samanta Doe</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Introduction to Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium A</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">10.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-two.jpg" alt="speaker-thumb-two">
										<span class="name">Zerad Pawel</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Principle of Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium B</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">12.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-three.jpg" alt="speaker-thumb-three">
										<span class="name">Henry Mong</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Wp Requirements</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium C</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">2.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-four.jpg" alt="speaker-thumb-four">
										<span class="name">Baily Leo</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Introduction to Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium D</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">3.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-five.jpg" alt="speaker-thumb-five">
										<span class="name">Lee Mun</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Useful tips for Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium E</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">3.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-six.jpg" alt="speaker-thumb-six">
										<span class="name">Lee Mun</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Useful tips for Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium E</div>
					  			</div>
					  		</li>
					  	</ul>
					  </div>
					  <div class="tab-pane fade schedule-item" id="nov21">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">Time</div>
					  			<div class="speaker">Speaker</div>
					  			<div class="subject">Subject</div>
					  			<div class="venue">Venue</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">9.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-one.jpg" alt="speaker-thumb-one">
										<span class="name">Samanta Doe</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Introduction to Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium A</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">10.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-two.jpg" alt="speaker-thumb-two">
										<span class="name">Zerad Pawel</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Principle of Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium B</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">12.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-three.jpg" alt="speaker-thumb-three">
										<span class="name">Henry Mong</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Wp Requirements</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium C</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">2.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-four.jpg" alt="speaker-thumb-four">
										<span class="name">Baily Leo</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Introduction to Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium D</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">3.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-five.jpg" alt="speaker-thumb-five">
										<span class="name">Lee Mun</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Useful tips for Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium E</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">3.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-six.jpg" alt="speaker-thumb-six">
										<span class="name">Lee Mun</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Useful tips for Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium E</div>
					  			</div>
					  		</li>
					  	</ul>
					  </div>
					  <div class="tab-pane fade schedule-item" id="nov22">
					  	<!-- Headings -->
					  	<ul class="m-0 p-0">
					  		<li class="headings">
					  			<div class="time">Time</div>
					  			<div class="speaker">Speaker</div>
					  			<div class="subject">Subject</div>
					  			<div class="venue">Venue</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">9.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-one.jpg" alt="speaker-thumb-one">
										<span class="name">Samanta Doe</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Introduction to Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium A</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">10.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-two.jpg" alt="speaker-thumb-two">
										<span class="name">Zerad Pawel</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Principle of Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium B</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">12.00 AM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-three.jpg" alt="speaker-thumb-three">
										<span class="name">Henry Mong</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Wp Requirements</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium C</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">2.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-four.jpg" alt="speaker-thumb-four">
										<span class="name">Baily Leo</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Introduction to Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium D</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">3.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-five.jpg" alt="speaker-thumb-five">
										<span class="name">Lee Mun</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Useful tips for Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium E</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa-clock-o"></i>
							  			<span class="time">3.00 PM</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
							  			<img src="images/speakers/speaker-thumb-six.jpg" alt="speaker-thumb-six">
										<span class="name">Lee Mun</span>
							  		</div>
							  		<!-- Subject -->
							  		<div class="subject">Useful tips for Wp</div>
							  		<!-- Venue -->
							  		<div class="venue">Auditorium E</div>
					  			</div>
					  		</li>
					  	</ul>
					  </div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>

<!--====  End of Schedule  ====-->

<!--==============================
=              구장              =
===============================-->

<section class="section speakers bg-speaker overlay-lighter">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Title -->
				<div class="section-title white">
					<h3>구장</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 1 : 광주 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/gwangju.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=GJ&selectedStadium=GJ">광주 챔피언스필드</a></h5>
						<p>KIA타이거즈 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 2 : 대구 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/daegu.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=DG&selectedStadium=DG">대구 라이온즈파크</a></h5>
						<p>삼성라이온즈 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 3 : 대전 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/daejun.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=DJ&selectedStadium=DJ">대전 이글스파크</a></h5>
						<p>한화이글스 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 4 : 부산 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/sajic.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=SJ&selectedStadium=SJ">부산 사직야구장</a></h5>
						<p>롯데자이언츠 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 5 : 서울 잠실 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/jamsil.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=JS&selectedStadium=JS">서울 잠실야구장</a></h5>
						<p>LG트윈스 / 두산베어스 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 6 : 서울 고척 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/gochuck.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=GC&selectedStadium=GC">서울 고척스카이돔</a></h5>
						<p>키움히어로즈 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 7 : 수원 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/suwon.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=SW&selectedStadium=SW">수원 KT위즈파크</a></h5>
						<p>KT위즈 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 8 : 인천 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/incheon.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=IC&selectedStadium=IC">인천 랜더스필드</a></h5>
						<p>SSG랜더스 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 9 : 창원 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/stadium/changwon.webp" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="ticketing/ticketing?stad_id=CW&selectedStadium=CW">창원 NC파크</a></h5>
						<p>NC다이노스 홈구장</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!--==== 구장 선택 ====-->

<!--==============================
=              구단              =
===============================-->

<section class="section speakers bg-speaker overlay-lighter">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Title -->
				<div class="section-title white">
					<h3>구단</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 1 : LG -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/lg.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=lg">LG 트윈스</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 2 : KT -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/kt.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=kt">KT 위즈</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 3 : SSG -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/ssg.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=ssg">SSG 랜더스</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 4 : NC -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/nc.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=nc">NC 다이노스</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 5 : 두산 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/dosan.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=dosan">두산 베어스</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 6 : KIA -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/kia.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=kia">KIA 타이거즈</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 7 : 롯데 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/lotte.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=lotte">롯데 자이언츠</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 8 : 삼성 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/samsung.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=samsung">삼성 라이온즈</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 9 : 한화 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/hanhwa.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=hanhwa">한화 이글스</a></h5>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 10 : 키움 -->
				<div class="speaker-item">
					<div class="image">
						<img src="/resources/team/kiwoom.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="content text-center">
						<h5><a href="/main/teamPage?team_id=kiwoom">키움 히어로즈</a></h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!--==== 구단 선택 ====-->



<!--============================
=            Footer            =
=============================-->

<footer class="footer-main">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="block text-center">
            <div class="footer-logo">
              <img src="images/footer-logo.png" alt="logo" class="img-fluid">
            </div>
            <ul class="social-links-footer list-inline">
              <li class="list-inline-item">
                <a href="#"><i class="fa fa-facebook"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="#"><i class="fa fa-twitter"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="#"><i class="fa fa-instagram"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="#"><i class="fa fa-rss"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="#"><i class="fa fa-vimeo"></i></a>
              </li>
            </ul>
          </div>
          
        </div>
      </div>
    </div>
</footer>
<!-- Subfooter -->
<footer class="subfooter">
  <div class="container">
    <div class="row">
      <div class="col-md-6 align-self-center">
        <div class="copyright-text">
          <p><a href="#">ITWILL</a> &#169; 2024 All Right Reserved</p>
        </div>
      </div>
      <div class="col-md-6">
          <a href="#" class="to-top"><i class="fa fa-angle-up"></i></a>
      </div>
    </div>
  </div>
</footer>



  <!-- JAVASCRIPTS -->
  <!-- jQuey -->
  <script src="<c:url value="/resources/plugins/jquery/jquery.js"/>"></script>
  <!-- Popper js -->
  <script src="<c:url value="/resourcesplugins/popper/popper.min.js"/>"></script>
  <!-- Bootstrap 4 -->
  <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
  <!-- Smooth Scroll -->
  <script src="<c:url value="/resources/plugins/smoothscroll/SmoothScroll.min.js"/>"></script>  
  <!-- Isotope -->
  <script src="<c:url value="/resources/plugins/isotope/mixitup.min.js"/>"></script>  
  <!-- Magnific Popup -->
  <script src="<c:url value="/resources/plugins/magnific-popup/jquery.magnific-popup.min.js"/>"></script>
  <!-- Slick Carousel -->
  <script src="<c:url value="/resources/plugins/slick/slick.min.js"/>"></script>  
  <!-- SyoTimer -->
  <script src="<c:url value="/resources/plugins/syotimer/jquery.syotimer.min.js"/>"></script>
  <!-- Custom Script -->
  <script src="<c:url value="/resources/js/custom.js"/>"></script>
</body>

</html>



