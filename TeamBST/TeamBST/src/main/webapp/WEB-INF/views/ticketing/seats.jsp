<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Seat Selection</h1>
    <table border="1">
        <tr>
            <c:forEach var="seat" items="${seats}">
                <td>${seat.seat_id}</td>
                <td>${seat.seat_row}</td>
                <td>${seat.seat_num}</td>
            </c:forEach>
        </tr>
    </table>
    
</body>
</html>