<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    
      
      
      <button type="button" class="community" onclick="location.href='/mypage/mypage'">회원정보 조회</button> 
            <button type="button" class="community" onclick="location.href='/mypage/openMatchList'">예정 경기</button>
      <button type="button" class="community" onclick="location.href='/mypage/previousMatchList'">지난 경기</button> <br>
      <br>
      
      <button type="button" class="community" onclick="location.href='/mypage/myticket'">MY 티켓</button> <br>
      <button type="button" class="community" onclick="location.href='/mypage/mywrite'">MY 게시글</button>



      <br>

   	 ${user_id}
    
    
    
</body>
</html>