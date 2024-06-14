<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reservation Page</title>
</head>
<body>
    <h1>예매 </h1>
    <p>경기: ${schedule.team} - ${schedule.game_date}</p>
    <p>좌석: ${seat.row_num}행 ${seat.col_num}열</p>
    <form action="/payment" ><!-- method="post" -->
        <input type="hidden" name="schedule_id" value="${schedule.schedule_id}">
        <input type="hidden" name="seat_id" value="${seat.seat_id}">
        <label>성인 수:</label>
        <input type="number" name="adult_count" required>
        <label>초등학생 수:</label>
        <input type="number" name="child_count" required>
        <button type="submit" id="payment"  onclick="location.href='/ticketing/payment'">결제하기</button>
    </form>
</body>
</html>
