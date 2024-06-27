<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
       .bg-schedule {
        border: 1px solid #ddd;
        background: none;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
      
      .notice {
	   		border: 1px solid #ccc;
	        padding: 0;
	        margin-bottom: 20px;
	        width: 100%;
	    }
      
      .post-info {
         border: 1px solid #ccc;
         padding: 20px;
         padding-bottom: 10px;
         background-color: #E1E6F6;
      }
      
      .post-header {
         font-size: 18px;
         font-weight: bold;
         margin-bottom: 10px;
      }
      
      .post-meta {
         color: #666;
         font-size: 14px;
         margin-bottom: 10px;
      }
      
      .post-content {
        font-size: 16px;
        padding: 50px; 20px;
        overflow-wrap: break-word;
        white-space:pre-wrap;
      }
        
      .btn-main-md {
	        float: right;
      }
      
      textarea {
    	padding: 10px;
        width: 100%;
        height: 100px;
      }
	</style>

<section class="page-title bg-title overlay-dark">
   <div class="container">
      <div class="row">
         <div class="col-12 text-center">
            <div class="title">
               <h3>MEMBER</h3>
            </div>
            <ol class="breadcrumb p-0 m-0">
               <li class="breadcrumb-item active">예약현황</li>
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
				<th>경기 날짜</th>
				<th>경기 시작 시간</th>
				<th>구장</th>
				<th>원정팀</th>
				<th>홈팀</th>
			</tr>
			<c:forEach var="ticket" items="${memberTicketingList}">
			<tr>
				<td>${ticket.game_date}</td>
				<td>${ticket.game_time}</td>
				<td>${ticket.stad_id}</td>
				<td>${ticket.home_team_id}</td>
				<td>${ticket.away_team_id}</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
                    <button type="button" class="btn btn-main-md" onclick="window.history.back();">뒤로가기</button>
		
		
		
		
<div class="box-footer clearfix">
    <ul class="pagination pagination-sm no-margin pull-right">
        
        <c:if test="${pageDTO.prev}">
            <li><a href="/admin/adminMemberTicket?page=${pageDTO.startPage - 1 }&user_id=${param.user_id}">«</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li ${pageDTO.cri.page == i ? 'class="active"' : ''}><a href="/admin/adminMemberTicket?page=${i }&user_id=${param.user_id}">${i }</a></li>
        </c:forEach>
        
        <c:if test="${pageDTO.next && pageDTO.endPage > 0}">
            <li><a href="/admin/adminMemberTicket?page=${pageDTO.endPage + 1 }&user_id=${param.user_id}">»</a></li>
        </c:if>
    </ul>
</div>
</div>
</div>
</section>



<%@ include file="../include/footer.jsp"%>
</body>
</html>