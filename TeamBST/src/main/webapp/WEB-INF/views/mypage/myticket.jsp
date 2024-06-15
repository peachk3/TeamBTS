<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    
      
      
      <button type="button" class="community" onclick="location.href='/mypage/mypage'">회원정보 조회</button> 
      <button type="button" class="community" onclick="location.href='/mypage/myticket?state=will'">예정 경기</button>
      <button type="button" class="community" onclick="location.href='/mypage/myticket?state=previous'">지난 경기</button> <br>
      <br>
      
      <button type="button" class="community" onclick="location.href='/mypage/myticket'">MY 티켓</button> <br>
      <button type="button" class="community" onclick="location.href='/mypage/mywrite'">MY 게시글</button>


      <br>

    	<c:choose>
    <c:when test="${not empty oMatchList}">
        <table border="1">
            <tr>
                <th>경기 날짜</th>
                <th>경기 시간</th>
                <th>경기장 ID</th>
                <th>홈 팀 ID</th>
                <th>원정 팀 ID</th>
            </tr>
            <c:forEach var="match" items="${oMatchList}">
                <tr>
                    <td>${match.game_date}</td>
                    <td>${match.game_time}</td>
                    <td>${match.stad_id}</td>
                    <td>${match.home_team_id}</td>
                    <td>${match.away_team_id}</td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
    <c:when test="${not empty pMatchList}">
        <table border="1">
            <tr>
                <th>경기 날짜</th>
                <th>경기 시간</th>
                <th>경기장 ID</th>
                <th>홈 팀 ID</th>
                <th>원정 팀 ID</th>
            </tr>
            <c:forEach var="match" items="${pMatchList}">
                <tr>
                    <td>${match.game_date}</td>
                    <td>${match.game_time}</td>
                    <td>${match.stad_id}</td>
                    <td>${match.home_team_id}</td>
                    <td>${match.away_team_id}</td>
                </tr>
            </c:forEach>
        </table>
    </c:when>
</c:choose>
    
    
    
</body>
</html>