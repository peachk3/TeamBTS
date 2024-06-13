<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>좌석 선택</title>

	<style>

        .container {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: white;
            gap: 20px;
        }

        .seating-chart {
            display: grid;
            grid-template-columns: repeat(3, 50px);
            grid-gap: 10px;
        }
        .seat {
            width: 50px;
            height: 50px;
            background-color: gray;
            border: 1px solid gray;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .seat.selected {
            background-color: red;
        }
        .seat.occupied {
            background-color: black;
            cursor: not-allowed;
        }
        .field {
            grid-column: 1 / -1;
            background-color: black;
            color: white;
            text-align: center;
            padding: 10px;
            margin-bottom: 15px;
            margin-right: 20px;
            margin-left: 20px;
        }
        .selected-seats {
            background-color: #fff;
            padding: 10px;
            border: 1px solid #bbb;
            max-height: 210px;
            width: 200px;
            overflow-y: auto;
            display: none;
        }

        .selected-seats h3{
            margin-top: 0;
            text-align: center;
        }


    </style>
</head>
<body>  
    
    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="/ticketing/ticketing">예매</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/community/community">거래</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/announcement/announcement">고객센터</a>
      </li>
    </ul>
    
    <hr>


    <h2> A 구역 </h2>
    
    <div class="container">
        <div class="seating-chart">
            <div class="field">필드</div>
            <div class="seat" data-seat="1열 A"></div>
            <div class="seat" data-seat="1열 B"></div>
            <div class="seat" data-seat="1열 C"></div>
            <div class="seat" data-seat="2열 A"></div>
            <div class="seat" data-seat="2열 B"></div>
            <div class="seat occupied" data-seat="2열 C"></div>
        </div>
        <div class="selected-seats" id="selected-seats">
            <h3>선택한 좌석</h3>
            <ul id="selected-seats-list" style="list-style-type: none"></ul>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const seats = document.querySelectorAll('.seat:not(.occupied)');

            const selectedSeatsContainer = document.getElementById('selected-seats');
            
            const selectedSeatsList = document.getElementById('selected-seats-list');

            seats.forEach(seat => {
                seat.addEventListener('click', () => {
                    seat.classList.toggle('selected');

                    updateSelectedSeats();
                });
            });
        

        function updateSelectedSeats() {
            const selectedSeats = document.querySelectorAll('.seat.selected');

            selectedSeatsList.innerHTML = '';

            if(selectedSeats.length > 0 ){

                selectedSeatsContainer.style.display ='block';

                selectedSeats.forEach(seat => {const listItem = document.createElement('li');

                listItem.textContent = 'A구역' + " " + seat.getAttribute('data-seat');

                selectedSeatsList.appendChild(listItem);
             });
            
            }else {
                selectedSeatsContainer.style.display = 'none';
            }
            
            }
        });
    </script>
</body>
</html>