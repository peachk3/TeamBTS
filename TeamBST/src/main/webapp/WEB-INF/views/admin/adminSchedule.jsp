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

      <button type="button" class="community" onclick="location.href='adminSchedule.html'">경기일정</button> <br>


      <button onclick="location.href='adminScheduleUpload.html'">등록</button>




</body>
</html>