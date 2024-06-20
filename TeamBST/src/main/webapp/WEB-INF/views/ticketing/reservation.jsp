<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Reservation Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="/../../resources/css/index.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>


<body>

	<style>
.reserve_content {
	display: flex;
	justify-content: space-between;
}

.reserve_left, .reserve_right {
	width: 48%;
}

.pointb_box {
	/* margin-bottom: 2px; */
	border: 1px solid black;
}

.pointb_box2 {
	margin-botton: 20px;
	border: 1px solid black;
}

.inner_txt {
	margin: 3px;
	text-align: center;
}

.inner_txt2 {
	margin: 3px;
	text-align: center;
}

.title_box {
	margin-bottom: 10px;
}

label {
	display: block;
	margin: 10px 0 5px;
}

select {
	width: 100%;
	padding: 5px;
	margin-bottom: 10px;
}

.info-panel p {
	margin: 10px 0;
}

.reserve_left, .reserve_right {
	border: 1px solid black;
	margin: 10px 10px;
	padding: 10px 10px;
}

#payment {
	text-align: center;
	float: right;
	width: 100px;
	height: 40px;
	background-color: skyblue;
	color: white;
	border: 1px solid black;
}
</style>


	<nav>
		<a href="/main/main"><h1>개바리조</h1></a>

		<h6>
			<a href="/login/login">로그인/</a> <a href="/mypage/mypage">마이페이지/</a> <a
				href="/admin/admin">관리자페이지/</a> 로그인시간 ( 58: 00 )
		</h6>
	</nav>


	<ul class="nav">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="/ticketing/ticketing">예매</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/community/community">거래</a></li>
		<li class="nav-item"><a class="nav-link"
			href="/announcement/announcement">고객센터</a></li>
	</ul>

	<div class="reserve_content">
		<div class="reserve_left">
			<div class="pointb_box">
				<p class="inner_txt">"선택하신 좌석을 10분 이내에 결제하지 않으실 경우 선점 좌석이
					해제됩니다."</p>
			</div>
			<!-- 좌석 매수 표출 -->
			<div id="seat-count"></div>

			<div id="divPrice">
				<div class="title_box">
					<h5 class="title title_txt">티켓종류 매수 선택</h5>
				</div>

				<form>
					<c:forEach var="sap" items="${seatAdultPrice}">
						<label for="adultNum" data-price="${sap.price }">성인:
							${sap.price } </label>
						<select name="adultNum" id="adultNum" onclick="calculateTotal()">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</c:forEach>
					<span id="selectedAdult"></span>

					<c:forEach var="scp" items="${seatChildPrice}">
						<label for="childNum" data-price="${scp.price }">초등학생:${scp.price }
						</label>
						<select name="childNum" id="childNum" onclick="calculateTotal()">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
					</c:forEach>
					<span id="selectedChild"></span>
					<!-- 			 	<button id="validateButton">확인</button> -->
				</form>
			</div>
		</div>

		<div class="reserve_right">
			<div class="info-panel">
				<c:forEach var="gs" items="${gameSchedule}">
					<h2>경기 정보</h2>
					<p>
						팀: <span id="team-name">${gs.away_team_id} VS
							${gs.home_team_id}</span>
					</p>
					<p>
						일시: <span id="match-date">${gs.game_date} ${gs.game_time}</span>
					</p>
					<p>
						경기장 : <span id="match-stadium"> <c:if
								test="${gs.stad_id == 'CW'}">창원 NC 파크</c:if> <c:if
								test="${gs.stad_id == 'DG'}">대구 라이온즈파크</c:if> <c:if
								test="${gs.stad_id == 'DJ'}">대전 이글스파크</c:if> <c:if
								test="${gs.stad_id == 'GC'}">고척 스카이돔</c:if> <c:if
								test="${gs.stad_id == 'GJ'}">광주 챔피언스필드</c:if> <c:if
								test="${gs.stad_id == 'IC'}">인천 랜더스필드</c:if> <c:if
								test="${gs.stad_id == 'JS'}">서울 잠실야구장</c:if> <c:if
								test="${gs.stad_id == 'SJ'}">부산 사직야구장</c:if> <c:if
								test="${gs.stad_id == 'SW'}">수원 KT위즈파크</c:if>
						</span>
					</p>
				</c:forEach>
				<c:forEach var="use" items="${user }">
					<p>예매자명 : ${use.user_name}</p>
				</c:forEach>

				<!-- 선택된 좌석 리스트로 출력해야 함! -->
				<p>
					선택 좌석 :
					<%-- 					<c:forEach var="seat" items="${selectedSeat}" varStatus="status"> --%>
					<c:choose>
						<c:when test="${status.index == 0}">
								${seat.zone_ty}구역 ${seat.seat_row}열 ${seat.seat_num}번
            				</c:when>
						<c:otherwise>
                				, ${seat.zone_ty}구역 ${seat.seat_row}열 ${seat.seat_num}번
            				</c:otherwise>
					</c:choose>
					<%-- 					</c:forEach> --%>
					<span id="selected-seats"> </span>
				</p>
				<div>
					티켓 금액: <span id="total-price">0</span>
				</div>
				<p>
					예매 수수료: <span id="booking-fee">0</span>
				</p>
				<p>
					결제 금액: <span id="total-amount">0</span>
				</p>

			</div>
		</div>

	</div>

	<form action="/payment">
		<!-- method="post" -->
		<%--         <input type="hidden" name="schedule_id" value="${schedule.schedule_id}"> --%>
		<%--         <input type="hidden" name="seat_id" value="${seat.seat_id}"> --%>
		<button type="button" id="payment">결제하기</button>
	</form>


	<h1>예매</h1>

	<p>Stadium ID : ${stad_id }</p>
	<p>Game ID : ${game_id }</p>
	<p>Zone ID : ${stad_id}${zone_ty}</p>
	<p>Seat ID : ${seat_row }열 ${seat_num }번</p>


	<script type="text/javascript">
		//    window.onload = function() {

		// 현재 URL을 가져옵니다.
		const currentUrl = window.location.href;

		// URL에서 좌석 ID 부분을 추출합니다.
		const seatIdsIndex = currentUrl.lastIndexOf('/') + 1;
		const seatIdsString = currentUrl.substring(seatIdsIndex);

		// 좌석 ID 문자열을 쉼표(,)로 분리하여 배열로 만듭니다.
		const seatIds = seatIdsString.split(',');

		// 선택된 좌석 수를 계산
		let seatCount = seatIds.length;

		// 콘솔에 seatCount 출력
		console.log(seatCount);

		// 선택된 좌석 수를 화면에 출력
		document.getElementById('seat-count').innerText = '선택하신 좌석의 수: '
				+ seatCount;

		// ***** 여기까지 문제 없음 ******* 

		// ****** 예매 수수료 ************
		const bookFee = seatCount * 1000;
		document.getElementById('booking-fee').innerText = bookFee;
		// ****** 예매 수수료  출력 완료 ************


		// **** 총 가격 금액 ********
		function calculateTotal() {
			// 선택된 성인 수
			const selectedAdults = document.getElementById("adultNum").value;

			// 성인 가격 (서버에서 가져온 가격)
			const adultPrice = parseFloat(document.querySelector(
					'label[for="adultNum"]').getAttribute('data-price'));
			//             var adultPrice = document.getAttribute('data-price'); // 여기서 sap.price는 서버에서 가져온 가격으로 대체되어야 합니다.

			const childPrice = parseFloat(document.querySelector(
					'label[for="childNum"]').getAttribute('data-price'));

			// 선택된 초등학생 수
			const selectedChildren = document.getElementById("childNum").value;

			// 계산된 결과
			const totalAdultPrice = selectedAdults * adultPrice;
			const totalChildPrice = selectedChildren * childPrice;
			const totalPrice = totalAdultPrice + totalChildPrice;

			// 결과를 출력할 위치
			const selectedAdultElement = document.getElementById("total-price");
			selectedAdultElement.textContent = totalPrice;

			// 티켓 가격의 총합 (수수료 + 티켓 가격)
			const allTotalPrice = bookFee + totalPrice;
			document.getElementById('total-amount').innerText = allTotalPrice;
		}
		// **** 총 가격 금액 성공 ********

		// 	 // 성인 수 선택 요소
		// 	    const adultSelect = document.getElementById('adultNum');
		// 	    // 청소년 수 선택 요소
		// 	    const childSelect = document.getElementById('childNum');

		// 	    // 선택된 성인 수를 화면에 업데이트하는 함수
		// 	    function updateSelectedAdultCount() {
		// 	        const selectedAdultCount = document.getElementById('selectedAdult');
		// 	        selectedAdultCount.textContent = adultSelect.value;
		// 	    }

		//         // 모든 select 요소에 change 이벤트 리스너 추가
		//         document.querySelectorAll('select').forEach(select => {
		//             select.addEventListener('change', () => {
		//                 calculateTotal();
		//                 updateSelectedAdultCount();
		//             });
		//         });
		// //     // 선택된 청소년 수를 화면에 업데이트하는 함수
		// //     function updateSelectedChildCount() {
		// //         const selectedChildCount = document.getElementById('selectedChild');
		// //         selectedChildCount.textContent = childSelect.value;
		// //     }

		// //     // 성인 수 선택 요소의 변경 이벤트 리스너 추가
		// //     adultSelect.addEventListener('change', updateSelectedAdultCount);
		// //     // 청소년 수 선택 요소의 변경 이벤트 리스너 추가
		// //     childSelect.addEventListener('change', updateSelectedChildCount);

		// //     // 초기 페이지 로딩 시 선택된 값으로 업데이트
		// //     updateSelectedAdultCount();
		// //     updateSelectedChildCount();	

		// //     document.querySelectorAll('select').forEach(select => {
		// //             select.addEventListener('change', updateTotal);
		// //         });

		// //         function updateTotal() {
		// //             let total = 0;
		// //             document.querySelectorAll('select').forEach(select => {
		// //             	const label = document.querySelector(`label[for="${select.id}"]`);
		// //                 const price = parseFloat(label.getAttribute('data-price')) || 1;
		// //                 total += (parseFloat(select.value) || 0) * price;
		// //             });
		// //             document.getElementById('total-price').innerText = total;
		// //         }

		// //         // Initialize the total on page load
		// //         updateTotal();

		// 기존에 등록된 onclick 이벤트 핸들러 제거
		// document.getElementById('payment').onclick = null;

		// 결제 버튼에 onclick 이벤트 핸들러 추가
		document.getElementById('payment').onclick = function() {
			// validateSeatSelection 함수를 호출하여 확인
			if (validateSeatSelection()) {
				// 유효성 검사 통과 시 다음 페이지로 이동
				window.location.href = '/ticketing/payment'; // 이동할 페이지 URL을 설정
			}
		};

		// ******* 선택한 좌석 수 = 권종 수 확인 ******** 
// 		const validateButton = document.getElementById('payment');
// 		validateButton.addEventListener('click', validateSeatSelection);
		// => alret 창 두 번 반복해서 뜸

		function validateSeatSelection() {
			const adultCount = parseInt(
					document.getElementById('adultNum').value, 10);
			const childCount = parseInt(
					document.getElementById('childNum').value, 10);
			const totalSelectedCount = adultCount + childCount;

			if (seatCount !== totalSelectedCount) {
				alert("선택된 좌석 수와 티켓 수가 맞지 않습니다.");
				// 							history.back();
				return false
			} else {
				// alert("선택된 좌석 수와 티켓 수 동일함 확인되었습니다")
				return true;
			}
		}

		// ******* 선택한 좌석 수 = 권종 수 확인 ******** 

		// 					function validateSeatSelection() {
		// 						const adultCount = parseInt(document
		// 								.getElementById('adultNum').value, 10);
		// 						const childCount = parseInt(document
		// 								.getElementById('childNum').value, 10);
		// 						const totalSelectedCount = adultCount + childCount;

		// 						// 여기서 selectedSeats 변수가 어디서 온 것인지 명확하지 않으므로 확인이 필요합니다.
		// 						// 선택된 좌석 수와 티켓 수가 맞는지 비교하는 조건문에서 이를 어떻게 설정해야 하는지에 대한 추가 정보가 필요합니다.

		// 						if (seatCount !== totalSelectedCount) {
		// 							alert("선택된 좌석 수와 티켓 수가 맞지 않습니다.");
		// 							history.back();
		// 							return false;
		// 						} else {
		// 							alert("선택된 좌석 수와 티켓 수 동일함 확인되었습니다")

		// 						}
		// 					}

		//   }
	</script>

</body>
</html>
