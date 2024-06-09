<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마이페이지</title>
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
    
    
    <br>


 	 <input type="checkbox"> 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다 <br>

       


    <button type="button" class="withdraw" onclick="location.href='/mypage/mypage'">회원탈퇴</button>
    
    
    
    
</body>
</html>