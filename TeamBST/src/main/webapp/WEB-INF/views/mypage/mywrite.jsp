<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      
      
      <button type="button" class="community" onclick="location.href='/mypage/mypage'">회원정보 조회</button> <br>
      <button type="button" class="community" onclick="location.href='/mypage/myticket'">MY 티켓</button> <br>
      <button type="button" class="community" onclick="location.href='/mypage/mywrite'">MY 게시글</button>


      <form action="#">
        <select name="state" id="state">
          <option value="all">전체 게시글</option>
          <option value="bulletin">문의 게시판</option>
          <option value="sell">거래 게시판</option>
        </select>





</body>
</html>