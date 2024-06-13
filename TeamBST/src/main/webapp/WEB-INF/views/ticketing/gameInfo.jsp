<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table border="1">
	<tr>
		<td>경기번호 ( 나중에 지워라 )</td>
		<td>장소</td>
		<td>시작 시간</td>
		<td>날짜</td>
		<td>원정팀</td>
		<td></td>
		<td>홈팀</td>
		<td>원정팀 사진</td>
		<td>홈팀 사진</td>
		<td>예매하기 버튼</td>
	</tr>



	<c:forEach var="vo" items="${gameInfoList}">
		<tr>
			<td>${vo.game_id}</td>
			<td>${vo.stad_id}</td>
			<td>${vo.game_time}</td>
			<td>${vo.game_date}</td>
			<td>${vo.away_team_id}</td>
			<td>vs</td>
			<td>${vo.home_team_id}</td>
			<td>원정팀 사진</td>
			<td>홈팀 사진</td>
			<td><a href="#">예매하기</a></td>
		</tr>
	</c:forEach>
</table>


<table border="1">
    <tr>
        <td>경기장 사진</td>
        <td>원정팀 사진</td>
        <td>홈팀 사진</td>
    </tr>

    <c:forEach var="vo" items="${gameInfoList}">
        <tr>
			<td>
                <c:forEach var="team" items="${vo.teamList}">
                    <c:if test="${team.stad_id == vo.stad_id}">
                        <img alt="" src="${team.stad_url}" />
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach var="team" items="${vo.teamList}">
                    <c:if test="${team.team_id == vo.away_team_id}">
                        <img alt="Away Team Logo" src="${team.team_logo_url}" />
                    </c:if>
                </c:forEach>
            </td>
            <td>
                <c:forEach var="team" items="${vo.teamList}">
                    <c:if test="${team.team_id == vo.home_team_id}">
                        <img alt="Home Team Logo" src="${team.team_logo_url}" />
                    </c:if>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
</table>

                        <img alt="Home Team Logo" src="../resources/team/samsung.png" />





</body>
</html>