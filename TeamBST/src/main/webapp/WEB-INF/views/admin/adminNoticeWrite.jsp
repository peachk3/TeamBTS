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

      
          
 	<form action="/admin/adminNoticeWrite" method="post">
  	
	  	작성자 : <input type="text" readonly name="${user_id }"> <br>
		제목 : <input type="text" name="notice_sub"> <br>
		내용 : <textarea rows="5" cols="30" name="notice_cont"></textarea> <br>
	    <label> 파일선택 <input type="file" name="photo_url"> </label> <br><br>
		<input type="button" onclick="location.href='/admin/adminNotice'" value="취소">
		<input type="submit" value="등록"> <br>
		
	</form>
		
		







</body>
</html>