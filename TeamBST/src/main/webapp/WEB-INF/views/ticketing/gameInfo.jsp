<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .stadium-img {
        width: 500px; /* 원하는 너비로 설정 */
        height: auto; /* 높이는 자동 조정 */
    }
    .team-logo {
        width: 100px; /* 원하는 너비로 설정 */
        height: auto; /* 높이는 자동 조정 */
    }
    .table-container {
        width: 100%;
        display: flex;
        justify-content: center;
        margin: 40px 20px; /* 위아래 여백 */
    }
    table {
        width: 80%; /* 테이블이 부모 요소의 80%를 차지하도록 설정 */
        border-collapse: collapse;
        margin: auto; /* 중앙 정렬 */
    }
    table, th, td {
        border: 1px solid #ccc;
    }
    th, td {
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #aac1f9; /* 첫 번째 행의 배경색을 #8080ff로 설정 */
        color: white; /* 텍스트 색상 */
    }
</style>

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>TICKETING</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">경기정보</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<body>
<section class="section schedule">
    <div class="container">
        <div class="row">
            <div class="col-12">

                <div class="table-container">
                    <table>
                        <tr>
                            <th>장소</th>
                            <th>시작 시간</th>
                            <th>날짜</th>
                            <th>홈팀</th>
                            <th>원정팀</th>
                            <th>예매하기</th>
                        </tr>
                        <c:forEach var="home" items="${homeTeamInfoList}" varStatus="status">
                            <c:forEach var="away" items="${awayTeamInfoList}" begin="${status.index}" end="${status.index}">
                                <tr>
                                    <td>${home.stad_id}</td>
                                    <td>${home.game_time}</td>
                                    <td>${home.game_date}</td>
                                    <td>${home.home_team_id}</td>
                                    <td>${away.away_team_id}</td>
                                    <td><a href="/ticketing/stadium?stad_id=${home.stad_id}&game_id=${home.game_id}">예매하기</a></td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                    </table>
                </div>
                <!-- 경기장, 홈팀, 어웨이 팀 사진 -->
				

                <div class="table-container">
                    <table>
                        <tr>
                            <th>경기장</th>
                            <th>원정팀</th>
                            <th>홈팀</th>
                        </tr>
                        <c:forEach var="home" items="${homeTeamInfoList}" varStatus="status">
                            <c:forEach var="away" items="${awayTeamInfoList}" begin="${status.index}" end="${status.index}">
                                <tr>
                                    <td>
                                        <c:forEach var="team" items="${home.teamList}">
                                            <c:if test="${team.stad_id.equals(home.stad_id)}">
                                                <img class="stadium-img" alt="Stadium" src="${team.stad_url}" />
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="team" items="${away.teamList}">
                                            <img class="team-logo" alt="Away Team Logo" src="${team.team_logo_url}" />
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="team" items="${home.teamList}">
                                            <img class="team-logo" alt="Home Team Logo" src="${team.team_logo_url}" />
                                        </c:forEach>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                    </table>
                </div>

            </div>
        </div>
    </div>
</section>

<%@ include file="../include/footer.jsp"%>
</body>
</html>
