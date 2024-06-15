<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/teamheader.jsp"%>



	<img src="../../resources/team/dosan.png" alt="dosan">
	<br>
	<img src="../../resources/stadium/jamsil.webp" alt="jamsil">




	<table border="1">
		<tr>
			<td>경기번호</td>
			<td>경기일자</td>
			<td>경기시작시간</td>
			<td>구장</td>
			<td>어웨이팀</td>
			<td>홈팀</td>
			<td>예매하기</td>
		</tr>

		<c:forEach var="vo" items="${GameScheduleList}">
			<tr>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_date}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_time}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.stad_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.away_team_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.home_team_id}</a></td>
				<td><a href="/ticketing/stadium?stad_id=${vo.stad_id }">예매하기</a></td>
			</tr>
		</c:forEach>

	</table>








	<script type="text/javascript" src="../resources/js/slide.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>