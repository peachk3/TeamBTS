<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
	<title>Display Seats</title>
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="/../../resources/css/index.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<%@ include file="../include/header.jsp"%>
<body>
<style>
/* css */
body {
	font-family: Arial, sans-serif;
}

.h {
	text-align: center;
	margin-top: 20px;
}

.h6 {
	text-align: center;
	margin: 5px;
}

.container {
	display: flex;
	justify-content: space-between;
	padding: 20px;
}

.seating-chart {
	width: 50%;
	height: 250px;
	border: 1px solid black;
}

.field {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	font-weight: bold;
}

.seats-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 10px;
	justify-items: center;
}

.seat {
	display: inline-block;
	width: 50px;
	height: 50px;
	margin: 3px;
	background-color: #eee;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.seat.booked {
	background-color: #ffcccc; /* 예약된 좌석의 색상 */
	cursor: not-allowed;
}

.booked-seat {
    background-color: lightgray; /* 예시로 색상 변경 */
    pointer-events: none; /* 선택 불가능하도록 설정 */
}

.seat.occupied {
	background-color: #ff4c4c;
}

.seat.selected {
	background-color: #007bff;
	color: blue;
}

.selected-seats {
	width: 40%;
	height: 250px;
	border: 1px solid black;
}

.selected-seats>li {
	text-align: center;
}

.selected-seats>p {
	text-align: center;
}

.reserve_btn {
	text-align: center;
	margin-top: 20px;
}

.reserve_btn .btn_goback {
	margin: 10px;
	padding: 10px 20px;
	background-color: white;
	color: black;
	border: none;
	cursor: pointer;
	border: 1px solid black;
}

.reserve_btn .btn_reservation {
	margin: 10px;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
}

.reserve_btn .btn_goback:hover {
	background-color: gray;
}

.reserve_btn .btn_reservation:hover {
	background-color: #0056b3;
}
</style>
	
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

		<h1 class="h">Selected Seat: ${zone_ty}구역</h1>
	
	<div class="container">
		<div class="seating-chart">
			<div class="field">필드</div>
			<!-- 좌석 배치 예제 -->
			<div class="seats-grid">
				<c:forEach var="seatB" items="${seatBook }">
						<div class="seat" data-row="${seatB.seatList[0].seat_row}" data-num="${seatB.seatList[0].seat_num }" data-id="${seatB.seatList[0].seat_id }" data-booked="${seatB.booked_at }">
						 ${seatB.seatList[0].seat_row }${seatB.seatList[0].seat_num }</div>
						 	<input type="hidden" name="seat_row" value="${seatB.seatList[0].seat_row }"> 
							<input type="hidden" name="seat_num" value="${seatB.seatList[0].seat_num }">
							<input type="hidden" name="seat_id" value="${seatB.seatList[0].seat_id }">
							<input type="hidden" name="booked_at" value="${seatB.booked_at }">
				</c:forEach>
			</div>
		</div>

		<div class="selected-seats">
			<p>
				<b>선택한 좌석</b>
			</p>
			<ul id="selected-seats-list" style="list-style-type: none">
				<li id="no-seats">선택한 좌석이 없습니다</li>
			</ul>
		</div>
	</div>
	
<%-- 	<c:forEach var="seatID" items="${seats }"> --%>
<%-- 		<input type="hidden" id="seat_id" value="${seatID.seat_id }"> --%>
 <%-- 		${seats } --%> 
<%-- 	</c:forEach> --%>
		<div class="reserve_btn">
		<button type="button" class="btn_goback" onclick="goBack()">이전으로</button>
        <button type="submit" class="btn_reservation" onclick="handleReservation(event)">다음으로</button>
		</div>	
		

<form id="reservation-form" action="/ticketing/reservation" method="post">
 	   	<input type="hidden" id="selected-seats-count" name="selected_seats_count" value="0">
		<input type="hidden" name="stad_id" value="${stad_id}">
	    <input type="hidden" name="game_id" value="${game_id}">
	    <input type="hidden" name="zone_ty" value="${zone_ty}">
	    <input type="hidden" name="zone_id" value="${zone_id}">
</form>
<%-- 	    <input type="hidden" name="seat_row" value="${seat.seat_row}"> --%>
<%-- 	    <input type="hidden" name="seat_num" value="${seat.seat_num}"> --%>
<%-- 	    <input type="hidden" name="seat_id" value="${seat.seat_id}"> --%>
	
		<!-- 정보 전달 확인창 -->
		<h6 class="h">구장: ${stad_id}</h6>
		<h6 class="h">게임ID: ${game_id}</h6>		
		<h6 class="h">zone_id : ${zone_id}</h6>
		<h6 class="h">사용자 아이디 : ${user_id}</h6>
		<h6 class="h">zone_ty : ${zone_ty}</h6>
			

<script>
document.addEventListener("DOMContentLoaded", function() {
    const seats = document.querySelectorAll('.seat');  // 모든 좌석 요소 선택
    const selectedSeatsList = document.getElementById('selected-seats-list');  // 선택된 좌석 목록을 표시할 요소
    const noSeatsMessage = document.getElementById('no-seats');  // 좌석이 선택되지 않았을 때 표시할 메시지 요소
    const reserveButton = document.querySelector('.btn_reservation');  // 예약 버튼 요소

    // 선택된 좌석을 담을 배열
    let selectedSeats = [];
    
 function selectSeat(seat) {
 if (selectedSeats.includes(seat)) {
     // 이미 선택된 좌석인 경우 선택 해제
     deselectSeat(seat);
 } else {
     // 새로운 좌석 선택
     selectedSeats.push(seat);
     seat.classList.add('selected');

     // 10분 후 자동으로 선택 해제
     setTimeout(() => {
         deselectSeat(seat);
     }, 10 * 60 * 1000); // 10분을 밀리초로 변환
 }
}

function deselectSeat(seat) {
 const index = selectedSeats.indexOf(seat);
 if (index !== -1) {
     selectedSeats.splice(index, 1);
     seat.classList.remove('selected');
 }
}

    // 각 좌석에 대한 초기 설정
    seats.forEach(function(seat) {
        var bookedAt = seat.getAttribute('data-booked');
        if (bookedAt === '1') {
            seat.classList.add('booked-seat');  // 이미 예약된 좌석 스타일 추가
            seat.setAttribute('disabled', 'disabled');  // 예약된 좌석 비활성화
        }
        selectOrDeselect(seat);  // 각 좌석에 클릭 이벤트 추가
    });

    // 좌석 선택 또는 해제 처리 함수
    function selectOrDeselect(seat) {
        seat.addEventListener('click', function() {
            if (seat.classList.contains('booked-seat')) {
                // 예약된 좌석을 클릭했을 때의 처리
                console.log('이 좌석은 이미 예약되었습니다.');
                return;  // 예약된 좌석이면 함수 종료
            }

            // 클릭 시 선택된 상태를 토글
            seat.classList.toggle('selected');

            // 선택된 좌석 배열 업데이트
            if (seat.classList.contains('selected')) {
                selectedSeats.push(seat);
            } else {
                selectedSeats = selectedSeats.filter(selectedSeat => selectedSeat !== seat);
            }

            updateSelectedSeatsList();
        });
    }

    // 선택된 좌석 목록을 업데이트하는 함수
    function updateSelectedSeatsList() {
        selectedSeatsList.innerHTML = '';  // 이전 선택 내용 지우기

        if (selectedSeats.length > 0) {
            selectedSeats.forEach(seat => {
                const listItem = document.createElement('li');
                listItem.textContent = '${zone_ty}구역 ' + seat.getAttribute('data-row') + '열 ' + seat.getAttribute('data-num') + '번 ';
                selectedSeatsList.appendChild(listItem);
            });
            noSeatsMessage.style.display = 'none';  // 선택된 좌석이 있으면 메시지 숨기기
        } else {
            const listItem = document.createElement('li');
            listItem.textContent = '선택한 좌석이 없습니다';
            selectedSeatsList.appendChild(listItem);
            noSeatsMessage.style.display = 'block';  // 선택된 좌석이 없으면 메시지 표시
        }
    }

    // 예약 버튼 클릭 시 처리 함수
    reserveButton.addEventListener('click', function(event) {
        event.preventDefault();  // 기본 폼 제출 동작 방지
        
        // 선택된 좌석 수
        const selectedSeatsCount = selectedSeats.length;

        if (selectedSeatsCount === 0) {
            alert('좌석을 선택해주세요.');
            return;  // 함수 종료
        }
        
        const form = document.getElementById('reservation-form');

        // 이미 추가된 동적 좌석 입력 요소 제거
        document.querySelectorAll('.dynamic-seat-input').forEach(input => input.remove());

        // 선택된 좌석 정보를 폼에 추가
        selectedSeats.forEach(seat => {
            const seatRowInput = document.createElement('input');
            seatRowInput.type = 'hidden';
            seatRowInput.name = 'seat_row';
            seatRowInput.value = seat.getAttribute('data-row');
            seatRowInput.classList.add('dynamic-seat-input');
            form.appendChild(seatRowInput);

            const seatNumInput = document.createElement('input');
            seatNumInput.type = 'hidden';
            seatNumInput.name = 'seat_num';
            seatNumInput.value = seat.getAttribute('data-num');
            seatNumInput.classList.add('dynamic-seat-input');
            form.appendChild(seatNumInput);

            const seatIdInput = document.createElement('input');
            seatIdInput.type = 'hidden';
            seatIdInput.name = 'seat_id';
            seatIdInput.value = seat.getAttribute('data-id');
            seatIdInput.classList.add('dynamic-seat-input');
            form.appendChild(seatIdInput);
        });

        // 폼 제출
        form.submit();
    });
});


// 이전 페이지로 이동하는 함수
function goBack() {
    history.back();
}

</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>
