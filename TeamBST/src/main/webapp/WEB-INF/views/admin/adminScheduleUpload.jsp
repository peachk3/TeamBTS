<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경기일정 업로드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="index.css" rel="stylesheet">
</head>
<body>
    <nav>
        <a href="main.html"><h1>개바리조</h1></a>
        
        <h6>
          <a href="login.html">로그인/</a>
          <a href="mypage.html">마이페이지/</a>
          <a href="admin.html">관리자페이지/</a>
          로그인시간 ( 58: 00 ) 
        </h6>
      </nav>
      <nav class="navbar bg-light">
        <form class="container-f uid justify-content-start">
          <button class="예매" type="button" onclick="location.href='adminSchedule.html'">경기일정</button>
          <button class="거래" type="button" onclick="location.href='adminMember.html'">회원</button>
          <button class="고객센터" type="button" onclick="location.href='adminNotice.html'">고객센터</button>
        </form>
        
      </nav>
      
      <hr>
      
      <ul class="nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="adminSchedule.html">경기일정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminMember.html">회원</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adminNotice.html">고객센터</a>
        </li>
      </ul>
      
      <hr>
          
          <form action="#">
            <select name="stadium" id="stad">
              <option value="select">경기장</option>
              <option value="gochuck">고척 스카이돔</option>
              <option value="gwangju">광주 챔피언스 필드</option>
              <option value="daegu">대구 라이온즈파크</option>
              <option value="daejun">대전 이글스파크</option>
              <option value="busan">부산 사직야구장</option>
              <option value="seoul">서울 잠실야구장</option>
              <option value="suwon">수원 KT위즈파크</option>
              <option value="incheon">인천 랜더스필드</option>
              <option value="changwon">창원 NC파크</option>
            </select>
            <select name="hometeam" id="hometeam">
              <option value="home">홈팀</option>
              <option value="nc">nc 다이노스</option>
              <option value="lotte">롯데 자이언츠</option>
              <option value="lg">LG 트윈스</option>
              <option value="kt">KT 위즈</option>
              <option value="dosan">두산 베어스</option>
              <option value="lions">삼성 라이온즈</option>
              <option value="hanhwa">한화 이글스</option>
              <option value="kia">기아 타이거즈</option>
              <option value="kia">키움 히어로즈</option>
              <option value="ssg">SSG 랜더스</option>

            </select>
            <select name="awayteam" id="awayteam">
              <option value="away">원정팀</option>
              <option value="nc">nc 다이노스</option>
              <option value="lotte">롯데 자이언츠</option>
              <option value="lg">LG 트윈스</option>
              <option value="kt">KT 위즈</option>
              <option value="dosan">두산 베어스</option>
              <option value="lions">삼성 라이온즈</option>
              <option value="hanhwa">한화 이글스</option>
              <option value="kia">기아 타이거즈</option>
              <option value="kia">키움 히어로즈</option>
              <option value="ssg">SSG 랜더스</option>


            </select>

          </form>
            <br><br><br>
		
<!-- 날짜 / 경기 시작 시간 / 좌석수 / 날씨 / 상태 카테고리 -->





          
		  <form action="community.html" method="post">

		    <label> 파일선택 <input type="file"> </label> <br><br>
			<input type="button" onclick="location.href='adminSchedule.html'" value="취소">
			<input type="button" onclick="location.href='adminSchedule.html'" value="등록"> <br>
		</form>
		
		
		</body>
</html>