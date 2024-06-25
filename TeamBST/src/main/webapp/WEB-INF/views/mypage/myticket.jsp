<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    
      
      
      <button type="button" class="community" onclick="location.href='/mypage/mypage'">회원정보 조회</button> 
      <button type="button" class="community" onclick="location.href='/mypage/myticket'">MY 티켓</button> <br>
      <button type="button" class="community" onclick="location.href='/mypage/mywrite'">MY 게시글</button>
      
      <br>

      <button type="button" id="Upcoming" value="Upcoming">예정 경기</button>
      <button type="button" id="Past" value="Past">지난 경기</button>

      <br>
      <br>

<%-- <c:choose> --%>
<%--     <c:when test="${not empty oMatchList}"> --%>
		<div class="box-body">
			<table class="table table-bordered">
				<tbody>
					<tr>
		                <th>경기 일자</th>
		                <th>시작 시간</th>
		                <th>구장</th>
		                <th>홈팀</th>
		                <th>원정팀</th>
		            </tr>
	            </tbody>
	            <%-- <c:forEach var="match" items="${oMatchList}">
	                <tr>
	                    <td>${match.game_date}</td>
	                    <td>${match.game_time}</td>
	                    <td>${match.stad_id}</td>
	                    <td>${match.home_team_id}</td>
	                    <td>${match.away_team_id}</td>
	                </tr>
	            </c:forEach> --%>
			</table>
		</div>
<%--     </c:when> --%>
    <%-- <c:when test="${not empty pMatchList}">
        <table border="1">
            <tr>
                <th>경기 날짜</th>
                <th>경기 시간</th>
                <th>경기장 ID</th>
                <th>홈 팀 ID</th>
                <th>원정 팀 ID</th>
            </tr>
            <c:forEach var="match" items="${pMatchList}">
                <tr>
                    <td>${match.game_date}</td>
                    <td>${match.game_time}</td>
                    <td>${match.stad_id}</td>
                    <td>${match.home_team_id}</td>
                    <td>${match.away_team_id}</td>
                </tr>
            </c:forEach>
        </table>
    </c:when> --%>
<%-- </c:choose> --%>

	<script>
	
	$(document).ready(function(){

		$('table td').remove();
		
		getTicketList();
		
		$("#Past").click(ticketPastStatusSet); //id="listButton"인 태그에 click하면 function getMemberList() 실행
		$("#Upcoming").click(ticketUpcomingStatusSet); //id="listButton"인 태그에 click하면 function getMemberList() 실행
	});
	
	function ticketPastStatusSet(){
		var ticket_status = $('#Past').val();
		getTicketList(ticket_status);
	}
	
	function ticketUpcomingStatusSet(){
		var ticket_status = $('#Upcoming').val();
		getTicketList(ticket_status);
	}
	
	function getTicketList(ticket_status){
		console.log(ticket_status);
		
		$('table td').remove();
			
		$.ajax({
        	url : "/mypage/myticket",
        	type : "post",
        	data : JSON.stringify({ ticket_status : ticket_status}),
        	contentType: 'application/json; charset=utf-8',
        	dataType : "json",
        	success : function(data){
//         		alert("JTBC 다녀옴");
// 				console.log(data);
        		
        		// body 태그에 내용 추가
        		$(data).each(function(idx, item){
        			
        			$('table').append("<tr><td>"+ item.game_date +"</td><td>"+ item.game_time +"</a></td><td>"+ item.stad_id +"</td><td>"+ item.home_team_id +"</td><td>"+ item.away_team_id +"</td></tr>")
        			
        		});
        	},
        	error: function(jqXHR, textStatus, errorThrown) {
                console.log("AJAX 요청 실패: " + jqXHR.status + ", " + jqXHR.statusText + ", " + textStatus + ", " + errorThrown);
                alert("AJAX 요청 실패!");
            }
        });
	}
	
	</script>
    
<%@ include file="../include/footer.jsp"%>    
</body>
</html>