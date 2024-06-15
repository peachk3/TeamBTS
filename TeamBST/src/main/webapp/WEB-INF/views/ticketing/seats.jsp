<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>



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