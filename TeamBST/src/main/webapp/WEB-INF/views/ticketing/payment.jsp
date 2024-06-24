<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="/../../resources/css/index.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->
    <title>Payment Page</title>
</head>
<body>
<style>

.paymethod {
	width: 250px;
	height: 150px;
	border: 1px solid black;
	text-align: center;
}

#kakaoPay {
	width: 150px;
	height: 80px;
	text-align: center;
}
.modal1 {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.5);
}

.modal1-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 600px;
}

.close1 {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close1:hover,
.close1:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

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

#teamsymbol {
	width: 100px;
	height: 100px;
}

 .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        /* 모달 내용 */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* 닫기 버튼 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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


<div class="modal1" id="termsModal">
  <div class="modal1-content">
    <span class="close1" onclick="closeModal1()">&times;</span>
    <h2>결제 약관 동의</h2>
    <p>여기에 결제와 관련된 약관 내용.</p>
    <p>이러쿵저렁쿵 어쩌구 저쩌구</p>
    <button onclick="agreeTerms()">동의합니다</button>
  </div>
</div>

	<div class="reserve_content">
		<div class="reserve_left">

			<div class="paymethod" onclick="kakaoPay()">
				<p>카카오페이</p>
				<img id="kakaoPay" src="../resources/img/kakaoPay.jpg" alt="kakaoPay">
			</div>


		</div>
		<div class="reserve_right">
			<div class="info-panel">
				<c:forEach var="gs" items="${gameSchedule}">
					<h2>경기 정보</h2>
					<p>
						팀: <span id="team-name">
						${gs.away_team_id} VS ${gs.home_team_id} <br>
						<c:if test="${gs.away_team_id == 'KIWOOM' or gs.home_team_id == 'KIWOOM'}">
						<img id="teamsymbol"src="../resources/team/kiwoom.png" alt="KIWOOM 로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'LOTTE' or gs.home_team_id == 'LOTTE'}">
						<img id="teamsymbol"src="../resources/team/lotte.png" alt="LOTTE 로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'DOSAN' or gs.home_team_id == 'DOSAN'}">
						<img id="teamsymbol"src="../resources/team/dosan.png" alt="DOSAN 로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'HANHWA' or gs.home_team_id == 'HANHWA'}">
						<img id="teamsymbol"src="../resources/team/hanhwa.png" alt="HANHWA 로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'KIA' or gs.home_team_id == 'KIA'}">
						<img id="teamsymbol"src="../resources/team/kiwoom.png" alt="KIA 로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'KT' or gs.home_team_id == 'KT'}">
						<img id="teamsymbol"src="../resources/team/kt.png" alt="KT 로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'NC' or gs.home_team_id == 'NC'}">
						<img id="teamsymbol"src="../resources/team/nc.png" alt="NC로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'SAMSUNG' or gs.home_team_id == 'SAMSUNG'}">
						<img id="teamsymbol"src="../resources/team/samsung.png" alt="SAMSUNG 로고">
						</c:if>
						<c:if test="${gs.away_team_id == 'SSG' or gs.home_team_id == 'SSG'}">
						<img id="teamsymbol"src="../resources/team/ssg.png" alt="SSG 로고">
						</c:if>

						</span>
					</p>
					<p>
						일시: <span id="match-date">${gs.game_date} ${gs.game_time}</span>
					</p>
					<p>
						경기장 : <span id="match-stadium"> 
						<c:if test="${gs.stad_id == 'CW'}">창원 NC 파크</c:if> 
						<c:if test="${gs.stad_id == 'DG'}">대구 라이온즈파크</c:if> 
						<c:if test="${gs.stad_id == 'DJ'}">대전 이글스파크</c:if> 
						<c:if test="${gs.stad_id == 'GC'}">고척 스카이돔</c:if> 
						<c:if test="${gs.stad_id == 'GJ'}">광주 챔피언스필드</c:if> 
						<c:if test="${gs.stad_id == 'IC'}">인천 랜더스필드</c:if> 
						<c:if test="${gs.stad_id == 'JS'}">서울 잠실야구장</c:if> 
						<c:if test="${gs.stad_id == 'SJ'}">부산 사직야구장</c:if> 
						<c:if test="${gs.stad_id == 'SW'}">수원 KT위즈파크</c:if>
						</span>
					</p>
				</c:forEach>
				<c:forEach var="use" items="${user }">
					<p>예매자명 : ${use.user_name}</p>
				</c:forEach>

				<!-- 선택된 좌석 리스트로 출력해야 함! -->
				<div>
					선택 좌석 : <p id="seatInfo"></p>
				</div>
<%-- 				<c:forEach var="seat" items="${selectedSeat}" varStatus="status"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${status.index == 0}"> --%>
<%-- 								${seat.zone_ty}구역 ${seat.seat_row}열 ${seat.seat_num}번 --%>
<%--             				</c:when> --%>
<%-- 						<c:otherwise> --%>
<%--                 				, ${seat.zone_ty}구역 ${seat.seat_row}열 ${seat.seat_num}번 --%>
<%--             				</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>
				<div>
					티켓 금액: <span id="total-price">0</span>
				</div>
				<p>
					예매 수수료: 장당 1000원 <!-- <span id="booking-fee">0</span> -->
				</p>
				<p>
					취소 기한: 
				</p>
				<p>	
					취소 수수료: 티켓 금액의 0 ~ 10 % <button id="myBtn">상세보기</button>
				</p>
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span class="close">&times;</span>
						<p> 취소 수수료는 1000만원입니다. 참고하시길.</p>
					</div>
				</div>
				<p>
					결제 금액: <span id="total-amount">0</span>
				</p>

			</div>
		</div>

	</div>
	<button type="submit" class="btn_goback" onclick="goBack()">이전으로</button>		
	<button id="payment">구매하기</button> <!-- 결제하기 버튼 생성 -->
    <script src="payment.js"></script>





    
<script type="text/javascript">

// 총 결제 금액 받아오기 (예매 수수료 포함)
var totalAmount = localStorage.getItem('totalAmount');
document.getElementById('total-amount').textContent = totalAmount;

var totalPrice = localStorage.getItem('totalPrice');
document.getElementById('total-price').textContent = totalPrice;

//JavaScript로 모달 보이기/감추기 및 동작 정의
const modal1 = document.getElementById('termsModal');

// 모달 열기
function openModal1() {
  modal1.style.display = 'block';
}

// 모달 닫기
function closeModal1() {
  modal1.style.display = 'none';
}

// 약관 동의 처리
function agreeTerms() {
  // 여기에 동의를 처리하는 로직을 추가할 수 있습니다.
  alert('결제 약관에 동의하셨습니다.');
  closeModal1(); // 동의 후 모달을 닫습니다.
}

window.onload = openModal1;

const currentUrl = window.location.href;

// URL에서 seat_id 추출
const seatIdsIndex = currentUrl.lastIndexOf('&') + 1;
const seatIdsString = currentUrl.substring(seatIdsIndex);
//	const seatRowIndex = currentUrl.

// seat_id 문자열을 쉼표(,)로 분리하여 배열로 생성
const seatIds = seatIdsString.split(',');
//	const 

// 선택된 좌석 수를 계산
let seatCount = seatIds.length;

// 콘솔 출력
console.log(seatCount);

// ****** 예매 수수료 ************
const bookFee = seatCount * 1000;
// document.getElementById('booking-fee').innerText = bookFee;
// ****** 예매 수수료  출력 완료 ************

		
		// 예매 취소 수수료 팝업창
		// 모달 요소
	    var modal2 = document.getElementById("myModal");
	
	    // 버튼 요소
	    var btn = document.getElementById("myBtn");
	
	    // 닫기 버튼 요소
	    var span = document.getElementsByClassName("close")[0];
	
	    // 클릭시 모달 출력
	    btn.onclick = function() {
	        modal2.style.display = "block";
	    }
	
	    // 닫기 클릭시 모달 숨김
	    span.onclick = function() {
	        modal2.style.display = "none";
	    }
	
	    // 외부 클릭시 모달 숨김
	    window.onclick = function(event) {
	        if (event.target == modal2) {
	            modal2.style.display = "none";
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
    
    
    
    function kakaoPay() {
    	//전달할 데이터
    	// 구매자명
    	// 경기 일정(날짜, 해당 팀, 해당 구장, 경기 일시)
    	// 좌석 정보(좌석)
    	// 결제 정보 (가격(수수료를 포함한 총액))
    	// 취소 가능 일자
    	
    	
    	window.open("https://example.com/payment", "PaymentWindow", "width=600,height=400");
    
    	
    
    }
//     document.getElementById("paymethod").addEventListener("click", function() {
//         // Replace the URL with the actual payment window URL
        
//     });
    
    
       
    
    </script>
</body>
</html>
