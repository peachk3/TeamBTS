<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
          
          <form action="/admin/adminScheduleUpload" method="post">
			<select name="home_team_id" id="hometeam">
				<option disabled>홈팀</option>
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
            </select>
            <select name="away_team_id" id="awayteam">
				<option disabled>원정팀</option>
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
            </select>

            <br><br><br>
		
<!-- 날짜 / 경기 시작 시간 / 좌석수 / 날씨 / 상태 카테고리 -->
		

		<p name="game_date">날짜 : 
			<input type="date"
		           id="date"
		           max="2077-06-20"
		           min="2000-01-01"
		           value=<c:out value="${now}"/>>
		</p>
		
		<p name="game_time">시간 : 
			<input type="time"
		           id="date"			
				   min="14:00:00"
				   max="19:00:00"
				   value="18:30:00">
		</p>


			<input type="button" onclick="location.href='/admin/adminSchedule'" value="취소">
			<input type="submit"  value="등록"> <br>
		</form>
		
		
		</body>
</html>