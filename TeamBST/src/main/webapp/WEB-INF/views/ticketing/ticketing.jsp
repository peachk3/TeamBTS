<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제하기 버튼</title>
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 포트원 결제 -->
</head>

<body>


	<form action="/ticketing/ticketing" method="post">
		<select name="stad_id" id="stad_id">
			<option value="All" ${selectedStadium == 'All' ? 'selected' : ''}>전체 구장</option>
			<option value="GC" ${selectedStadium == 'GC' ? 'selected' : ''}>고척 스카이돔</option>
			<option value="GJ" ${selectedStadium == 'GJ' ? 'selected' : ''}>광주 챔피언스 필드</option>
			<option value="DG" ${selectedStadium == 'DG' ? 'selected' : ''}>대구 라이온즈파크</option>
			<option value="DJ" ${selectedStadium == 'DJ' ? 'selected' : ''}>대전 이글스파크</option>
			<option value="SJ" ${selectedStadium == 'SJ' ? 'selected' : ''}>부산 사직야구장</option>
			<option value="JS" ${selectedStadium == 'JS' ? 'selected' : ''}>서울 잠실야구장</option>
			<option value="SW" ${selectedStadium == 'SW' ? 'selected' : ''}>수원 KT위즈파크</option>
			<option value="IC" ${selectedStadium == 'IC' ? 'selected' : ''}>인천 랜더스필드</option>
			<option value="CW" ${selectedStadium == 'CW' ? 'selected' : ''}>창원 NC파크</option>
		</select> 
		<input type="submit" value="검색">
	</form>

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

		<c:forEach var="vo" items="${TeamScheduleList}">
			<tr>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_date}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_time}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.stad_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.away_team_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.home_team_id}</a></td>
				<td><a href="/ticketing/stadium?game_id=${vo.game_id }&stad_id=${vo.stad_id}"> 예매하기</a></td>
<%-- 				<td><a href="/ticketing/stadium?stad_id=${vo.stad_id },${vo.game_id}">예매하기</a></td> --%>
			</tr>
		</c:forEach>

	</table>



</body>
</html>