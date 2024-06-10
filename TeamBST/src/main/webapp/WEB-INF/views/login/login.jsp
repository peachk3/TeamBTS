<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인페이지</title>
        <link href="../resources/css/index.css" rel="stylesheet">
    
</head>
<body>
    <a href="/main/main"><h1>개바리조</h1></a>
    <h1>로그인 페이지</h1>


    <!-- 로직 만들기 -->
    <form action="main/main" method="post">
       <input type="text" name="id"><br>
       <input type="password" name="pw"><br>
        <input type="submit" value="로그인" >
    </form>
    <a href="findid.html">아이디 찾기</a> | 
    <a href="findpw.html">비밀번호 찾기</a> | 
    <a href="join.html">회원가입</a>
    <hr>
    
    <a href="api사용???">카카오 로그인</a>
     
</body>
</html>