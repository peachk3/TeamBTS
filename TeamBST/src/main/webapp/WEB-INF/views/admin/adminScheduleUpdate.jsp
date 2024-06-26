<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<style>
	.btn {
		border: 1px solid #ccc;
		margin-top: 10px;
		margin-bottom: 10px;
	}
</style>

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>SCHEDULE UPDATE</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">경기일정 수정</li>
				</ol>
			</div>
		</div>
	</div>
</section> 

<!--begin::Form-->
<form class="form" action="/admin/adminScheduleUpdate" method="post">
    <div class="card-body">
        <input type="hidden" name="game_id" value="${gScheduleOne.game_id}" />
        <div class="form-group">
            <label>홈팀
                <select name="home_team_id" id="hometeam" class="form-control form-control-solid">
                    <option value="NC" ${gScheduleOne.home_team_id == 'NC' ? 'selected' : ''}>NC 다이노스</option>
                    <option value="LOTTE" ${gScheduleOne.home_team_id == 'LOTTE' ? 'selected' : ''}>롯데 자이언츠</option>
                    <option value="LG" ${gScheduleOne.home_team_id == 'LG' ? 'selected' : ''}>LG 트윈스</option>
                    <option value="KT" ${gScheduleOne.home_team_id == 'KT' ? 'selected' : ''}>KT 위즈</option>
                    <option value="DOSAN" ${gScheduleOne.home_team_id == 'DOSAN' ? 'selected' : ''}>두산 베어스</option>
                    <option value="SAMSUNG" ${gScheduleOne.home_team_id == 'SAMSUNG' ? 'selected' : ''}>삼성 라이온즈</option>
                    <option value="HANHWA" ${gScheduleOne.home_team_id == 'HANHWA' ? 'selected' : ''}>한화 이글스</option>
                    <option value="KIA" ${gScheduleOne.home_team_id == 'KIA' ? 'selected' : ''}>기아 타이거즈</option>
                    <option value="KIWOOM" ${gScheduleOne.home_team_id == 'KIWOOM' ? 'selected' : ''}>키움 히어로즈</option>
                    <option value="SSG" ${gScheduleOne.home_team_id == 'SSG' ? 'selected' : ''}>SSG 랜더스</option>
                </select>
            </label>
        </div>
        <div class="form-group">
            <label>원정팀
                <select name="away_team_id" id="awayteam" class="form-control form-control-solid">
                    <option value="NC" ${gScheduleOne.away_team_id == 'NC' ? 'selected' : ''}>NC 다이노스</option>
                    <option value="LOTTE" ${gScheduleOne.away_team_id == 'LOTTE' ? 'selected' : ''}>롯데 자이언츠</option>
                    <option value="LG" ${gScheduleOne.away_team_id == 'LG' ? 'selected' : ''}>LG 트윈스</option>
                    <option value="KT" ${gScheduleOne.away_team_id == 'KT' ? 'selected' : ''}>KT 위즈</option>
                    <option value="DOSAN" ${gScheduleOne.away_team_id == 'DOSAN' ? 'selected' : ''}>두산 베어스</option>
                    <option value="SAMSUNG" ${gScheduleOne.away_team_id == 'SAMSUNG' ? 'selected' : ''}>삼성 라이온즈</option>
                    <option value="HANHWA" ${gScheduleOne.away_team_id == 'HANHWA' ? 'selected' : ''}>한화 이글스</option>
                    <option value="KIA" ${gScheduleOne.away_team_id == 'KIA' ? 'selected' : ''}>기아 타이거즈</option>
                    <option value="KIWOOM" ${gScheduleOne.away_team_id == 'KIWOOM' ? 'selected' : ''}>키움 히어로즈</option>
                    <option value="SSG" ${gScheduleOne.away_team_id == 'SSG' ? 'selected' : ''}>SSG 랜더스</option>
                </select>
            </label>
        </div>
        <div class="form-group">
            <label>날짜
                <input type="date" id="date" max="2077-06-20" min="2000-01-01" name="game_date" class="form-control form-control-solid" value="${gScheduleOne.game_date}">
            </label>
        </div>
        <div class="form-group">
            <label>시간
                <input type="time" id="time" min="14:00:00" max="19:00:00" name="game_time" class="form-control form-control-solid" value="${gScheduleOne.game_time}">
            </label>
        </div>
    </div>
    <div class="card-footer">
        <button type="submit" class="btn">등록하기</button>
        <button type="button" class="btn" onclick="location.href = '/admin/adminSchedule'">취소하기</button>
    </div>
</form>
<!--end::Form-->

<!--end::Card-->
<%@ include file="../include/footer.jsp"%>
</body>
</html>
