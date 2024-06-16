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

	<style>
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
	
	/*	body:not (.hh ), html {
			height: 100%;
			margin: 0;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.container {
			display: flex;
			flex-direction: column;
			align-items: center;
			width: 80%;
			justify-content: center;
			height: 80vh;
			width: 100vh;
			margin: auto;
			border: 1px solid black;
		}
		
		.seating-chart {
			display: grid;
			grid-template-columns: repeat(3, 50px);
			justify-content: center;
			align-items: center;
			gap: 10px;
			margin: 30px;
			height: 80vh;
			width: 50vh;
			border: 1px solid black;
			display: flex;
			flex-wrap: wrap;
			margin-bottom: 20px;
		
			float: left;
			position: relative; 
			width: 680px;
			min-height: 660px; 
		 	max-height: 660px; 
			padding: 20px;
			border-right: 1px solid #ecedf2;
			background: #f8f9fa;
		}
		
		.seat {
			width: 50px;
			height: 50px;
			background-color: #444;
			margin: 5px;
			cursor: pointer;
			color: white;
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.selected-seats {
			background-color: #6c7ae0;
			margin-top: 20px;
			text-align: center;
		}
		
		.seat.occupied {
			background-color: darkgary;
			cursor: not-allowed;
		}
		
		.field {
			width: 100%;
			text-align: center;
			margin-bottom: 10px;
			font-weight: bold;
			grid-column: span 3;
			text-align: center;
			font-size: 20px;
			font-weight: bold; 
		}
		
		.selected-seats {
			float: left;
			position: relative;
			width: 269px;
			min-height: 150px;
			margin-left: -1px;
			padding: 20px 30px 85px 29px;
			border-left: 1px solid #ecedf2;
			box-sizing: border-box;
			background: #fff;
			display: block;
		}
		
		.reserve_btn {
			margin-top: 20px;
			text-align: center;
		}
		
		.btn_goback, .btn_reservation {
			margin: 5px;
			padding: 10px 20px;
			cursor: pointer;
		} */
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
	
	</head>
	<body>
		<h1 class="h">Selected Seat: ${zone_ty}구역</h1>
		<h6 class="hh">구장: ${stad_id}</h6>
		<h6 class="hh">게임ID: ${game_id}</h6>
		<h6 class="hhh">zone_id : ${stad_id }${zone_ty } </h6>
		<div class="container">
			<div class="seating-chart">
				<div class="field">필드</div>
				<!-- 좌석 배치 예제 -->
				<div class="seats-grid">
					<div class="seat" data-seat="1A" >1A</div>
					<div class="seat" data-seat="1B" >1B</div>
					<div class="seat" data-seat="1C" >1C</div>
					<div class="seat" data-seat="2A" >2A</div>
					<div class="seat" data-seat="2B" >2B</div>
					<div class="seat" data-seat="2C" >2C</div>
				</div>
			</div>

			<div class="selected-seats">
				<p><b>선택한 좌석</b></p>
				<ul id="selected-seats-list" style="list-style-type: none">
					<li id="no-seats">선택한 좌석이 없습니다</li>
				</ul>
			</div>
		</div>
		<div class="reserve_btn">
		<a href="#" class="btn_goback" onclick="goBack()">이전으로</a>
		<a href="#" class="btn_reservation"
   		 onclick="goToReservation()">다음으로</a>
		
<!-- 			<button class="btn_goback" -->
<!-- 				onclick="goBack()">이전으로</button> -->
<!-- 			<button class="btn_reservation" -->
<!-- 				onclick="location.href='/ticketing/reservation'">다음으로</button> -->
		</div>
		<script>		
        document.addEventListener('DOMContentLoaded', () => {
            const seats = document.querySelectorAll('.seat:not(.occupied)');
            const selectedSeatsList = document.getElementById('selected-seats-list');
            const noSeatsMessage = document.getElementById('no-seats');

            seats.forEach(seat => {
                seat.addEventListener('click', () => {
                    seat.classList.toggle('selected');
                    updateSelectedSeats();
                });
            });

            function updateSelectedSeats() {
                const selectedSeats = document.querySelectorAll('.seat.selected');

                selectedSeatsList.innerHTML = '';

                if (selectedSeats.length > 0) {
                    selectedSeats.forEach(seat => {
                        const listItem = document.createElement('li');
                        listItem.textContent = '${zone_ty}구역' + seat.getAttribute('data-seat');
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

            updateSelectedSeats(); // 페이지 로드 시 초기화
            
            const nextButton = document.querySelector('.btn_reservation');
            nextButton.addEventListener('click', (event) => {
                const selectedSeats = document.querySelectorAll('.seat.selected');

                if (selectedSeats.length === 0) {
                	event.preventDefault(); // 선택한 좌석이 없으면 기본 동작(페이지 이동) 막기
					// 선택된 좌석 없을 시 alret 창 띄우기는 가능하나
					// 페이지 이동 막지 못함
					
                    // 알림창 띄우기
                    alert('좌석을 선택하세요.');
                	
                } else {
                    // 여기서 선택된 좌석 정보를 URL에 추가하여 다음 페이지로 이동할 수 있음
                    // 예시: /ticketing/reservation/stad_id/gamid_id/zone_id
                    let zone_id = stad_id + zone_ty;
                	let seat_id = zone_id + data-seat;
                    
                	const seatUrl = "ticketing/reservation/"+ stad_id + "/" + game_id + "/"+ zone_ty + "/"+ zone_id; 
//                     selectedSeats.forEach((seat, index) => {
//                         seatUrl += `/${seat.getAttribute('data-seat')}${index < selectedSeats.length - 1? ',' : ''}`;
//                     });
                    window.location.href = seatUrl;
                }
          });
      });
        
        function goBack() {
            window.history.back();
        }

        function goToReservation(stad_id, game_id, zone_ty, seat_id) {
            // 예시: stad_id, gamid_id, zone_id를 이용하여 동적 URL 생성
            const reservationUrl = "/ticketing/reservation/" + stad_id +"/" + game_id + "/" + zone_ty + "/"+ seat_id;
            location.href = reservationUrl; // URL로 이동
        }
    </script>
</body>
</html>
