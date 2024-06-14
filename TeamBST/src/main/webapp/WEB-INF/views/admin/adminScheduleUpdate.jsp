<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 홈페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="../resources/css/index.css" rel="stylesheet">
</head>
<body>
    <nav>
        <a href="/main/main"><h1>개바리조</h1></a>
        
        <h6>
          <a href="/login/login">로그인/</a>
          <a href="/mypage/mypage">마이페이지/</a>
          <a href="/admin/admin">관리자페이지/</a>
          로그인시간 ( 58: 00 ) 
        </h6>
      </nav>
  
      

      <ul class="nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/admin/adminSchedule">경기일정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminMember">회원</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminNotice">고객센터</a>
        </li>
      </ul>
      
      <hr>
	
	
	
	
	
	
	

	<!--begin::Card-->
	<div class="card card-custom gutter-b example example-compact">
		<div class="card-header">
			<h3 class="card-title">경기 일정 수정</h3>
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
					<label>홈팀 <select name="home_team_id" id="hometeam"
						class="form-control form-control-solid">
							<option value="NC">nc 다이노스</option>
							<option value="LOTTE">롯데 자이언츠</option>
							<option value="LG">LG 트윈스</option>
							<option value="KT">KT 위즈</option>
							<option value="DOSAN">두산 베어스</option>
							<option value="SAMSUNG">삼성 라이온즈</option>
							<option value="HANHWA">한화 이글스</option>
							<option value="KIA">기아 타이거즈</option>
							<option value="KIWOOM">키움 히어로즈</option>
							<option value="SSG">SSG 랜더스</option>
					</select></label>
				</div>
				<div class="form-group">
					<label>원정팀 <select name="away_team_id" id="awayteam"
						class="form-control form-control-solid">
							<option value="NC">nc 다이노스</option>
							<option value="LOTTE">롯데 자이언츠</option>
							<option value="LG">LG 트윈스</option>
							<option value="KT">KT 위즈</option>
							<option value="DOSAN">두산 베어스</option>
							<option value="SAMSUNG">삼성 라이온즈</option>
							<option value="HANHWA">한화 이글스</option>
							<option value="KIA">기아 타이거즈</option>
							<option value="KIWOOM">키움 히어로즈</option>
							<option value="SSG">SSG 랜더스</option>
					</select></label>
				</div>

				<div class="form-group">
					<label>날짜 <input type="date" id="date" max="2077-06-20"
						min="2000-01-01" name="game_date"
						class="form-control form-control-solid">
					</label>
				</div>

				<div class="form-group">
					<label>시간 <input type="time" id="date" min="14:00:00"
						max="19:00:00" value="18:30:00" name="game_time"
						class="form-control form-control-solid">
					</label>
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
</body>
</html>