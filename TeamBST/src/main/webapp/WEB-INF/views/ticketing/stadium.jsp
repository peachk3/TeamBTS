<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
    
    <h1>Stadium ID: ${stad_id}</h1>
    <h2>Select a Zone</h2>	
    
<%--     <form action="zone/${zone.zone_id}" method="get"> --%>
<%--         <c:forEach var="zone" items="${zones}"> --%>
<%--             <input type="radio" name="zone_id" value="${zone.zone_id}" /> --%>
<%--             ${zone.zone_ty}<br /> --%>
<%--         </c:forEach> --%>
<!--         <input type="submit" value="Select Zone" /> -->
<!--     </form>     -->
    
	<!--  Image Map Generated by http://www.image-map.net/ -->
    <img src="../../resources/img/구장배치도.PNG" usemap="#image-map">

    <map name="image-map">
        <area target="_self" alt="seatA" title="seatA" href="/ticketing/seats/zoneA" coords="48,435,154,463,211,498,259,579,313,676,368,776,437,863,280,1062,226,1031,176,985,132,928,90,860,60,781,35,675,28,580,32,502" shape="poly">
        <area target="_self" alt="seatB" title="seatB" href="/ticketing/seats/zoneB" coords="443,865,468,886,495,901,518,912,550,919,577,923,606,922,634,917,658,909,680,899,702,886,727,869,889,1069,840,1097,796,1116,747,1129,693,1142,639,1147,586,1150,532,1149,466,1142,398,1125,334,1100,290,1068" shape="poly">
        <area target="_self" alt="seatC" title="seatC" href="/ticketing/seats/zoneC" coords="735,862,896,1063,968,1012,1023,953,1067,884,1098,813,1122,745,1138,661,1143,594,1142,544,1138,503,1131,456,1122,436,1018,460,959,497,905,588,865,662,831,727,797,783" shape="poly">
        <area target="_self" alt="seatD" title="seatD" href="/ticketing/seats/zoneD" coords="615,125,623,33,670,35,698,39,725,47,751,54,794,73,825,84,855,102,907,138,956,177,994,215,1029,254,1062,295,1089,338,1123,404,1012,441,995,386,980,352,945,297,912,256,876,222,825,184,767,153,712,135,664,128" shape="poly">
        <area target="_self" alt="seatE" title="seatE" href="/ticketing/seats/zoneE" coords="280,238,232,290,187,362,159,443,54,404,77,351,112,294,166,231,218,177,270,137,328,98,387,69,447,48,506,37,551,33,559,125,503,128,447,140,394,160,335,192" shape="poly">
    </map>
    
</body>
</html>