<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
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
			<h3 class="card-title">문의 게시글 작성</h3>
			<div class="card-toolbar">
				<div class="example-tools justify-content-center">
					<span class="example-toggle" data-toggle="tooltip"
						title="View code"></span> <span class="example-copy"
						data-toggle="tooltip" title="Copy code"></span>
				</div>
			</div>
		</div>
		<!--begin::Form-->
		<form class="form" action="/announcement/bulletinWrite" method="post">
			<div class="card-body">

				<div class="form-group">
					<label>제목 <input type="text" name="quest_sub"
						class="form-control form-control-solid"></label>
				</div>
				
				<div class="form-group">
					<label>공개/비공개 <select name="quest_public" id="selltype">
							<option value="Y">공개</option>
							<option value="N">비공개</option>
					</select></label>
				</div>

				<div class="form-group">
					<label>문의 유형 <select name="quest_cate" id="selltype">
							<option value="1">일반 문의</option>
							<option value="2">환불 문의</option>
							<option value="3">계정 문의</option>
							<option value="4">티켓 문의</option>
					</select></label>
				</div>
				

				<div class="form-group">
					<label for="exampleTextarea">내용</label>
					<textarea class="form-control form-control-solid" rows="3"
						name="quest_cont"></textarea>
				</div>

				<div class="form-group">
					<label> 파일선택 <input type="file" name="photo_url"
						class="form-control form-control-solid"></label>
				</div>


			</div>
			<div class="card-footer">
				<button type="submit" class="btn btn-primary mr-2">Submit</button>
				<button type="reset" class="btn btn-secondary" onclick="location.href='/admin/adminBulletin'">Cancel</button>
			</div>
		</form>
		<!--end::Form-->
	</div>
	<!--end::Card-->



</body>
</html>