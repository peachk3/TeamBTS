<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
</head>
<body>
    <h1>결제 확인</h1>
    <p>경기: ${schedule.team} - ${schedule.game_date}</p>
    <p>구장: ${schedule.stad_id}</p>
    <p>좌석: ${seat.row_num}행 ${seat.col_num}열</p>
    <p>성인 매수: ${adult_count}</p>
    <p>초등학생 매수: ${child_count}</p>
    <form action="/confirm" method="post">
    <button type="submit">결제 완료</button>
    </form>
</body>
</html>
