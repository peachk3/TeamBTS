<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예정 경기 목록</title>
</head>
<body>

${oMatchList}
    <h1>예정 경기 목록</h1>
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
	<a href="/mypage/mypage">마이페이지로 돌아가기</a>
</body>
</html>