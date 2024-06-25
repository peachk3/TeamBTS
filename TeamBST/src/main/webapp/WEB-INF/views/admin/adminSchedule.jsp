<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
						<td><a href="/admin/adminScheduleUpdate?game_id=${dto.game_id}">
	                        <button type="button">수정</button>
	                    </a></td>
					</tr>
					
				</c:forEach>

			</tbody>
		</table>
	</div>


      <button onclick="location.href='/admin/adminScheduleUpload'">등록</button>

 <div class="box-footer clearfix">
		<ul class="pagination pagination-sm no-margin pull-right">
			
			<c:if test="${pageDTO.prev }">
			<li><a href="/admin/adminSchedule?page=${pageDTO.startPage-1 }">«</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
		
			<li ${pageDTO.cri.page == i? 'class="active"':'' }><a href="/admin/adminSchedule?page=${i }">${i }</a></li>
		
			</c:forEach>
			
			<c:if test="${pageDTO.next && pageDTO.endPage > 0 }">
			<li><a href="/admin/adminSchedule?page=${pageDTO.endPage+1 }">»</a></li>
			</c:if>
		</ul>
	</div> 

<%@ include file="../include/footer.jsp"%>
</body>
</html>