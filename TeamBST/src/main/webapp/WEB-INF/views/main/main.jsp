<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

	${sessionScope }



	<!-- 코드작성 -->

    <!-- 주장 사진 슬라이드 -->
    <div class="captainContainer" id="slider2">
      <div class="slide show">
          <a href="/main/teamPage?team_id=dosan"><img src="../resources/captain/dosan.jpg" alt="Image 11"></a>
          <a href="/main/teamPage?team_id=hanhwa"><img src="../resources/captain/hanhwa.jpg" alt="Image 12"></a>
      </div>
      <div class="slide">
        <a href="/main/teamPage?team_id=kia"><img src="../resources/captain/kia.jpg" alt="Image 13"></a>
        <a href="/main/teamPage?team_id=kiwoom"><img src="../resources/captain/kiwoom.jpg" alt="Image 14"></a>
      </div>
      <div class="slide">
        <a href="/main/teamPage?team_id=kt"><img src="../resources/captain/kt.jpg" alt="Image 15"></a>
        <a href="/main/teamPage?team_id=lg"><img src="../resources/captain/lg.jpg" alt="Image 16"></a>
      </div>
      <div class="slide">
        <a href="/main/teamPage?team_id=lotte"><img src="../resources/captain/lotte.jpg" alt="Image 17"></a>
        <a href="/main/teamPage?team_id=nc"><img src="../resources/captain/nc.jpg" alt="Image 18"></a>
      </div>
      <div class="slide">
        <a href="/main/teamPage?team_id=samsung"><img src="../resources/captain/samsung.jpg" alt="Image 19"></a>
        <a href="/main/teamPage?team_id=ssg"><img src="../resources/captain/ssg.jpg" alt="Image 20"></a>
      </div>
  </div>
  <div class="navigation">
      <button onclick="showPrevious(1)">Previous</button>
      <button onclick="showNext(1)">Next</button>
  </div>
    
    <!-- 주장 사진 슬라이드 -->

    <br><br><br><br><br><br>
    
   <!-- 구장 슬라이드  -->
   
   
   <!-- 티켓팅 페이지 넘어갈때 id값 저장하기 -->
	<h2 id="stadium">구장 선택하기</h2>
   
    <div class="container" id="slider3">
        <div class="slide show">
            <a href="#" data-stadium-id="GC"><img src="../resources/stadium/gochuck.webp" alt="Image 21"></a>
            <a href="#" data-stadium-id="GJ"><img src="../resources/stadium/gwangju.webp" alt="Image 22"></a>
            <a href="#" data-stadium-id="DG"><img src="../resources/stadium/daegu.webp" alt="Image 23"></a>
        </div>
        <div class="slide">
            <a href="#" data-stadium-id="DJ"><img src="../resources/stadium/daejun.webp" alt="Image 24"></a>
            <a href="#" data-stadium-id="SJ"><img src="../resources/stadium/sajic.webp" alt="Image 25"></a>
            <a href="#" data-stadium-id="SW"><img src="../resources/stadium/suwon.webp" alt="Image 26"></a>
        </div>
        <div class="slide">
            <a href="#" data-stadium-id="IC"><img src="../resources/stadium/incheon.webp" alt="Image 27"></a>
            <a href="#" data-stadium-id="JS"><img src="../resources/stadium/jamsil.webp" alt="Image 28"></a>
            <a href="#" data-stadium-id="CW"><img src="../resources/stadium/changwon.webp" alt="Image 29"></a>
        </div>
    </div>

    <form id="stadiumForm" action="/ticketing/ticketing" method="post" style="display: none;">
        <input type="hidden" name="stad_id" id="stadiumInput">
    </form>
<div class="navigation">
    <button onclick="showPrevious(2)">Previous</button>
    <button onclick="showNext(2)">Next</button>
</div>
   
   <!-- 구장 슬라이드  -->




<!-- 속성값 전달 -->
    <script>
        document.querySelectorAll('.container a').forEach(anchor => {
            anchor.addEventListener('click', function(event) {
                event.preventDefault();
                const stadiumId = this.getAttribute('data-stadium-id');
                document.getElementById('stadiumInput').value = stadiumId;
                document.getElementById('stadiumForm').submit();
            });
        });
    </script>



    <script type="text/javascript" src="../resources/js/slide.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
</html>

