<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

	${sessionScope }



	<!-- 코드작성 -->

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

