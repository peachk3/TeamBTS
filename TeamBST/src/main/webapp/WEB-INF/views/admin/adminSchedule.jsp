<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>




      <button type="button" class="community" onclick="location.href='/admin/adminSchedule'">경기일정</button> <br>
      
      <div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 10px">번호</th>
					<th>경기장</th>
					<th>팀</th>
					<th>날짜</th>
					<th>경기 시작 시간</th>
					<th>수정</th>
				</tr>
				<c:forEach var="dto" items="${gScheduleList}">
					<tr>
						<td>${dto.stad_id}</td>
						<td>${dto.stad_id}</td>
						<td>${dto.away_team_id} vs ${dto.home_team_id}</td>
						<td><fmt:formatDate value="${dto.game_date}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${dto.game_time}"
								pattern="HH:mm" /></td>
						<td><button onclick="location.href='/admin/adminScheduleUpdate'">수정</button></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>


      <button onclick="location.href='/admin/adminScheduleUpload'">등록</button>




</body>
</html>