<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
.headings{
	display: flex;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	font-weight: bold;
	background-color: #f0f0f0;
}
</style>


    <body class="body-wrapper">

<!--================================
=            Page Title            =
=================================-->

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>MY PAGE</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
				  <li class="breadcrumb-item active">내 정보 확인하기</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<!--====  End of Page Title  ====-->


<!--==============================
=            Schedule            =
===============================-->

<section class="section schedule">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="schedule-tab">
					<ul class="nav nav-pills text-center">
					  <li class="nav-item">
					    <a class="nav-link active" href="#nov20" data-toggle="pill">
					    	정보조회
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov21" data-toggle="pill">
							MY 티켓
					    </a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#nov22" data-toggle="pill">
							MY 게시글
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
					  			<div class="time" style="margin-left:30px">내 정보</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
					  				<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">-</i>
							  			<span class="time">아이디</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.user_id }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">비밀번호</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="masked-password">********</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- name -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">이름</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.user_name }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">닉네임</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.user_nick }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">휴대번호</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.user_phone }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">이메일</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.user_email }</span>
							  		</div>
					  			</div>
					  		</li>
					  		<!-- Schedule Details -->
					  		<li class="schedule-details">
					  			<div class="block">
						  			<!-- time -->
							  		<div class="time">
							  			<i class="fa fa">□</i>
							  			<span class="time">생년월일</span>
							  		</div>
							  		<!-- Speaker -->
							  		<div class="speaker">
										<span class="name">${resultDTO.user_birth }</span>
							  		</div>
					  			</div>
					  		</li>
					  	</ul>
					  </div>
					  <div class="tab-pane fade schedule-item" id="nov21">
					  <button type="button" id="Upcoming" value="Upcoming">예정 경기</button>
      				  <button type="button" id="Past" value="Past">지난 경기</button>
					  
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
					  <select name="boardTable_id" id="boardTable_id">
		<option value="All">전체 게시판</option>
		<option value="Community">거래 게시판</option>
		<option value="Bulletin">문의 게시판</option>
	</select>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
							  			<i class="fa fa">□</i>
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
					<div class="download-button text-center">
						<a href="/main/main" class="btn btn-main-md">메인으로</a>
						<a href="/mypage/updateForm" class="btn btn-main-md">정보수정</a>
						<a href="/mypage/deleteMember" class="btn btn-main-md">회원탈퇴</a>
					</div>
				
			</div>
		</div>
	</div>
</section>

<!--====  End of Schedule  ====-->


<%@ include file="../include/footer.jsp"%>

</body>
</html>