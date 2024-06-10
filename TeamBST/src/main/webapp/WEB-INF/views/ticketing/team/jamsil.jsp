<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="../../resources/css/index.css" rel="stylesheet">
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
    

          <form action="#">
            <select name="stadium" id="stad">
              <option value="select">구장을 선택하세요</option>
              <option value="gochuck">고척 스카이돔</option>
              <option value="gwangju">광주 챔피언스 필드</option>
              <option value="daegu">대구 라이온즈파크</option>
              <option value="daejun">대전 이글스파크</option>
              <option value="sajic">부산 사직야구장</option>
              <option value="jamsil" selected>서울 잠실야구장</option>
              <option value="suwon">수원 KT위즈파크</option>
              <option value="incheon">인천 랜더스필드</option>
              <option value="changwon">창원 NC파크</option>
            </select>
          </form>

        <br><br><br><br><br>
        예매할 경기 리스트~~~
        <a class="btn btn-primary" href="해당경기 예매 페이지" role="button">예매하기</a> <br>
        예매할 경기 리스트~~~
        <a class="btn btn-primary" href="해당경기 예매 페이지" role="button">예매하기</a> <br>
        예매할 경기 리스트~~~
        <a class="btn btn-primary" href="해당경기 예매 페이지" role="button">예매하기</a> <br>


</body>
</html>