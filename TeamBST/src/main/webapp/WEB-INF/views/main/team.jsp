 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>10개구단</title>
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
        <a class="nav-link active" aria-current="page" href="/ticketing/ticketing">예매</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/community/community">거래</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/announcement/announcement">고객센터</a>
      </li>
    </ul>
    
    <hr>
    

      <div class="container" id="slider1">
        <div class="slide show">
            <a href="/main/team/ssg"><img src="../resources/team/ssg.png" alt="ssg"></a>
            <a href="/main/team/kia"><img src="../resources/team/kia.png" alt="kia"></a>
            <a href="/main/team/dosan"><img src="../resources/team/dosan.png" alt="dosan"></a>
            <a href="/main/team/lotte"><img src="../resources/team/lotte.png" alt="lotte"></a>
            <a href="/main/team/samsung"><img src="../resources/team/samsung.png" alt="sansung"></a>
        </div>
        <div class="slide">
            <a href="/main/team/nc"><img src="../resources/team/nc.png" alt="nc"></a>
            <a href="/main/team/lg"><img src="../resources/team/lg.png" alt="lg"></a>
            <a href="/main/team/kt"><img src="../resources/team/kt.png" alt="kt"></a>
            <a href="/main/team/kiwoom"><img src="../resources/team/kiwoom.png" alt="kiwoom"></a>
            <a href="/main/team/hanhwa"><img src="../resources/team/hanhwa.png" alt="hanhwa"></a>
        </div>
    </div>
    <div class="navigation">
        <button onclick="showPrevious(0)">Previous</button>
        <button onclick="showNext(0)">Next</button>
    </div>






    <script type="text/javascript" src="../resources/js/slide.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>