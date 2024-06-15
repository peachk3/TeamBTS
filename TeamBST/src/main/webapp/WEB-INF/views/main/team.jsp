<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    

      <div class="container" id="slider1">
        <div class="slide show">
            <a href="/main/teamPage?team=ssg"><img src="../resources/team/ssg.png" alt="ssg"></a>
            <a href="/main/teamPage?team=kia"><img src="../resources/team/kia.png" alt="kia"></a>
            <a href="/main/teamPage?team=dosan"><img src="../resources/team/dosan.png" alt="dosan"></a>
            <a href="/main/teamPage?team=lotte"><img src="../resources/team/lotte.png" alt="lotte"></a>
            <a href="/main/teamPage?team=samsung"><img src="../resources/team/samsung.png" alt="sansung"></a>
        </div>
        <div class="slide">
            <a href="/main/teamPage?team=nc"><img src="../resources/team/nc.png" alt="nc"></a>
            <a href="/main/teamPage?team=lg"><img src="../resources/team/lg.png" alt="lg"></a>
            <a href="/main/teamPage?team=kt"><img src="../resources/team/kt.png" alt="kt"></a>
            <a href="/main/teamPage?team=kiwoom"><img src="../resources/team/kiwoom.png" alt="kiwoom"></a>
            <a href="/main/teamPage?team=hanhwa"><img src="../resources/team/hanhwa.png" alt="hanhwa"></a>
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