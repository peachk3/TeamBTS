<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Seats Page</title>
</head>
<body>
    <h1>좌석 선택</h1>
    <table>
        <c:forEach var="seat" items="${seats}">
            <tr>
                <td>${seat.row_num}행 ${seat.col_num}열</td>
                <td>
                    <a href="/reservation?schedule_id=${schedule_id}&seat_id=${seat.seat_id}">선택하기</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

