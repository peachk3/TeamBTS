<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지난 경기 목록</title>
</head>
<body>
    <h1>지난 경기 목록</h1>
	<table border="1">
		<tr>
			<th>경기 날짜</th>
			<th>경기 시간</th>
			<th>경기장 ID</th>
			<th>홈 팀 ID</th>
			<th>원정 팀 ID</th>
		</tr>
		<tr>
			<td>${pMatchList.game_date}</td>
			<td>${pMatchList.game_time}</td>
			<td>${pMatchList.stad_id}</td>
			<td>${pMatchList.home_team_id}</td>
			<td>${pMatchList.away_team_id}</td>
		</tr>
	</table>
	<a href="/mypage/mypage">마이페이지로 돌아가기</a>
</body>
</html>