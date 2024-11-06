<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" -->
<!-- 	crossorigin="anonymous"> -->
<link href="../resources/css/index.css" rel="stylesheet">


<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>ANNOUNCEMENT</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">문의 게시글 작성</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<body>
<main>
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<div class="col-12">
	<!--begin::Card-->
	<div class="card card-custom gutter-b example example-compact">
			<div class="card-toolbar">
				<div class="example-tools justify-content-center">
					<span class="example-toggle" data-toggle="tooltip"
						title="View code"></span> <span class="example-copy"
						data-toggle="tooltip" title="Copy code"></span>
				</div>
			</div>
		<!--begin::Form-->
		<form class="form" action="/announcement/bulletinWrite" method="post">
			<div class="card-body">

				<div class="form-group">
					<label style="color: black; font-weight: bold;">제목 
					<input type="text" name="quest_sub" class="form-control form-control-solid"></label>
				</div>
				
				<div class="form-group">
					<label style="color: black; font-weight: bold;">공개/비공개 <select name="quest_public" id="selltype">
							<option value="Y">공개</option>
							<option value="N">비공개</option>
					</select></label>
				</div>

				<div class="form-group">
					<label style="color: black; font-weight: bold;">문의 유형 <select name="quest_cate" id="selltype">
							<option value="1">일반 문의</option>
							<option value="2">환불 문의</option>
							<option value="3">계정 문의</option>
							<option value="4">티켓 문의</option>
					</select></label>
				</div>
				

				<div class="form-group">
					<label for="exampleTextarea" style="color: black; font-weight: bold;">내용</label>
					<textarea class="form-control form-control-solid" rows="3"
						name="quest_cont"></textarea>
				</div>

				<div class="form-group">
					<label style="color: black; font-weight: bold;"> 파일선택 <input type="file" name="photo_url"
						class="form-control form-control-solid"></label>
				</div>


			</div>
			<div>
				<button type="submit" class="btn-main-md" style="margin-right: 10px; margin-bottom: 10px;">제출</button>
				<button type="reset" class="btn-white-md" style="margin-right: 10px; margin-bottom: 10px;" onclick="window.history.back();">취소</button>
			</div>
		</form>
		<!--end::Form-->
	</div>
	<!--end::Card-->
</div>
</div>
</div>
</section>
</main>
<%@ include file="../include/footer.jsp"%>
</body>
</html>