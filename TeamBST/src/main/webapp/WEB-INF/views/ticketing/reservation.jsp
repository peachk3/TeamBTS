<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" -->
<!-- 	crossorigin="anonymous"> -->
<link href="../resources/css/index.css" rel="stylesheet">
<link href="../resources/css/reservation.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<body>

	<div>
		여기저기
	</div>
	<div>
	 	야모해
	</div>
	<div>
		여기저기 야모해
	</div>
	
	<div class="reserve_content">
		<div class="reserve_left">
			<div class="pointb_box">
				<p class="inner_txt">
					선택하신 좌석을 <b>10분 이내</b>에 결제하지 않으실 경우 선점 좌석이 <b>해제</b>됩니다.
				</p>
			</div>
			<!-- 좌석 매수 표출 -->
			<div class="countSeat">
				선택하신 좌석의 수 :
				<div id="seat-count"></div>
			</div>

			<div id="divPrice">
				<div class="title_box">
					<div class="title_txt">
						 티켓 종류 및 매수 선택 
					</div>
					<form>
						<c:forEach var="sap" items="${seatAdultPrice}">
							<legend class="adultPrice">
								성인 : <label for="adultNum" data-price="${sap.price }"> ${sap.price }원</label>
							</legend>
							<select name="adultNum" id="adultNum" onclick="calculateTotal()">
								<option value="0">매수 선택</option>
								<option value="1">1매 선택</option>
								<option value="2">2매 선택</option>
								<option value="3">3매 선택</option>
								<option value="4">4매 선택</option>
								<option value="5">5매 선택</option>
								<option value="6">6매 선택</option>
							</select>
						</c:forEach>
						<span id="selectedAdult"></span>

						<c:forEach var="scp" items="${seatChildPrice}">
							<legend class="childPrice">
								초등학생 : <label for="childNum" data-price="${scp.price }">${scp.price }원</label>
							</legend>
							<select name="childNum" id="childNum" onclick="calculateTotal()">
								<option value="0">매수 선택</option>
								<option value="1">1매 선택</option>
								<option value="2">2매 선택</option>
								<option value="3">3매 선택</option>
								<option value="4">4매 선택</option>
								<option value="5">5매 선택</option>
								<option value="6">6매 선택</option>
							</select>
						</c:forEach>
						<span id="selectedChild"></span>
						<!-- 			 	<button id="validateButton">확인</button> -->
					</form>
				</div>
			</div>
		</div>

		<div class="reserve_right">
			<div class="info-panel">
				<c:forEach var="gs" items="${gameSchedule}">
					<table class="table1">
						<tr class="tr1">
							<td><span id="team-name"> <%-- ${gs.away_team_id} --%>
									<br> <c:if test="${gs.away_team_id == 'KIWOOM'}">
										<img id="teamsymbol" src="../resources/team/kiwoom.png"
											alt="KIWOOM 로고">
									</c:if> <c:if test="${gs.away_team_id == 'LOTTE'}">
										<img id="teamsymbol" src="../resources/team/lotte.png"
											alt="LOTTE 로고">
									</c:if> <c:if test="${gs.away_team_id == 'DOSAN'}">
										<img id="teamsymbol" src="../resources/team/dosan.png"
											alt="DOSAN 로고">
									</c:if> <c:if test="${gs.away_team_id == 'HANHWA'}">
										<img id="teamsymbol" src="../resources/team/hanhwa.png"
											alt="HANHWA 로고">
									</c:if> <c:if test="${gs.away_team_id == 'KIA'}">
										<img id="teamsymbol" src="../resources/team/kiwoom.png"
											alt="KIA 로고">
									</c:if> <c:if test="${gs.away_team_id == 'KT'}">
										<img id="teamsymbol" src="../resources/team/kt.png"
											alt="KT 로고">
									</c:if> <c:if test="${gs.away_team_id == 'NC'}">
										<img id="teamsymbol" src="../resources/team/nc.png" alt="NC로고">
									</c:if> <c:if test="${gs.away_team_id == 'SAMSUNG'}">
										<img id="teamsymbol" src="../resources/team/samsung.png"
											alt="SAMSUNG 로고">
									</c:if> <c:if test="${gs.away_team_id == 'SSG'}">
										<img id="teamsymbol" src="../resources/team/ssg.png"
											alt="SSG 로고">
									</c:if> <c:if test="${gs.away_team_id == 'LG'}">
										<img id="teamsymbol" src="../resources/team/lg.png"
											alt="LG 로고">
									</c:if></span></td>
							<td>
								<h6 class="vs">VS</h6>
							</td>
							<td><span id="team-name"><br> <c:if
										test="${gs.home_team_id == 'KIWOOM'}">
										<img id="teamsymbol" src="../resources/team/kiwoom.png"
											alt="KIWOOM 로고">
									</c:if> <c:if test="${gs.home_team_id == 'LOTTE'}">
										<img id="teamsymbol" src="../resources/team/lotte.png"
											alt="LOTTE 로고">
									</c:if> <c:if test="${gs.home_team_id == 'DOSAN'}">
										<img id="teamsymbol" src="../resources/team/dosan.png"
											alt="DOSAN 로고">
									</c:if> <c:if test="${gs.home_team_id == 'HANHWA'}">
										<img id="teamsymbol" src="../resources/team/hanhwa.png"
											alt="HANHWA 로고">
									</c:if> <c:if test="${gs.home_team_id == 'KIA'}">
										<img id="teamsymbol" src="../resources/team/kiwoom.png"
											alt="KIA 로고">
									</c:if> <c:if test="${gs.home_team_id == 'KT'}">
										<img id="teamsymbol" src="../resources/team/kt.png"
											alt="KT 로고">
									</c:if> <c:if test="${gs.home_team_id == 'NC'}">
										<img id="teamsymbol" src="../resources/team/nc.png" alt="NC로고">
									</c:if> <c:if test="${gs.home_team_id == 'SAMSUNG'}">
										<img id="teamsymbol" src="../resources/team/samsung.png"
											alt="SAMSUNG 로고">
									</c:if> <c:if test="${gs.home_team_id == 'SSG'}">
										<img id="teamsymbol" src="../resources/team/ssg.png"
											alt="SSG 로고">
									</c:if> <c:if test="${gs.home_team_id == 'LG'}">
										<img id="teamsymbol" src="../resources/team/lg.png"
											alt="LG 로고">
									</c:if></span></td>
						</tr>
					</table>
					<table class="table2">
						<tr>
							<th>일시</th>
							<td><span id="match-date">${gs.game_date}
									${gs.game_time} </span></td>
							<td></td>
						</tr>

						<tr>
							<th>경기장</th>
							<td><span id="match-stadium"> <c:if
										test="${gs.stad_id == 'CW'}">창원 NC 파크</c:if> <c:if
										test="${gs.stad_id == 'DG'}">대구 라이온즈파크</c:if> <c:if
										test="${gs.stad_id == 'DJ'}">대전 이글스파크</c:if> <c:if
										test="${gs.stad_id == 'GC'}">고척 스카이돔</c:if> <c:if
										test="${gs.stad_id == 'GJ'}">광주 챔피언스필드</c:if> <c:if
										test="${gs.stad_id == 'IC'}">인천 랜더스필드</c:if> <c:if
										test="${gs.stad_id == 'JS'}">서울 잠실야구장</c:if> <c:if
										test="${gs.stad_id == 'SJ'}">부산 사직야구장</c:if> <c:if
										test="${gs.stad_id == 'SW'}">수원 KT위즈파크</c:if> <c:if
										test="${gs.stad_id == 'LG'}">서울 잠실야구장</c:if>
							</span></td>
							<td></td>
						</tr>
						<tr>
							<th>예매자명</th>
							<td><c:forEach var="use" items="${user }">${use.user_name}</c:forEach></td>
							<td></td>
						</tr>

						<tr class="selectSeatInfo">
							<th>선택좌석</th>
							<td>
								<%
								String[] seat_rows = request.getParameterValues("seat_row");
								String[] seat_nums = request.getParameterValues("seat_num");
								String[] seat_ids = request.getParameterValues("seat_id");
								%>
								<p id="seatInfo"></p>
							</td>
							<td></td>
						</tr>
						<tr>
							<th>티켓 금액</th>
							<td><span id="total-price">0</span></td>
							<td></td>
						</tr>
						<tr>
							<th>예매 수수료</th>
							<td><span id="booking-fee">0</span></td>
							<td></td>
						</tr>
						<tr>
							<th>취소 수수료</th>
							<td>티켓 금액의 0 ~ 10%</td>
							<td><button id="myBtn">상세보기</button>
								<div id="myModal" class="modal">
									<div class="modal-content">
										<span class="close"> &times;</span>
										<h5>취소 수수료 상세 보기</h5>
										<p>
											* 예매취소 안내(경기 당일 3시간 전까지 취소 가능) <br> * 예매 당일 취소 = 수수료 부과
											없음 * 본인이 예매한 다음 날(0시 기준)부터 경기 당일 3시간 전 취소 = 예매 수수료 + 취소 수수료
											제외한 나머지 환불 이후 취소 불가 <br> * 예매한 내역의 부분 취소 및 날짜, 좌석변경,
											권종변경은 불가합니다.
										</p>
									</div>
								</div></td>
						</tr>

						<tr>
							<th>결제 금액</th>
							<td><span id="total-amount">0</span></td>
						</tr>

					</table>
				</c:forEach>
			</div>
		</div>

	</div>
	<div class="reserve_btn">
		<button type="submit" class="btn_goback" onclick="goBack()">이전으로</button>
		<button type="button" class="btn_payment" id="payment">결제하기</button>
		<form action="/payment" method="get" id="amountForm">
			<input type="hidden" name="totalAmount" id="hidden-total-amount">
			<input type="hidden" name="totalPrice" id="hidden-total-price">
		</form>
	</div>

	<%-- 
//     String zone_ty = request.getParameter("zone_ty");
//     String seatRow = request.getParameter("seat_row");
//     String seatNum = request.getParameter("seat_num");
//     String zone_id = request.getParameter("zone_id");
    	request.getParameter 
	<p>Zone Type: <%= zone_ty %></p>
    <p>Seat Row: <%= seatRow %></p> 
    <p>Seat Number: <%= seatNum %></p>
    <p>Zone ID:<%=zone_id %> --%>

<%--  <hr>
	<!-- 정보 전달 확인창 -->
	<p>Stadium ID : ${stad_id }</p>
	<p>Game ID : ${game_id }</p>
	<p>Zone TY : ${zone_ty }</p>
	<p>Zone ID : ${zone_id }</p>   --%>
<%-- 	<p>Seat ID : ${param.seatIds }</p> --%>

    <% String[] seatIds = request.getParameterValues("seatIds"); %>
    <% for (String seatId : seatIds) { %>
<%--       <p>Seat ID: <%= seatId %><p> --%>
    <% } %>	
<!-- 	<p>Seat ID : <p id="seatInfo"></p> -->



<script type="text/javascript">    
		// 현재 URL
		const currentUrl = window.location.href;

// 		// URL에서 seat_id 추출
// 		const seatIdsIndex = currentUrl.lastIndexOf('&') + 1;
// 		const seatIdsString = currentUrl.substring(seatIdsIndex);
// // 		const seatRowIndex = currentUrl.

// 		// seat_id 문자열을 쉼표(,)로 분리하여 배열로 생성
// 		const seatIds = seatIdsString.split(',');
// // 		const 

// 		// 선택된 좌석 수를 계산
// 		let seatCount = seatIds.length;

// 		// 콘솔 출력
// 		console.log(seatCount);

// 		// 선택된 좌석 수를 화면에 출력
// 		document.getElementById('seat-count').innerText = '선택하신 좌석의 수: '+ seatCount;
		// seatIds가 포함된 부분을 찾기 위해 'seatIds='의 위치를 찾음

		// URL에서 '?' 이후의 쿼리 문자열을 추출
		const queryString = currentUrl.split('?')[1];
		
		// 추출한 쿼리 문자열을 '&'로 분리하여 배열로 만듦
		const paramsArray = queryString.split('&');
		
		let seatIds = [];
		
		// 각 파라미터를 순회하며 seatIds 파라미터를 찾아 값을 추출
		paramsArray.forEach(param => {
		    if (param.startsWith('seatIds=')) {
		        // 'seatIds='로 시작하는 파라미터의 값을 추출
		        const value = param.split('=')[1];
		        // 추출한 값을 ','로 분리하여 seatIds 배열에 추가
		        seatIds.push(...value.split(','));
		    }
		});
		
		// seatIds 배열의 길이를 출력하여 seatIds의 개수를 얻음
		const seatCount = seatIds.length;
		console.log('seatIds의 수:', seatCount);
		document.getElementById('seat-count').innerText = ' '+ seatCount;

		
		
		
		
		
		
		// ***** 여기까지 문제 없음 ******* 

		
		// ****** 예매 수수료 ************
		const bookFee = seatCount * 1000;
		document.getElementById('booking-fee').innerText = bookFee;
		// ****** 예매 수수료  출력 완료 ************


		// **** 총 가격 금액 ********
		function calculateTotal() {
			// 선택된 성인 수
			const selectedAdults = document.getElementById("adultNum").value;
			
			// 선택된 초등학생 수
			const selectedChildren = document.getElementById("childNum").value;

			// 성인 가격
			const adultPrice = parseFloat(document.querySelector('label[for="adultNum"]').getAttribute('data-price'));

			// 초등학생 가격 
			const childPrice = parseFloat(document.querySelector('label[for="childNum"]').getAttribute('data-price'));

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
				 var totalAmount = document.getElementById('total-amount').textContent;
		            localStorage.setItem('totalAmount', totalAmount);
				 var totalPrice = document.getElementById('total-price').textContent;
		            localStorage.setItem('totalPrice', totalPrice);
				// 유효성 검사 통과 시 다음 페이지로 이동
				window.location.href = '/ticketing/payment?stad_id=${stad_id}&game_id=${game_id}&zone_ty=${zone_ty}&zone_id=${zone_id}&seat_row=${seat_row}&seat_num=${seat_num}&seat_id=${seat_id}'; // 이동할 페이지 URL을 설정
				
			}
		};

		// ******* 선택한 좌석 수 = 권종 수 확인 ******** 
		// const validateButton = document.getElementById('payment');
		// validateButton.addEventListener('click', validateSeatSelection);
		// => alret 창 두 번 반복해서 뜸

		function validateSeatSelection() {
			const adultCount = parseInt(
					document.getElementById('adultNum').value, 10);
			const childCount = parseInt(
					document.getElementById('childNum').value, 10);
			const totalSelectedCount = adultCount + childCount;

			if (seatCount !== totalSelectedCount) {
				alert("선택된 좌석 수와 티켓 수가 맞지 않습니다.");
				// history.back();
				return false
			} else {
				// alert("선택된 좌석 수와 티켓 수 동일함 확인되었습니다")
				return true;
			}
		}

		// 예매 취소 수수료 팝업창
		// 모달 요소
	    var modal = document.getElementById("myModal");
	
	    // 버튼 요소
	    var btn = document.getElementById("myBtn");
	
	    // 닫기 버튼 요소
	    var span = document.getElementsByClassName("close")[0];
	
	    // 클릭시 모달 출력
	    btn.onclick = function() {
	        modal.style.display = "block";
	    }
	
	    // 닫기 클릭시 모달 숨김
	    span.onclick = function() {
	        modal.style.display = "none";
	    }
	
	    // 외부 클릭시 모달 숨김
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
		
	    
	    
	    function displayParameters() {
            var params = new URLSearchParams(window.location.search);

            var zoneTypes = params.get("zone_ty").split(",");
            var seatRows = params.get("seat_row").split(",");
            var seatNums = params.get("seat_num").split(",");
            var seatInfo = [];

            for (var i = 0; i < seatRows.length; i++) {
                seatInfo.push(zoneTypes + "구역" + seatRows[i] + "열 " + seatNums[i] + "번");
                
            }

            document.getElementById("seatInfo").innerHTML = seatInfo.join("<br>");
            
        }

        window.addEventListener('load', (event) => {
            displayParameters();
        });
	    
        
        
        function goBack() {
            history.back();
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
<%@ include file="../include/footer.jsp"%>
</body>
</html>
