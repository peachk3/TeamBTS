<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adminheader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<table border="1">
			<tr>
				<td>경기 날짜</td>
				<td>경기 시작 시간</td>
				<td>구장</td>
				<td>원정팀</td>
				<td>홈팀</td>
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
		
		</table>
		
                    <button type="button" onclick="window.history.back();">뒤로가기</button>
		
		
		
		
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





</body>
</html>