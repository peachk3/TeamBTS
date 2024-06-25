<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1">
	<tr>
		<td>장소</td>
		<td>시작 시간</td>
		<td>날짜</td>
		<td>홈팀</td>
		<td>vs</td>
		<td>원정팀</td>
		<td>예매하기 버튼</td>
	</tr>

    <c:forEach var="vo" items="${homeTeamInfoList}">
        <tr>
            <td>${vo.stad_id}</td>
            <td>${vo.game_time}</td>
            <td>${vo.game_date}</td>
            <td>${vo.home_team_id}</td>
        </tr>
    </c:forEach>
    <c:forEach var="vo" items="${awayTeamInfoList}">
        <tr>
            <td>vs</td>
            <td>${vo.away_team_id}</td>
            <td><a href="/ticketing/stadium?stad_id=${vo.stad_id}&game_id=${game_id}">예매하기</a></td>
        </tr>
    </c:forEach>
</table>


<!-- 경기장 , 홈팀 ,어웨이 팀 사진  -->

<table border="1">
    <tr>
        <td>경기장 사진</td>
        <td>원정팀 사진</td>
        <td>홈팀 사진</td>
    </tr>

    <c:forEach var="vo" items="${homeTeamInfoList}">
        <tr>
			<td>
                <c:forEach var="team" items="${vo.teamList}">
                    <c:if test="${team.stad_id.equals(vo.stad_id)}">
                        <img alt="" src="${team.stad_url}" />
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach var="team" items="${vo.teamList}">
                        <img alt="Away Team Logo" src="${team.team_logo_url}" />
                </c:forEach>
            </td>
                </c:forEach>
            
            
            
			    <c:forEach var="vo" items="${awayTeamInfoList}">
            <td>
                <c:forEach var="team" items="${vo.teamList}">
                        <img alt="Home Team Logo" src="${team.team_logo_url}" />
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
</table>






</body>
</html>