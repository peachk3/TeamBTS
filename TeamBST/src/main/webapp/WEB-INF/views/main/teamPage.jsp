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

<body>
<section class="section schedule">
    <div class="container">
        <div class="row">
            <div class="col-12">

                <!-- 팀 로고와 경기장 이미지 -->
                <div class="table-container">
                    <table>
                        <tr>
                            <th>팀 로고</th>
                            <th>경기장</th>
                        </tr>
                        <c:forEach var="team" items="${TeamInfo}">
                            <tr>
                                <td><img class="team-logo" alt="Team Logo" src="${team.team_logo_url}" /></td>
                                <td><img class="stadium-img" alt="Team stadium" src="${team.stad_url}" /></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <!-- 경기 일정 테이블 -->
                <div class="table-container">
                    <table>
                        <tr>
                            <th>경기번호</th>
                            <th>경기일자</th>
                            <th>경기시작시간</th>
                            <th>구장</th>
                            <th>어웨이팀</th>
                            <th>홈팀</th>
                            <th>예매하기</th>
                        </tr>
                        <c:forEach var="vo" items="${GameScheduleList}">
                            <tr>
                                <td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_id}</a></td>
                                <td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_date}</a></td>
                                <td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_time}</a></td>
                                <td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.stad_id}</a></td>
                                <td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.away_team_id}</a></td>
                                <td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.home_team_id}</a></td>
                                <td><a href="/ticketing/stadium?stad_id=${vo.stad_id}&game_id=${vo.game_id}">예매하기</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

            </div>
        </div>
    </div>
</section>

<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="../resources/js/slide.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
