<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Zones Page</title>
</head>
<body>
    <h1>구역 선택</h1>
    <ul>
        <c:forEach var="zone" items="${zones}">
            <li>
                <a href="/seats/${zone.zone_id}"> <%-- schedule_id=${schedule_id}${zone.name} --%></a>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
