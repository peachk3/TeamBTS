<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제하기 버튼</title>
    <!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 포트원 결제 -->
</head>

<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>TICEKGING</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">예매하기</li>
				</ol>
			</div>
		</div>
	</div>
</section>

<body>
	<section class="section schedule">
	<div class="container">
<!--  	<form action="/ticketing/ticketing" method="post"> -->
		<select name="stad_id" id="stad_id">
			<option value="All">전체 구장</option>
			<option value="GC">고척 스카이돔</option>
			<option value="GJ">광주 챔피언스 필드</option>
			<option value="DG">대구 라이온즈파크</option>
			<option value="DJ">대전 이글스파크</option>
			<option value="SJ">부산 사직야구장</option>
			<option value="JS"}>서울 잠실야구장</option>
			<option value="SW">수원 KT위즈파크</option>
			<option value="IC">인천 랜더스필드</option>
			<option value="CW">창원 NC파크</option>
		</select> 
<!-- 		<input type="submit" value="검색" id="submit"> -->
<!-- 	</form> -->

	<div class="box-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th style="width: 10px">No.</th>
					<th>경기일자</th>
					<th>경기시작시간</th>
					<th>구장</th>
					<th>어웨이팀</th>
					<th>홈팀</th>
					<th>예매하기</th>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	</section>
		<%-- <c:forEach var="vo" items="${TeamScheduleList}" id="result">
			<tr>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_date}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.game_time}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.stad_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.away_team_id}</a></td>
				<td><a href="/ticketing/gameInfo?game_id=${vo.game_id}">${vo.home_team_id}</a></td>
				<td><a href="/ticketing/stadium/${vo.stad_id }/${vo.game_id}">예매하기</a></td>
				<td><a href="/ticketing/stadium?stad_id=${vo.stad_id },${vo.game_id}">예매하기</a></td>
			</tr>
		</c:forEach> --%>


	<script>
	
	$(document).ready(function(){
		getMemberList();
		
		$("#stad_id").change(getMemberList); //id="listButton"인 태그에 click하면 function getMemberList() 실행
	});
	
	function getMemberList(){
		var stad_id = $('#stad_id').val();
		
		$('table td').remove();
			
		$.ajax({
        	url : "/ticketing/ticketing",
        	type : "post",
        	data : { stad_id: stad_id },
        	dataType : "json",
        	success : function(data){
//         		alert("JTBC 다녀옴");
        		
        		// body 태그에 내용 추가
        		$(data).each(function(idx, item){
        			
// 	       			// item.game_date가 UNIX 타임스탬프로 제공된다고 가정합니다
// 	       			var unixTimestampSeconds = item.game_date; // UNIX 타임스탬프 (초 단위)
	
// 					// Unix Epoch 시간을 밀리초 단위로 변환하여 Date 객체 생성
// 		            var date = new Date(unixTimestampSeconds * 1000);
		
// 		            // Date 객체에서 원하는 형식으로 날짜를 가져오기
// 		            var formattedDate = date.toISOString().slice(0, 10);  // "YYYY-MM-DD" 형식으로 변환
		            
// 		            console.log(formattedDate); // 결과 확인용 콘솔 출력
	            
        			$('table').append("<tr><td><a href=/ticketing/gameInfo?game_id="+item.game_id+">"+ (parseInt(idx)+1) +"</a></td><td><a href=/ticketing/gameInfo?game_id="+item.game_id+">"+ item.game_date +"</a></td><td><a href=/ticketing/gameInfo?game_id="+item.game_id+">"+ item.game_time+"</a></td><td><a href=/ticketing/gameInfo?game_id="+item.game_id+">"+ item.stad_id +"</a></td><td><a href=/ticketing/gameInfo?game_id="+item.game_id+">"+ item.home_team_id+"</a></td><td><a href=/ticketing/gameInfo?game_id="+item.game_id+">"+ item.away_team_id +"</a></td><td><a href=/ticketing/stadium?stad_id="+ item.stad_id +"&game_id="+item.game_id+">예매하기</a></td></tr>")
//     																																																																																																																																												<td><a href="/ticketing/stadium?stad_id=${vo.stad_id },${vo.game_id}">예매하기</a></td>
	
        		
        		
        		});
        	}
        });
	}
	
	</script>

	
<%@ include file="../include/footer.jsp"%>
</body>
</html>