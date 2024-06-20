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
</head>

<body>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
		text-align:center;
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
	
	.seat.occupied {
		background-color: #ff4c4c;
	}
	
	.seat.selected {
		background-color: #007bff;
		color: white;
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

    <c:forEach var="seat" items="${seats}">
     console.log('${seats}');
     </c:forEach>
		<h1 class="h">Selected Seat: ${zone_ty}구역</h1>
		<h6 class="hh">구장: ${stad_id}</h6>
		<h6 class="hh">게임ID: ${game_id}</h6>		
		<h6 class="hhh">zone_id : ${zone_id}</h6>
	 	<div class="container">
			<div class="seating-chart">
				<div class="field">필드</div> 
				<!-- 좌석 배치 예제 -->
					<div class="seats-grid">
						<div class="seat" data-row="1" data-num="A">1A</div>
						<div class="seat" data-row="1" data-num="B">1B</div>
						<div class="seat" data-row="1" data-num="C">1C</div>
						<div class="seat" data-row="2" data-num="A">2A</div>
						<div class="seat" data-row="2" data-num="B">2B</div>
						<div class="seat" data-row="2" data-num="C" >2C</div>
					</div>
			</div>			
			<input type="hidden" id="data-row" value="">
			<input type="hidden" id="data-num" value="">
			
					<div class="selected-seats">
					<p><b>선택한 좌석</b></p>
					<ul id="selected-seats-list" style="list-style-type: none">
						<li id="no-seats">선택한 좌석이 없습니다</li>
					</ul>
					</div>
		</div>
		
		<div class="availability">
            <h3>다른 존의 예매 가능 좌석 수</h3>
            <ul id="available-seats-list" style="list-style-type: none">
                <li>존 A: <span id="zone-a-count">0</span> 좌석</li>
                <li>존 B: <span id="zone-b-count">0</span> 좌석</li>
                <li>존 C: <span id="zone-c-count">0</span> 좌석</li>
            </ul>
        </div>
			
		<div class="reserve_btn">
		<button type="submit" class="btn_goback" onclick="goBack()">이전으로</button>
        <button type="submit" class="btn_reservation" onclick="handleReservation()">다음으로</button>
		</div>

<script>
function updateSelectedSeats() {
    const selectedSeatsList = document.getElementById('selected-seats-list');
    const noSeatsMessage = document.getElementById('no-seats');
    let selectedSeats = Array.from(document.querySelectorAll('.seat.selected')).map(seat => {
        const seat_row = seat.getAttribute('data-row');
        const seat_num = seat.getAttribute('data-num');
        const seat_id = '${zone_id}' + seat_row + seat_num;
        return { seat_row, seat_num, seat_id };
    });

    selectedSeatsList.innerHTML = '';

    if (selectedSeats.length > 0) {
        selectedSeats.forEach(seat => {
            const listItem = document.createElement('li');
            listItem.textContent = '${zone_ty}구역' + seat.seat_row +'열' + seat.seat_num + '번';
            selectedSeatsList.appendChild(listItem);
        });
        noSeatsMessage.style.display = 'none';
    } else {
        const listItem = document.createElement('li');
        listItem.id = 'no-seats';
        listItem.textContent = '선택한 좌석이 없습니다';
        selectedSeatsList.appendChild(listItem);
        noSeatsMessage.style.display = 'block';
    }
}

function goBack() {
    history.back();
}

function handleReservation() {
    const selectedSeats = Array.from(document.querySelectorAll('.seat.selected')).map(seat => {
        const seat_row = seat.getAttribute('data-row');
    	const seat_num = seat.getAttribute('data-num');
        const seat_id = '${zone_id}' + seat_row + seat_num;
        return { seat_row, seat_num, seat_id };
    });

    if (selectedSeats.length === 0) {
        alert('좌석을 선택하세요.');
    } else {
        const stad_id = '${stad_id}';
        const game_id = '${game_id}';
        const zone_ty = '${zone_ty}';
        const zone_id = '${zone_id}';
        
//         const seatsParam = encodeURIComponent(JSON.stringify(selectedSeats));
        
        let seat_row = selectedSeats.map(seat => seat.seat_row).join(',');
        let seat_num = selectedSeats.map(seat => seat.seat_num).join(',');
        let seat_id = selectedSeats.map(seat => seat.seat_id).join(',');

        const seatUrl = "/ticketing/reservation/" + stad_id + "/" + game_id + "/" + zone_ty + "/" + zone_id + "/" + seat_row + "/" + seat_num + "/" + seat_id ;
        window.location.href = seatUrl;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const seats = document.querySelectorAll('.seat');

    seats.forEach(seat => {
        seat.addEventListener('click', () => {
            seat.classList.toggle('selected');
            updateSelectedSeats();
        });
    });

    updateSelectedSeats(); // 페이지 로드 시 초기화
});
</script>

</body>
</html>
