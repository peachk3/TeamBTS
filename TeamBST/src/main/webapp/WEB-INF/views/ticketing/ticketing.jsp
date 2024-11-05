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

<body>
<main>
<section class="page-title bg-title overlay-dark">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<div class="title">
					<h3>TICKETING</h3>
				</div>
				<ol class="breadcrumb p-0 m-0">
					<li class="breadcrumb-item active">예매하기</li>
				</ol>
			</div>
		</div>
	</div>
</section>

	<section class="section schedule">
	<div class="container">
<!--  	<form action="/ticketing/ticketing" method="post"> -->
		<select name="stad_id" id="stad_id">
		    <option value="All" ${selectedStadId == 'All' ? 'selected' : ''}>전체 구장</option>
		    <option value="GC" ${selectedStadId == 'GC' ? 'selected' : ''}>고척 스카이돔</option>
		    <option value="GJ" ${selectedStadId == 'GJ' ? 'selected' : ''}>광주 챔피언스 필드</option>
		    <option value="DG" ${selectedStadId == 'DG' ? 'selected' : ''}>대구 라이온즈파크</option>
		    <option value="DJ" ${selectedStadId == 'DJ' ? 'selected' : ''}>대전 이글스파크</option>
		    <option value="SJ" ${selectedStadId == 'SJ' ? 'selected' : ''}>부산 사직야구장</option>
		    <option value="JS" ${selectedStadId == 'JS' ? 'selected' : ''}>서울 잠실야구장</option>
		    <option value="SW" ${selectedStadId == 'SW' ? 'selected' : ''}>수원 KT위즈파크</option>
		    <option value="IC" ${selectedStadId == 'IC' ? 'selected' : ''}>인천 랜더스필드</option>
		    <option value="CW" ${selectedStadId == 'CW' ? 'selected' : ''}>창원 NC파크</option>
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

</main>
	<script>
	$(document).ready(function() {
	    getMemberList();

	    $("#stad_id").change(getMemberList); // id="listButton"인 태그에 click하면 function getMemberList() 실행
	});

	function getMemberList() {
	    var stad_id = $('#stad_id').val();

	    $('table tbody').find('tr:not(:first)').remove(); // 테이블의 첫 번째 행(헤더 행)을 제외한 모든 행 삭제

	    $.ajax({
	        url: "/ticketing/ticketing",
	        type: "post",
	        data: { stad_id: stad_id },
	        dataType: "json",
	        success: function(data) {
	            $(data).each(function(idx, item) {
	                $('table tbody').append(
	                    "<tr>" +
	                        "<td><a href='/ticketing/gameInfo?game_id=" + item.game_id + "'>" + (parseInt(idx) + 1) + "</a></td>" +
	                        "<td><a href='/ticketing/gameInfo?game_id=" + item.game_id + "'>" + item.game_date + "</a></td>" +
	                        "<td><a href='/ticketing/gameInfo?game_id=" + item.game_id + "'>" + item.game_time + "</a></td>" +
	                        "<td><a href='/ticketing/gameInfo?game_id=" + item.game_id + "'>" + item.stad_id + "</a></td>" +
	                        "<td><a href='/ticketing/gameInfo?game_id=" + item.game_id + "'>" + item.home_team_id + "</a></td>" +
	                        "<td><a href='/ticketing/gameInfo?game_id=" + item.game_id + "'>" + item.away_team_id + "</a></td>" +
	                        "<td><a href='/ticketing/stadium?stad_id=" + item.stad_id + "&game_id=" + item.game_id + "'>예매하기</a></td>" +
	                    "</tr>"
	                );
	            });
	        }
	    });
	}

	</script>

	
<%@ include file="../include/footer.jsp"%>

</body>
</html>
