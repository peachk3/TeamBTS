<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--begin::Form-->
<form class="form" action="/admin/adminScheduleUpdate" method="post">
    <div class="card-body">
        <input type="hidden" name="game_id" value="${gScheduleList.game_id}" />
        <div class="form-group">
            <label>홈팀
                <select name="home_team_id" id="hometeam" class="form-control form-control-solid">
                    <option value="NC" ${gScheduleList.home_team_id == 'NC' ? 'selected' : ''}>NC 다이노스</option>
                    <option value="LOTTE" ${gScheduleList.home_team_id == 'LOTTE' ? 'selected' : ''}>롯데 자이언츠</option>
                    <option value="LG" ${gScheduleList.home_team_id == 'LG' ? 'selected' : ''}>LG 트윈스</option>
                    <option value="KT" ${gScheduleList.home_team_id == 'KT' ? 'selected' : ''}>KT 위즈</option>
                    <option value="DOSAN" ${gScheduleList.home_team_id == 'DOSAN' ? 'selected' : ''}>두산 베어스</option>
                    <option value="SAMSUNG" ${gScheduleList.home_team_id == 'SAMSUNG' ? 'selected' : ''}>삼성 라이온즈</option>
                    <option value="HANHWA" ${gScheduleList.home_team_id == 'HANHWA' ? 'selected' : ''}>한화 이글스</option>
                    <option value="KIA" ${gScheduleList.home_team_id == 'KIA' ? 'selected' : ''}>기아 타이거즈</option>
                    <option value="KIWOOM" ${gScheduleList.home_team_id == 'KIWOOM' ? 'selected' : ''}>키움 히어로즈</option>
                    <option value="SSG" ${gScheduleList.home_team_id == 'SSG' ? 'selected' : ''}>SSG 랜더스</option>
                </select>
            </label>
        </div>
        <div class="form-group">
            <label>원정팀
                <select name="away_team_id" id="awayteam" class="form-control form-control-solid">
                    <option value="NC" ${gScheduleList.away_team_id == 'NC' ? 'selected' : ''}>NC 다이노스</option>
                    <option value="LOTTE" ${gScheduleList.away_team_id == 'LOTTE' ? 'selected' : ''}>롯데 자이언츠</option>
                    <option value="LG" ${gScheduleList.away_team_id == 'LG' ? 'selected' : ''}>LG 트윈스</option>
                    <option value="KT" ${gScheduleList.away_team_id == 'KT' ? 'selected' : ''}>KT 위즈</option>
                    <option value="DOSAN" ${gScheduleList.away_team_id == 'DOSAN' ? 'selected' : ''}>두산 베어스</option>
                    <option value="SAMSUNG" ${gScheduleList.away_team_id == 'SAMSUNG' ? 'selected' : ''}>삼성 라이온즈</option>
                    <option value="HANHWA" ${gScheduleList.away_team_id == 'HANHWA' ? 'selected' : ''}>한화 이글스</option>
                    <option value="KIA" ${gScheduleList.away_team_id == 'KIA' ? 'selected' : ''}>기아 타이거즈</option>
                    <option value="KIWOOM" ${gScheduleList.away_team_id == 'KIWOOM' ? 'selected' : ''}>키움 히어로즈</option>
                    <option value="SSG" ${gScheduleList.away_team_id == 'SSG' ? 'selected' : ''}>SSG 랜더스</option>
                </select>
            </label>
        </div>
        <div class="form-group">
            <label>날짜
                <input type="date" id="date" max="2077-06-20" min="2000-01-01" name="game_date" class="form-control form-control-solid" value="${gScheduleList.game_date}">
            </label>
        </div>
        <div class="form-group">
            <label>시간
                <input type="time" id="time" min="14:00:00" max="19:00:00" name="game_time" class="form-control form-control-solid" value="${gScheduleList.game_time}">
            </label>
        </div>
    </div>
    <div class="card-footer">
        <button type="submit" class="btn btn-primary mr-2">Submit</button>
        <button type="button" class="btn btn-secondary" onclick="location.href = '/admin/adminSchedule'">Cancel</button>
    </div>
</form>
<!--end::Form-->

<!--end::Card-->
</body>
</html>
