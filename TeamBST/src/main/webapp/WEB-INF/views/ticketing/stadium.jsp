<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>좌석 배치도 </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!--     <link href="/../../resources/css/seat.css" rel="stylesheet"> -->
    <link href="/../../resources/css/index.css" rel="stylesheet">
</head>

<body>
   <nav>
      <a href="/main/main"><h1>개바리조</h1></a>
      
      <h6>
        <a href="/login/login">로그인/</a> <a href="/mypage/mypage">마이페이지/</a> <a href="/admin/admin">관리자페이지/</a> 로그인시간 ( 58: 00 ) 
      </h6>
    </nav>
    
    
	<ul class="nav">
		<li class="nav-item"><a class="nav-link active" aria-current="page" href="/ticketing/ticketing">예매</a></li>
		<li class="nav-item"><a class="nav-link" href="/community/community">거래</a></li>
		<li class="nav-item"><a class="nav-link" href="/announcement/announcement">고객센터</a></li>
	</ul>
    
<!--     <p class="current_time" value="1718341239704"><em></em>현재시간<span>14:00</span></p> -->
    
    <hr>
    
    <h3>Stadium ID: ${stad_id}</h3>
    <h3>game ID: ${game_id }</h3>
    <h3>구역을 선택하세요</h3>

<!-- 	<form id="zoneForm" action="displaySeats.jsp" method="get"> -->
<%-- 		<input type="hidden" name="stad_id" value="${stad_id }">  --%>
<!-- 		<input type="hidden" id="zone" name="zone" value=""> -->



		<%--     <form action="zone/${zone.zone_id}" method="get"> --%>
		<%--         <c:forEach var="zone" items="${zones}"> --%>
		<%--             <input type="radio" name="zone_id" value="${zone.zone_id}" /> --%>
		<%--             ${zone.zone_ty}<br /> --%>
		<%--         </c:forEach> --%>
		<!--         <input type="submit" value="Select Zone" /> -->
		<!--     </form>     -->

		<!--  Image Map Generated by http://www.image-map.net/ -->
		<img src="/../../resources/img/stadiumZone.PNG" usemap="#image-map" alt="Stadium Map">

		<map name="image-map">
			<area target="_self" alt="A구역" data-value="A"
				coords="48,435,154,463,211,498,259,579,313,676,368,776,437,863,280,1062,226,1031,176,985,132,928,90,860,60,781,35,675,28,580,32,502"
				shape="poly" onclick="selectZone('A')">
				<!-- href="/ticketing/displaySeats/${stad_id }/game/${game_id}/zone/${zone_id}" -->
				
			<area target="_self" alt="B구역" data-value="B"
				coords="443,865,468,886,495,901,518,912,550,919,577,923,606,922,634,917,658,909,680,899,702,886,727,869,889,1069,840,1097,796,1116,747,1129,693,1142,639,1147,586,1150,532,1149,466,1142,398,1125,334,1100,290,1068"
				shape="poly" onclick="selectZone('B')">
				
			<area target="_self" alt="C구역" data-value="C"
				coords="735,862,896,1063,968,1012,1023,953,1067,884,1098,813,1122,745,1138,661,1143,594,1142,544,1138,503,1131,456,1122,436,1018,460,959,497,905,588,865,662,831,727,797,783"
				shape="poly" onclick="selectZone('C')">
				
			<area target="_self" alt="D구역" data-value="D"
				coords="615,125,623,33,670,35,698,39,725,47,751,54,794,73,825,84,855,102,907,138,956,177,994,215,1029,254,1062,295,1089,338,1123,404,1012,441,995,386,980,352,945,297,912,256,876,222,825,184,767,153,712,135,664,128"
				shape="poly" onclick="selectZone('D')"> 
				
			<area target="_self" alt="E구역" data-value="E"
				coords="280,238,232,290,187,362,159,443,54,404,77,351,112,294,166,231,218,177,270,137,328,98,387,69,447,48,506,37,551,33,559,125,503,128,447,140,394,160,335,192"
				shape="poly" onclick="selectZone('E')">
		</map>
		
    <input type="hidden" id="stad_id" value="${stad_id }">
    <input type="hidden" id="game_id" value="${game_id }">
<%--     <input type="hidden" id="seat_row" value="${seat_row }"> --%>
<%--     <input type="hidden" id="seat_num" value="${seat_num }"> --%>
    
<%--     <input type="hidden" id="zone_id" value="${zone_id }"> --%>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	function selectZone(zone_ty){
		const stad_id = document.getElementById("stad_id").value;
		const game_id = document.getElementById("game_id").value;
// 		const zone_id = document.getElementById("zone_id").value;
		
		const zone_id = stad_id + zone_ty;
		
// 		const url = "/ticketing/displaySeats/" + stad_id + "/" + game_id + "/" + zone_ty;
		const url = "/ticketing/displaySeats/" + stad_id + "/" + game_id + "/"+ zone_ty + "/"+ zone_id ;
		window.location.href= url;
		
	}
	 window.selectZone = selectZone;
});	 
</script>

</body>
</html>