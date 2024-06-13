<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>거래게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="../resources/css/index.css" rel="stylesheet">
</head>

<body>
	<nav>
		<a href="/main/main"><h1>개바리조</h1></a>

		<h6>
			<a href="/login/login">로그인/</a> <a href="/mypage/mypage">마이페이지/</a> <a
				href="/admin/admin">관리자페이지/</a> 로그인시간 ( 58: 00 )
		</h6>
	</nav>


	<ul class="nav">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="/ticketing/ticketing">예매</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/community/community">거래</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/announcement/announcement">고객센터</a></li>
	</ul>

	<hr>

	<!--begin::Card-->
	<div class="card card-custom gutter-b example example-compact">
		<div class="card-header">
			<h3 class="card-title">거래 게시글 작성</h3>
			<div class="card-toolbar">
				<div class="example-tools justify-content-center">
					<span class="example-toggle" data-toggle="tooltip"
						title="View code"></span> <span class="example-copy"
						data-toggle="tooltip" title="Copy code"></span>
				</div>
			</div>
		</div>
		<!--begin::Form-->
		<form class="form">
			<div class="card-body">

				<div class="form-group">
					<label>제목 <input type="text" class="form-control form-control-solid"></label>
				</div>

				<div class="form-group">
					<label>거래방식 <select name="selltype" id="selltype">
							<option value="meet">직거래</option>
							<option value="send">티켓전송</option>
					</select></label>
				</div>
				<div class="form-group">
					<label>원정팀 <select name="stadium" id="stad">
							<option value="gochuck">고척 스카이돔</option>
							<option value="gwangju">광주 챔피언스 필드</option>
							<option value="daegu">대구 라이온즈파크</option>
							<option value="daejun">대전 이글스파크</option>
							<option value="busan">부산 사직야구장</option>
							<option value="seoul">서울 잠실야구장</option>
							<option value="suwon">수원 KT위즈파크</option>
							<option value="incheon">인천 랜더스필드</option>
							<option value="changwon">창원 NC파크</option>
					</select></label>
				</div>

				<div class="form-group">
					<label for="exampleTextarea">내용</label>
					<textarea class="form-control form-control-solid" rows="3"></textarea>
				</div>
				
				<div class="form-group">
					<label> 파일선택 <input type="file" class="form-control form-control-solid"></label>
				</div>
				

			</div>
			<div class="card-footer">
				<button type="reset" class="btn btn-primary mr-2">Submit</button>
				<button type="reset" class="btn btn-secondary">Cancel</button>
			</div>
		</form>
		<!--end::Form-->
	</div>
	<!--end::Card-->

	<form action="#"></form>
	<br>
	<br>
	<br>


	<form action="/community/community" method="post">

		 <br> <br> <input type="button"
			onclick="location.href='/community/community'" value="취소"> <input
			type="button" onclick="location.href='/community/community'"
			value="등록"> <br>
	</form>


</body>
</html>