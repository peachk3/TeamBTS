<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인페이지</title>
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
    
  <div class="hamburger-menu">
    <button id="hamburger-button" class="hamburger-button">
      ☰
    </button>
    <div id="hamburger-dropdown" class="hamburger-dropdown">
      <div class="menu-columns">
        <div class="menu-column">
          <p><a href="#stadium">구장</a></p>
          <a href="/ticketing/ticketing">고척 스카이돔</a>
          <a href="/ticketing/ticketing">광주 챔피언스 필드</a>
          <a href="/ticketing/ticketing">대구 라이온즈파크</a>
          <a href="/ticketing/ticketing">대전 이글스파크</a>
          <a href="/ticketing/ticketing">부산 사직야구장</a>
          <a href="/ticketing/ticketing">서울 잠실야구장</a>
          <a href="/ticketing/ticketing">수원 KT위즈파크</a>
          <a href="/ticketing/ticketing">인천 랜더스필드</a>
          <a href="/ticketing/ticketing">창원 NC파크</a>
        </div>
        <div class="menu-column">
          <p><a href="/main/team">구단</a></p>
          <a href="/main/team/kia">KIA</a>
          <a href="/main/team/lg">LG</a>
          <a href="/main/team/samsung">삼성</a>
          <a href="/main/team/dosan">두산</a>
          <a href="/main/team/ssg">SSG</a>
          <a href="/main/team/kt">KT</a>
          <a href="/main/team/hanhwa">한화</a>
          <a href="/main/team/lotte">롯데</a>
          <a href="/main/team/kiwoom">키움</a>
        </div>
      </div>
    </div>
  </div>
</nav>
    <hr>

    <!-- 주장 사진 슬라이드 -->
    <div class="container" id="slider2">
      <div class="slide show">
          <a href="/main/team/dosan"><img src="../resources/captain/dosan.jpg" alt="Image 11"></a>
          <a href="/main/team/hanhwa"><img src="../resources/captain/hanhwa.jpg" alt="Image 12"></a>
      </div>
      <div class="slide">
        <a href="/main/team/kia"><img src="../resources/captain/kia.jpg" alt="Image 13"></a>
        <a href="/main/team/kiwoom"><img src="../resources/captain/kiwoom.jpg" alt="Image 14"></a>
      </div>
      <div class="slide">
        <a href="/main/team/kt"><img src="../resources/captain/kt.jpg" alt="Image 15"></a>
        <a href="/main/team/lg"><img src="../resources/captain/lg.jpg" alt="Image 16"></a>
      </div>
      <div class="slide">
        <a href="/main/team/lotte"><img src="../resources/captain/lotte.jpg" alt="Image 17"></a>
        <a href="/main/team/nc"><img src="../resources/captain/nc.jpg" alt="Image 18"></a>
      </div>
      <div class="slide">
        <a href="/main/team/samsung"><img src="../resources/captain/samsung.jpg" alt="Image 19"></a>
        <a href="/main/team/ssg"><img src="../resources/captain/ssg.jpg" alt="Image 20"></a>
      </div>
  </div>
  <div class="navigation">
      <button onclick="showPrevious(1)">Previous</button>
      <button onclick="showNext(1)">Next</button>
  </div>
    
    <!-- 주장 사진 슬라이드 -->

    <br><br><br><br><br><br>
    
   <!-- 구장 슬라이드  -->
   
   <h2 id="stadium">구장 선택하기</h2>
   
   <div class="container" id="slider3">
    <div class="slide show">
       <a href="/ticketing/team/gochuck"> <img src="../resources/stadium/gochuck.webp" alt="Image 21"></a>
       <a href="/ticketing/team/gwangju"> <img src="../resources/stadium/gwangju.webp" alt="Image 22"></a>
       <a href="/ticketing/team/daegu"> <img src="../resources/stadium/daegu.webp" alt="Image 23"></a>
    </div>
    <div class="slide">
      <a href="/ticketing/team/daejun"> <img src="../resources/stadium/daejun.webp" alt="Image 24"></a>  
      <a href="/ticketing/team/sajic"> <img src="../resources/stadium/sajic.webp" alt="Image 25"></a> 
      <a href="/ticketing/team/suwon"> <img src="../resources/stadium/suwon.webp" alt="Image 26"></a> 
    </div>
    <div class="slide">
      <a href="/ticketing/team/incheon"><img src="../resources/stadium/incheon.webp" alt="Image 27"></a>  
      <a href="/ticketing/team/jamsil"><img src="../resources/stadium/jamsil.webp" alt="Image 28"></a>  
      <a href="/ticketing/team/changwon"><img src="../resources/stadium/changwon.webp" alt="Image 29"></a>  
    </div>
</div>
<div class="navigation">
    <button onclick="showPrevious(2)">Previous</button>
    <button onclick="showNext(2)">Next</button>
</div>
   
   <!-- 구장 슬라이드  -->

    <script type="text/javascript" src="../resources/js/slide.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
</html>

