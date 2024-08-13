<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    

      <div class="container" id="slider1">
        <div class="slide show">
            <a href="/TeamBST/main/teamPage?team_id=ssg"><img src="${pageContext.request.contextPath}/resources/team/ssg.png" alt="ssg"></a>
            <a href="/TeamBST/main/teamPage?team_id=kia"><img src="${pageContext.request.contextPath}/resources/team/kia.png" alt="kia"></a>
            <a href="/TeamBST/main/teamPage?team_id=dosan"><img src="${pageContext.request.contextPath}/resources/team/dosan.png" alt="dosan"></a>
            <a href="/TeamBST/main/teamPage?team_id=lotte"><img src="${pageContext.request.contextPath}/resources/team/lotte.png" alt="lotte"></a>
            <a href="/TeamBST/main/teamPage?team_id=samsung"><img src="${pageContext.request.contextPath}/resources/team/samsung.png" alt="sansung"></a>
        </div>
        <div class="slide">
            <a href="/TeamBST/main/teamPage?team_id=nc"><img src="${pageContext.request.contextPath}/resources/team/nc.png" alt="nc"></a>
            <a href="/TeamBST/main/teamPage?team_id=lg"><img src="${pageContext.request.contextPath}/resources/team/lg.png" alt="lg"></a>
            <a href="/TeamBST/main/teamPage?team_id=kt"><img src="${pageContext.request.contextPath}/resources/team/kt.png" alt="kt"></a>
            <a href="/TeamBST/main/teamPage?team_id=kiwoom"><img src="${pageContext.request.contextPath}/resources/team/kiwoom.png" alt="kiwoom"></a>
            <a href="/TeamBST/main/teamPage?team_id=hanhwa"><img src="${pageContext.request.contextPath}/resources/team/hanhwa.png" alt="hanhwa"></a>
        </div>
    </div>
    <div class="navigation">
        <button onclick="showPrevious(0)">Previous</button>
        <button onclick="showNext(0)">Next</button>
    </div>






    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slide.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


</body>
</html>