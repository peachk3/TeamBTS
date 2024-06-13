<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

${gameInfoList}
	<table border="1">
		<tr>
			<td>구장 사진</td>
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

<%-- 				<td>${vo.stad_url}</td> --%>
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

	
<img alt="" src="../resources/stadium/daejun.webp">


</body>
</html>