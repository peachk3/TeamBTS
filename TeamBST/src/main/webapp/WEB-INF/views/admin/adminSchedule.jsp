<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.btn {
	width: 150px;
	margin-right: -72px;
}
</style>

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>SCHEDULE</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">경기일정</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<section class="section schedule">
	<div class="container">
       <div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>번호</th>
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
	                        <button type="button" class="btn">수정</button>
	                    </a></td>
					</tr>
					
				</c:forEach>

			</tbody>
		</table>
      <button type="button" class="float-right btn" onclick="location.href='/admin/adminScheduleUpload'" style="margin-right:0px; ">등록</button>
      
	</div>
	</div>
	</section>



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