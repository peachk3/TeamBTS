<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<style>
.h3 {
	color: #00000;
}

</style>
<!--============================
=            Banner            =
=============================-->

<div class="slider">
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
</div>
	
<!--====  End of Banner  ====-->


<!--==============================
=              구장              =
===============================-->

<section class="section speakers bg-speaker overlay-lighter">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Title -->
				<div class="section-title white">
					<h2>구장</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 1 : 광주 -->
				<div class="speaker-item">
					<div class="image">
 					<a href="/ticketing/ticketing?stad_id=GJ&selectedStadium=GJ"><img src="${pageContext.request.contextPath}/resources/stadium/gwangju.webp" alt="speaker" class="img-fluid"> </a>
<!-- 						<div class="team_logo no_css" style="background-image:url(/data/team/ci/2024/2002.svg"></div> -->
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
						<a href="/ticketing/ticketing?stad_id=DG&selectedStadium=DG"><img src="${pageContext.request.contextPath}/resources/stadium/daegu.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=DG&selectedStadium=DG">대구 라이온즈파크</a></h5>
						<p>삼성라이온즈 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 3 : 대전 -->
				<div class="speaker-item">
					<div class="image">
						<a href="/ticketing/ticketing?stad_id=DJ&selectedStadium=DJ"><img src="${pageContext.request.contextPath}/resources/stadium/daejun.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=DJ&selectedStadium=DJ">대전 이글스파크</a></h5>
						<p>한화이글스 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 4 : 부산 -->
				<div class="speaker-item">
					<div class="image">
						<a href="/ticketing/ticketing?stad_id=SJ&selectedStadium=SJ"><img src="${pageContext.request.contextPath}/resources/stadium/sajic.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=SJ&selectedStadium=SJ">부산 사직야구장</a></h5>
						<p>롯데자이언츠 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 5 : 서울 잠실 -->
				<div class="speaker-item">
					<div class="image">
						<a href="/ticketing/ticketing?stad_id=JS&selectedStadium=JS"><img src="${pageContext.request.contextPath}/resources/stadium/jamsil.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=JS&selectedStadium=JS">서울 잠실야구장</a></h5>
						<p>LG트윈스 / 두산베어스 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 6 : 서울 고척 -->
				<div class="speaker-item">
					<div class="image">
						<a href="/ticketing/ticketing?stad_id=GC&selectedStadium=GC"><img src="${pageContext.request.contextPath}/resources/stadium/gochuck.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=GC&selectedStadium=GC">서울 고척스카이돔</a></h5>
						<p>키움히어로즈 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 7 : 수원 -->
				<div class="speaker-item">
					<div class="image">
						<a href="/ticketing/ticketing?stad_id=SW&selectedStadium=SW"><img src="${pageContext.request.contextPath}/resources/stadium/suwon.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=SW&selectedStadium=SW">수원 KT위즈파크</a></h5>
						<p>KT위즈 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 8 : 인천 -->
				<div class="speaker-item">
					<div class="image">
						<a href="/ticketing/ticketing?stad_id=IC&selectedStadium=IC"><img src="${pageContext.request.contextPath}/resources/stadium/incheon.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=IC&selectedStadium=IC">인천 랜더스필드</a></h5>
						<p>SSG랜더스 홈구장</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구장 9 : 창원 -->
				<div class="speaker-item">
					<div class="image">
						<a href="/ticketing/ticketing?stad_id=CW&selectedStadium=CW"><img src="${pageContext.request.contextPath}/resources/stadium/changwon.webp" alt="speaker" class="img-fluid"></a>
					</div>
					<div class="content text-center">
						<h5><a href="/ticketing/ticketing?stad_id=CW&selectedStadium=CW">창원 NC파크</a></h5>
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
					<h2>구단</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<!-- 구단 1 : LG -->
				<div class="speaker-item">
					<div class="image">
						<img src="${pageContext.request.contextPath}/resources/team/lglg.png" alt="speaker" class="img-fluid">
						<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/lgtwinsbaseballclub/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/ktkt.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/ktwiz.pr/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/ssgssg.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/ssglanders.incheon/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/ncnc.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/ncdinos2011/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/dosandosan.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/doosanbears.1982/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/kiakia.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/always_kia_tigers/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/lottelotte.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/busanlottegiants/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/samsungsamsung.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/samsunglions_baseballclub/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/hanhwahanhwa.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/hanwhaeagles_soori/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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
						<img src="${pageContext.request.contextPath}/resources/team/kiwoomkiwoom.png" alt="speaker" class="img-fluid">
					<div class="primary-overlay"></div>
						<div class="socials">
							<ul class="list-inline">
								<li class="list-inline-item"><a href="https://www.instagram.com/heroesbaseballclub/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
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

<%@ include file="../include/footer.jsp"%>
</body>

</html>