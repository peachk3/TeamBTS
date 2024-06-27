<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<body>
   <style> 
   .image-map { 
		text-align: center; 
    } 
    .zone {
    	text-align: center;
    	font-weight: bold;
    	font-size: 50px;
    	font-family: "Noto Sans KR", sans-serif;
    }
    </style>
<!--     <p class="current_time" value="1718341239704"><em></em>현재시간<span>14:00</span></p> -->
    
    
    
    
    
    <hr>
<!--     정보 전달 확인 -->
<%--     <h3>Stadium ID: ${stad_id}</h3> --%>
<%--     <h3>game ID: ${game_id }</h3> --%>

	<div>
		여기저기
	</div>
	<div>
	 	야모해
	</div>
	<div>
		여기저기 야모해
	</div>

    <div class="zone">
    	구역 선택
    </div>
	<div class="image-map">
		<img src="/../../resources/img/stadiumZone.PNG" usemap="#image-map" alt="Stadium Map">

		<map name="image-map" class="image-map">
			<c:forEach var="zone" items="${zones}">
				<%--      console.log('${zone}'); --%>
				<%--      ${zone} --%>
				<c:choose>
					<c:when test="${zone.zone_ty == 'A'}">
						<area target="_self" alt="A구역" title="A구역" data-value="${zone.zone_ty }"
							data-id="${zone.zone_id}"
							coords="48,435,154,463,211,498,259,579,313,676,368,776,437,863,280,1062,226,1031,176,985,132,928,90,860,60,781,35,675,28,580,32,502"
							shape="poly"
							onclick="selectZone('${zone.zone_ty }', '${zone.zone_id}') ">
					</c:when>
					<c:when test="${zone.zone_ty == 'B'}">
						<area target="_self" alt="B구역" title="B구역" data-value="${zone.zone_ty }"
							data-id="${zone.zone_id}"
							coords="443,865,468,886,495,901,518,912,550,919,577,923,606,922,634,917,658,909,680,899,702,886,727,869,889,1069,840,1097,796,1116,747,1129,693,1142,639,1147,586,1150,532,1149,466,1142,398,1125,334,1100,290,1068"
							shape="poly"
							onclick="selectZone('${zone.zone_ty }', '${zone.zone_id}')">
					</c:when>
					<c:when test="${zone.zone_ty == 'C'}">
						<area target="_self" alt="C구역" title="C구역" data-value="${zone.zone_ty }"
							data-id="${zone.zone_id}"
							coords="735,862,896,1063,968,1012,1023,953,1067,884,1098,813,1122,745,1138,661,1143,594,1142,544,1138,503,1131,456,1122,436,1018,460,959,497,905,588,865,662,831,727,797,783"
							shape="poly"
							onclick="selectZone('${zone.zone_ty }', '${zone.zone_id}')">
					</c:when>
					<c:when test="${zone.zone_ty == 'D'}">
						<area target="_self" alt="D구역" title="D구역" data-value="${zone.zone_ty }"
							data-id="${zone.zone_id}"
							coords="615,125,623,33,670,35,698,39,725,47,751,54,794,73,825,84,855,102,907,138,956,177,994,215,1029,254,1062,295,1089,338,1123,404,1012,441,995,386,980,352,945,297,912,256,876,222,825,184,767,153,712,135,664,128"
							shape="poly"
							onclick="selectZone('${zone.zone_ty }', '${zone.zone_id}')">
					</c:when>
					<c:when test="${zone.zone_ty == 'E'}">
						<area target="_self" alt="E구역" title="E구역"  data-value="${zone.zone_ty }"
							data-id="${zone.zone_id}"
							coords="280,238,232,290,187,362,159,443,54,404,77,351,112,294,166,231,218,177,270,137,328,98,387,69,447,48,506,37,551,33,559,125,503,128,447,140,394,160,335,192"
							shape="poly"
							onclick="selectZone('${zone.zone_ty }', '${zone.zone_id}')">
					</c:when>
				</c:choose>
			</c:forEach>
		</map>
	</div>

	<script type="text/javascript">
		function selectZone(zone_ty, zone_id) {
			console.log('Selected zone type:', zone_ty);
			console.log('Selected zone ID:', zone_id);

			const url = "/ticketing/displaySeats?stad_id=${stad_id}&game_id=${game_id}&zone_ty="
					+ zone_ty + "&zone_id=" + zone_id;
			window.location.href = url;
		}
	</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>