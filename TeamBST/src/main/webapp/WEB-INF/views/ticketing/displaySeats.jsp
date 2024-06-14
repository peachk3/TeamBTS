<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Display Seats</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
        }
        .seating-chart {
            display: grid;
            grid-template-columns: repeat(3, 50px);
            gap: 10px;
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
        .seat.selected {
            background-color: #6c7ae0;
        }
        .seat.occupied {
            background-color: #ff4b5c;
            cursor: not-allowed;
        }
        .field {
            grid-column: span 3;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        .selected-seats {
            display: block;
        }
    </style>
</head>
<body>
    <h1>Selected Zone: ${zone_id}구역</h1>
    <div class="container">
        <div class="seating-chart">
            <div class="field">필드</div>
            <!-- 좌석 배치 예제 -->
            <div class="seat" data-seat="1A">1A</div>
            <div class="seat" data-seat="1B">1B</div>
            <div class="seat" data-seat="1C">1C</div>
            <div class="seat" data-seat="2A">2A</div>
            <div class="seat" data-seat="2B">2B</div>
            <div class="seat occupied" data-seat="2C">2C</div>
        </div>
        <div class="selected-seats" id="selected-seats">
            <h3>선택한 좌석</h3>
            <ul id="selected-seats-list" style="list-style-type: none">
                <li id="no-seats">선택한 좌석이 없습니다</li>
            </ul>
        </div>
    </div>
    <div>
    	<button id="reservation"  onclick="location.href='/ticketing/reservation'"> 예매하기 </button>
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
                        listItem.textContent = '${param.zone}구역 ' + seat.getAttribute('data-seat');
                        selectedSeatsList.appendChild(listItem);
                    });
                } else {
                    const listItem = document.createElement('li');
                    listItem.id = 'no-seats';
                    listItem.textContent = '선택한 좌석이 없습니다';
                    selectedSeatsList.appendChild(listItem);
                }
            }

            updateSelectedSeats(); // 페이지 로드 시 초기화
        });
    </script>
</body>
</html>
